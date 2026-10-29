unit UREmbarque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFREmbarque = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText11: TQRDBText;
    QRBRodPedido: TQRBand;
    QRBand4: TQRBand;
    QRLabel12: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    QrDescricao: TQRLabel;
    QRLabel14: TQRLabel;
    QrNrNota: TQRLabel;
    QRCompositeReport1: TQRCompositeReport;
    LblPes: TQRLabel;
    LblQtPes: TQRLabel;
    LblVidros: TQRLabel;
    LblQtVidros: TQRLabel;
    QRLTotal: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText14: TQRDBText;
    QRLTransportador: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText16: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText18: TQRDBText;
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBRodPedidoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREmbarque: TFREmbarque;

implementation

uses UEmbarque_cl, UREmbarque2, UREmbarque3, UOracle_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFREmbarque.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FREmbarque.QRPrimario);
  QRCompositeReport1.Reports.Add(FREmbarque2.QRPrimario);
  QRCompositeReport1.Reports.Add(FREmbarque3.QRPrimario);
end;

procedure TFREmbarque.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DmEmbarque do
  Begin
    QrDescricao.Caption := Trim(QrEmbarqueDesc_Produto.Value) + '-' +Trim(QrEmbarqueDesc_Lote.Value)+ '-' +Trim(QrEmbarqueCod_Produto.Text);
    QrlTotal.Caption := FloatToStr(StrToFloat(QrlTotal.Caption) + QrEmbarqueSQt_Pedido.Value);
  End;
end;

procedure TFREmbarque.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var wEmpresa : String;
begin
  inherited;
  With DmEmbarque do
  begin
    QrlTotal.Caption := '0';
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO') or
       (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ') Then
      FrEmbarque2.QrNrPedidos.Caption := FrEmbarque2.QRNrPedidos.Caption + QREmbarqueCOD_PEDIDO_CAB.Text+' '
    else
      FrEmbarque2.QrNrPedidos.Caption := FrEmbarque2.QRNrPedidos.Caption + QrEmbarqueNum_Pedido.Text+' ';
    QrAchaNrNota.Close;
    QrAchaNrNota.SetVariable('PK',QrEmbarqueCod_Pedido_Item.Value);
    QrAchaNrNota.Open;
    if QrAchaNrNota.RecordCount > 0 then
     begin
       QrNrNota.Caption := FloatToStr(QrAchaNrNotaNum_Nota.Value);
       QrlTransportador.Caption := QrAchaNrNotaDesc_Transportadora.Value;
     end
    Else
     Begin
       QrNrNota.Caption := ' ';
       QrlTransportador.Caption := '';
     End;
    QrAchaNrNota.Close;
    wEmpresa := DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA', 'COD_FILIAL > 0');
    if wEmpresa = 'CGS' Then
    Begin
       LblPes.Caption := 'Pes:';
       LblQtPes.Caption := FloatToStr(QrEmbarqueQt_Pes.Value);
       QrlTotal.Caption := FloatToStr(StrToFloat(QrlTotal.Caption) + QrEmbarqueQt_Pes.Value);
       LblVidros.Caption := 'Vidros:';
       LblQtVidros.Caption := FloatToStr(QrEmbarqueQt_Vidros.Value);
       QrlTotal.Caption := FloatToStr(StrToFloat(QrlTotal.Caption) + QrEmbarqueQt_Vidros.Value);
       If QrlTransportador.Caption = '' Then
          QrlTransportador.Caption :=  QrEmbarqueDesc_Complemento_Obs.Value;
    end
    Else
    Begin
       LblPes.Caption := '';
       LblQtPes.Caption := '';
       LblVidros.Caption := '';
       LblQtVidros.Caption := '';
    end;
  end;

end;

procedure TFREmbarque.QRBRodPedidoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QrLTotal.Caption := FormatFloat('###,##0',StrToFloat(QrlTotal.Caption));
end;

end.
