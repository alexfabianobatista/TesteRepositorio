unit UREmbarque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt,
  Barcode, Clipbrd, StdCtrls, DBCtrls;

type
  TFREmbarque = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLProduto: TQRLabel;
    QRLQuantidade: TQRLabel;
    QRDBText6: TQRDBText;
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
    QRLVolumes: TQRLabel;
    QRLPeso: TQRLabel;
    QRLValor: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBTValUn: TQRDBText;
    QRICodigoBarraPedido: TQRImage;
    QRICodigoBarraEmbarque: TQRImage;
    QRLConferidoMotorista: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel22: TQRLabel;
    QRCodTributacao: TQRDBText;
    QRLabel23: TQRLabel;
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBRodPedidoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FCode: TBarCode;
    FCodigoBarra: Boolean;
    procedure SetCodigoBarra(const Value: Boolean);
  public
    property CodigoBarra: Boolean read FCodigoBarra write SetCodigoBarra default False;
  end;

var
  FREmbarque: TFREmbarque;

implementation

uses UEmbarque_cl, UREmbarque2, UREmbarque3, UOracle_cl, UParamSistema_cl,
  UREmbarqueTemperatura, UPedido_cl, DB;

{$R *.DFM}

procedure TFREmbarque.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FREmbarque.QRPrimario);
//  QRCompositeReport1.Reports.Add(FREmbarque3.QRPrimario);
  QRCompositeReport1.Reports.Add(FREmbarque2.QRPrimario);
  
  if (DMParamSistema.CodEmpresa <> 'DEION') and (DMParamSistema.CodEmpresa <> 'BIGMETAL') then
  begin
    QRCompositeReport1.Reports.Add(FREmbarqueTemperatura.QRPrimario);
  end;
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
  if DMParamSistema.QParamSistemaCOD_EMPRESA.VALUE = 'ABATE' then
  Begin
    QRDBText19.Enabled := True;
    QRDBText20.Enabled := True;
    QRDBText21.Enabled := True;
//    QrDescricao.Width := 430;
    QrDescricao.Width := 360;
    QRDBTValUn.Enabled := True;
  end;
end;

procedure TFREmbarque.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DmEmbarque do
  begin
    QrlTotal.Caption := '0';
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
    if DMParamSistema.QParamSistemaCOD_EMPRESA.VALUE = 'CGS' Then
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
      LblVidros.Caption := '';
      LblQtVidros.Caption := '';
      LblPes.Caption := '';
      LblQtPes.Caption := '';
      if DMParamSistema.QParamSistemaCOD_EMPRESA.VALUE = 'ABATE' Then
      begin
        QRLVolumes.Enabled := True;
        QRLPeso.Enabled := True;
        QRLValor.Enabled := True;
        LblQtVidros.Caption := 'Vlr Un.';
        LblQtVidros.Enabled := True;
      end;
    end;
    
    //Código de barras
    QRICodigoBarraPedido.Enabled := FCodigoBarra;
    if FCodigoBarra then
    begin
      FCode.BarcodeType := btCode39;
      //Formação do código de barras:
      //de 1 à 7: Zeros para diferenciar do código de barras de uma pesagem, que possui a pesagem nos 7 primeiros digitos;
      //8: Identificador de pedido (caracter 2);
      //9 à 14: Código do pedido, no formato 000000.
      FCode.Digits := '0000000' + '2' + FormatFloat('000000',DMEmbarque.QREmbarqueCOD_PEDIDO_CAB.Value);
      FCode.BarcodeCopy;
      QRICodigoBarraPedido.Picture.Assign(Clipboard);
    end;
  end;
end;

procedure TFREmbarque.QRBRodPedidoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QrLTotal.Caption := FormatFloat('###,##0',StrToFloat(QrlTotal.Caption));
end;

procedure TFREmbarque.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRICodigoBarraEmbarque.Enabled := FCodigoBarra;
  if FCodigoBarra then
  begin
    FCode.BarcodeType := btCode39;
    //Formação do código de barras:
    //de 1 à 7: Zeros para diferenciar do código de barras de uma pesagem, que possui a pesagem nos 7 primeiros digitos;
    //8: Identificador de embarque (caracter 1);
    //9 à 14: Código do embarque, no formato 000000.
    FCode.Digits := '0000000' + '1' + FormatFloat('000000',DMEmbarque.QREmbarqueCOD_EMBARQUE.Value);
    FCode.BarcodeCopy;
    QRICodigoBarraEmbarque.Picture.Assign(Clipboard);
  end;
  QRLConferidoMotorista.Caption := '';
  if DMEmbarque.QREmbarqueIND_CONFERIDO_MOTORISTA.Value = 'N' then
     QRLConferidoMotorista.Caption := 'Embarque NÃO conferido pelo motorista.'
  else if DMEmbarque.QREmbarqueIND_CONFERIDO_MOTORISTA.Value = 'S' then
       QRLConferidoMotorista.Caption := 'Embarque conferido pelo motorista.';
End;

procedure TFREmbarque.SetCodigoBarra(const Value: Boolean);
begin
  FCodigoBarra := Value;
  if (FCodigoBarra) and (FCode = nil) then
    FCode := TBarcode.Create(Application);
end;

procedure TFREmbarque.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZAPOLI' then
  begin
    QRDBText3.DataField := 'DESC_FANTASIA';
  end;
end;

procedure TFREmbarque.FormCreate(Sender: TObject);
begin
  inherited;
  //QRLSubstituicao.Enabled := False;
  //QRSubstituicao.Enabled := False;
end;

end.
