unit URRegSaidaIcms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFrRegSaidaIcms = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel15: TQRLabel;
    QRShape7: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape8: TQRShape;
    QRLabel23: TQRLabel;
    QRShape9: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape11: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape12: TQRShape;
    QRLabel31: TQRLabel;
    QRShape13: TQRShape;
    QRLabel30: TQRLabel;
    QRShape14: TQRShape;
    QRLabel32: TQRLabel;
    QRShape15: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape16: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel44: TQRLabel;
    QRShape19: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape37: TQRShape;
    QRLabel53: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape17: TQRShape;
    QRShape20: TQRShape;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    QRBand3: TQRBand;
    QRDBTSerie: TQRDBText;
    QRDBTUFDestino: TQRDBText;
    QRDBTEspecie: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRDBTNatOperacao: TQRDBText;
    QRDBTNumNota: TQRDBText;
    QRShape38: TQRShape;
    QRDBTDia: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape4: TQRShape;
    QRShape10: TQRShape;
    QRShape18: TQRShape;
    QRShape23: TQRShape;
    QRShape26: TQRShape;
    QRShape30: TQRShape;
    QRDBTValContabil: TQRDBText;
    QRDBText4: TQRDBText;
    QRObservacao: TQRLabel;
    QRBand4: TQRBand;
    QRLabel69: TQRLabel;
    QRLTotalBaseICM: TQRLabel;
    QRLTotalICM: TQRLabel;
    QRLICM_APAGAR: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    fUltimoImpresso : Real;
    fUltimoEspecie : String;
    fSBaseCalcICM : Real;
    fSBaseCalcIPI : Real;
    fSICMDebitado : Real;
    fSICMPagar : Real;
    fSIPIDebitado : Real;
    fSBaseIsentaICM : Real;
    fSBaseIsentaIPI : Real;
    fSBaseOutrasICM : Real;
    fSBaseOutrasIPI : Real;
  public
    { Public declarations }
    Property pUltimoImpresso : Real Read fUltimoImpresso Write fUltimoImpresso;
    Property pUltimoEspecie : String Read fUltimoEspecie Write fUltimoEspecie;
    Property pSBaseCalcICM : Real Read fSBaseCalcICM Write fSBaseCalcICM;
    Property pSBaseCalcIPI : Real Read fSBaseCalcIPI Write fSBaseCalcIPI;
    Property pSICMDebitado : Real Read fSICMDebitado Write fSICMDebitado;
    Property pSICMPagar : Real Read fSICMPagar Write fSICMPagar;
    Property pSIPIDebitado : Real Read fSIPIDebitado Write fSIPIDebitado;
    Property pSBaseIsentaICM : Real Read fSBaseIsentaICM Write fSBaseIsentaICM;
    Property pSBaseIsentaIPI : Real Read fSBaseIsentaIPI Write fSBaseIsentaIPI;
    Property pSBaseOutrasICM : Real Read fSBaseOutrasICM Write fSBaseOutrasICM;
    Property pSBaseOutrasIPI : Real Read fSBaseOutrasIPI Write fSBaseOutrasIPI;
  end;

var
  FrRegSaidaIcms: TFrRegSaidaIcms;

implementation

uses URegSaida_cl;

{$R *.dfm}

procedure TFrRegSaidaIcms.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  pUltimoImpresso := 0;
  pUltimoEspecie := '';
  pSBaseCalcICM := 0;
  pSBaseCalcIPI := 0;
  pSICMDebitado := 0;
  pSICMPagar := 0;
  pSIPIDebitado := 0;
  pSBaseIsentaICM := 0;
  pSBaseIsentaIPI := 0;
  pSBaseOutrasICM := 0;
  pSBaseOutrasIPI := 0;

end;

procedure TFrRegSaidaIcms.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DMRegSaida do
  Begin
    If TRIM(QRegSaidaIcmsDesc_Obs.Text) = 'FUTURA' Then
       QRObservacao.Caption := Trim(QRegSaidaIcmsDesc_Obs.Text) +' '+ FormatFloat('##,###,##0.00',QRegSaidaIcmsVal_Observacao.Value)
    Else
      If TRIM(QRegSaidaIcmsDesc_Obs.Text) = 'CANCELADA' Then
         QRObservacao.Caption := 'CANCELADA'
      Else
         QRObservacao.Caption := '';
    If (pUltimoImpresso = QRegSaidaIcmsCod_Nota_Cab.Value) And
       (pUltimoEspecie = QRegSaidaIcmsESPECIE.Value) Then
    Begin
      QRDBTEspecie.Font.Color := clWhite;
      QRDBTSerie.Font.Color := clWhite;
      QRDBTNumNota.Font.Color := clWhite;
      QRDBTDia.Font.Color := clWhite;
      QRDBTUFDestino.Font.Color := clWhite;
//      QRDBTNatOperacao.Font.Color := clWhite;
      QRDBTValContabil.Font.Color := clWhite;
    End
    Else
    Begin
      QRDBTEspecie.Font.Color := clBlack;
      QRDBTSerie.Font.Color := clBlack;
      QRDBTNumNota.Font.Color := clBlack;
      QRDBTDia.Font.Color := clBlack;
      QRDBTUFDestino.Font.Color := clBlack;
      QRDBTNatOperacao.Font.Color := clBlack;
      QRDBTValContabil.Font.Color := clBlack;
    End;

    pUltimoImpresso := QRegSaidaIcmsCod_Nota_Cab.Value;
    pUltimoEspecie := QRegSaidaIcmsESPECIE.Value;

    If (QRegSaidaIcmsTipo_Imposto.Value = 'ICMS') Or
       (QRegSaidaIcmsTipo_Imposto.Value = 'ISS') Then
    Begin
      pSBaseCalcICM := pSBaseCalcICM+QRegSaidaIcmsVal_Base_Calculo1.Value;
      pSICMDebitado := pSICMDebitado+QRegSaidaIcmsVal_Debitado1.Value;
      pSBaseIsentaICM := pSBaseIsentaICM+QRegSaidaIcmsVal_Base_Isenta.Value;
      pSBaseOutrasICM := pSBaseOutrasICM+QRegSaidaIcmsVal_Base_Outras1.Value;
      pSICMPagar := pSICMPagar + QRegSaidaIcmsVAL_ICMS_APAGAR.Value;
    End
    Else
    Begin
      pSBaseCalcIPI := pSBaseCalcIPI+QRegSaidaIcmsVal_Base_Calculo1.Value;
      pSIPIDebitado := pSIPIDebitado+QRegSaidaIcmsVal_Debitado1.Value;
      pSBaseIsentaIPI := pSBaseIsentaIPI+QRegSaidaIcmsVal_Base_Isenta.Value;
      pSBaseOutrasIPI := pSBaseOutrasIPI+QRegSaidaIcmsVal_Base_Outras1.Value;
      pSICMPagar := pSICMPagar + QRegSaidaIcmsVAL_ICMS_APAGAR.Value;
    End;
    If (QRegSaidaIcmsTIPO_IMPOSTO.Value = 'IPI')
      and (QRegSaidaIcmsVal_Base_Calculo1.Value = 0) Then
      PrintBand := False;

  End;

end;

procedure TFrRegSaidaIcms.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLTotalBaseICM.Caption := FormatFloat('###,###,##0.00',pSBaseCalcICM);
  QRLTotalICM.Caption := FormatFloat('###,###,##0.00',pSICMDebitado);
//  QRLICM_Isento.Caption := FormatFloat('###,###,##0.00',pSBaseIsentaICM);
//  QRLICM_Outras.Caption := FormatFloat('###,###,##0.00',pSBaseOutrasICM);
  QRLICM_APAGAR.Caption := FormatFloat('###,###,##0.00',pSICMPagar);

end;

procedure TFrRegSaidaIcms.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  DMRegSaida.PCod_NotaCab := 0;
end;

end.
