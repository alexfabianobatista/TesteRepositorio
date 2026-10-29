unit URContratoVenda_Custos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFrContratoVenda_Custos = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText20: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel33: TQRLabel;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel22: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRDBText24: TQRDBText;
    QRLabel23: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel34: TQRLabel;
    QRShape13: TQRShape;
    QRExpr6: TQRExpr;
    QRLabel35: TQRLabel;
    QRShape14: TQRShape;
    QRDBText10: TQRDBText;
    QRLabel36: TQRLabel;
    QRShape15: TQRShape;
    QRDBText25: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    QRLabel32: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape16: TQRShape;
    QRDBText5: TQRDBText;
    QRShape17: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape18: TQRShape;
    QRDBText16: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrContratoVenda_Custos: TFrContratoVenda_Custos;
implementation

uses Ucontrato_cl, URContratoVenda_Custos1;

{$R *.DFM}

procedure TFrContratoVenda_Custos.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var wTotal_Cr,wValor_Aux : Real;
begin
  inherited;
  wDolar := 0;
  wCusto := 0;
  wQuant := 0;
  wValor := 0;
  DMContrato.QRContrato_Vend_Recebimento.Close;
  DMContrato.QRContrato_Vend_Recebimento.SetVariable('COD_CONTRATO_VEND',DMContrato.QRcontrato_VendCod_Contrato_Vend.Value);
  DMContrato.QRContrato_Vend_Recebimento.Open;
  DMContrato.QRContrato_Vend_Recebimento.First;
  wTotal_Cr := 0;
  QRMemo1.Lines.Clear;
  While Not DMContrato.QRContrato_Vend_Recebimento.Eof do
   Begin
     wValor_Aux := DMContrato.QRContrato_Vend_RecebimentoVal_Movimento.Value;
     If DMContrato.QRContrato_Vend_RecebimentoInd_Tipo_Movimento.Value = 'DESC. CONCEDIDO' Then
        wValor_Aux := wValor_Aux * (-1);
     QRMemo1.Lines.Add(DMContrato.QRContrato_Vend_RecebimentoDt_Movimento.Text + '  ' + FormatFloat('#,##0.00',wValor_Aux)+'  '+DMContrato.QRContrato_Vend_RecebimentoInd_Tipo.Text);
     wTotal_Cr := wTotal_Cr + wValor_Aux;
     DMContrato.QRContrato_Vend_Recebimento.Next;
   End;
   QRMemo1.Lines.Add('Total--> ' + FormatFloat('#,##0.00',wTotal_Cr));
end;

procedure TFrContratoVenda_Custos.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FRContratoVenda_Custos.QRPrimario);
  QRCompositeReport1.Reports.Add(FRContratoVenda_Custos1.QRPrimario);

end;

end.
