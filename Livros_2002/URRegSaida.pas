unit URRegSaida;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Dialogs;

type
  TFRRegSaida = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBDetalhe: TQRBand;
    QRDBTSerie: TQRDBText;
    QRDBTUFDestino: TQRDBText;
    QRDBTEspecie: TQRDBText;
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
    QRBand3: TQRBand;
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
    QRShape17: TQRShape;
    QRDBText7: TQRDBText;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape19: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape20: TQRShape;
    QRDBText10: TQRDBText;
    QRLNomeFilial: TQRLabel;
    QRLInscricaoFilial: TQRLabel;
    QRLCGCFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel69: TQRLabel;
    QRLTotalBaseICM: TQRLabel;
    QRLTotalICM: TQRLabel;
    QRLICM_ISENTO: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLPaginaI: TQRLabel;
    QRDBTNatOperacao: TQRDBText;
    QRShape37: TQRShape;
    QRLabel53: TQRLabel;
    QRDBTNumNota: TQRDBText;
    QRShape38: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBTDia: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape4: TQRShape;
    QRShape10: TQRShape;
    QRShape18: TQRShape;
    QRShape23: TQRShape;
    QRShape26: TQRShape;
    QRShape30: TQRShape;
    QRDBTValContabil: TQRDBText;
    QRLabel11: TQRLabel;
    QRLICM_OUTRAS: TQRLabel;
    QRDBText4: TQRDBText;
    QRBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRObservacao: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FRRegSaidaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBDetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    fPaginaCorrente : Integer;
    fUltimoImpresso : Real;
    fUltimoEspecie : String;
    fSBaseCalcICM : Real;
    fSBaseCalcIPI : Real;
    fSICMDebitado : Real;
    fSIPIDebitado : Real;
    fSBaseIsentaICM : Real;
    fSBaseIsentaIPI : Real;
    fSBaseOutrasICM : Real;
    fSBaseOutrasIPI : Real;

  public
    Property pPaginaCorrente : Integer Read fPaginaCorrente Write fPaginaCorrente;
    Property pUltimoImpresso : Real Read fUltimoImpresso Write fUltimoImpresso;
    Property pUltimoEspecie : String Read fUltimoEspecie Write fUltimoEspecie;
    Property pSBaseCalcICM : Real Read fSBaseCalcICM Write fSBaseCalcICM;
    Property pSBaseCalcIPI : Real Read fSBaseCalcIPI Write fSBaseCalcIPI;
    Property pSICMDebitado : Real Read fSICMDebitado Write fSICMDebitado;
    Property pSIPIDebitado : Real Read fSIPIDebitado Write fSIPIDebitado;
    Property pSBaseIsentaICM : Real Read fSBaseIsentaICM Write fSBaseIsentaICM;
    Property pSBaseIsentaIPI : Real Read fSBaseIsentaIPI Write fSBaseIsentaIPI;
    Property pSBaseOutrasICM : Real Read fSBaseOutrasICM Write fSBaseOutrasICM;
    Property pSBaseOutrasIPI : Real Read fSBaseOutrasIPI Write fSBaseOutrasIPI;

  end;

var
  FRRegSaida: TFRRegSaida;

implementation

uses URegSaida_cl, URegSaidaParam, UParamSistema_cl;

{$R *.DFM}

procedure TFRRegSaida.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLPaginaI.Caption := FormatFloat('####0',pPaginaCorrente);
  pPaginaCorrente := pPaginaCorrente + 1;
end;

procedure TFRRegSaida.FRRegSaidaBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  pUltimoImpresso := 0;
  pUltimoEspecie := '';
  pSBaseCalcICM := 0;
  pSBaseCalcIPI := 0;
  pSICMDebitado := 0;
  pSIPIDebitado := 0;
  pSBaseIsentaICM := 0;
  pSBaseIsentaIPI := 0;
  pSBaseOutrasICM := 0;
  pSBaseOutrasIPI := 0;

end;

procedure TFRRegSaida.QRBDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With DMRegSaida do
  Begin
    If TRIM(QRegSaidaDesc_Obs.Text) = 'FUTURA' Then
       QRObservacao.Caption := Trim(QRegSaidaDesc_Obs.Text) +' '+ FormatFloat('##,###,##0.00',QRegSaidaVal_Observacao.Value)
    Else
      If TRIM(QRegSaidaDesc_Obs.Text) = 'CANCELADA' Then
         QRObservacao.Caption := 'CANCELADA'
      Else   
         QRObservacao.Caption := '';
    If (pUltimoImpresso = QRegSaidaCod_Nota_Cab.Value) And
       (pUltimoEspecie = QRegSaidaESPECIE.Value) Then
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

    pUltimoImpresso := QRegSaidaCod_Nota_Cab.Value;
    pUltimoEspecie := QRegSaidaESPECIE.Value;

    If QRegSaidaTipo_Imposto.Value = 'ICMS' Then
    Begin
      pSBaseCalcICM := pSBaseCalcICM+QRegSaidaVal_Base_Calculo.Value;
      pSICMDebitado := pSICMDebitado+QRegSaidaVal_Debitado.Value;
      pSBaseIsentaICM := pSBaseIsentaICM+QRegSaidaVal_Base_Isenta.Value;
      pSBaseOutrasICM := pSBaseOutrasICM+QRegSaidaVal_Base_Outras.Value;
    End
    Else
    Begin
      pSBaseCalcIPI := pSBaseCalcIPI+QRegSaidaVal_Base_Calculo.Value;
      pSIPIDebitado := pSIPIDebitado+QRegSaidaVal_Debitado.Value;
      pSBaseIsentaIPI := pSBaseIsentaIPI+QRegSaidaVal_Base_Isenta.Value;
      pSBaseOutrasIPI := pSBaseOutrasIPI+QRegSaidaVal_Base_Outras.Value;
    End;
    If (QRegSaidaTIPO_IMPOSTO.Value = 'IPI')
      and (QRegSaidaVal_Base_Calculo.Value = 0) Then
      PrintBand := False;
    If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO')
       And (QRegSaidaTIPO_IMPOSTO.Value = 'IPI') Then
      PrintBand := False;

  End;

end;

procedure TFRRegSaida.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLTotalBaseICM.Caption := FormatFloat('###,###,##0.00',pSBaseCalcICM);
  QRLTotalICM.Caption := FormatFloat('###,###,##0.00',pSICMDebitado);
  QRLICM_Isento.Caption := FormatFloat('###,###,##0.00',pSBaseIsentaICM);
  QRLICM_Outras.Caption := FormatFloat('###,###,##0.00',pSBaseOutrasICM);
  //QRLTotalBaseIPI.Caption := FormatFloat('###,###,##0.00',pSBaseCalcIPI);
  //QRLTotalIPI.Caption := FormatFloat('###,###,##0.00',pSIPIDebitado);
  //QRLIPI_Isento.Caption := FormatFloat('###,###,##0.00',pSBaseIsentaIPI);
  //QRLIPI_Outras.Caption := FormatFloat('###,###,##0.00',pSBaseOutrasIPI);
end;

procedure TFRRegSaida.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  FRRegSaida.pPaginaCorrente := Trunc( StrToFloat(FRegSaidaParam.ME0PaginaI.Text) );
  DMRegSaida.PCod_NotaCab := 0;
end;

end.
