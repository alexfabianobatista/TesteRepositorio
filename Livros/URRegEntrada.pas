unit URRegEntrada;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Dialogs, QRExport,
  QRPDFFilt;

type
  TFRRegEntrada = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBTDTEntrada: TQRDBText;
    QRDBTSerie: TQRDBText;
    QRDBTDtEmissao: TQRDBText;
    QRDBTEmitente: TQRDBText;
    QRDBTUFOrigem: TQRDBText;
    QRDBTEspecie: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel15: TQRLabel;
    QRShape7: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape8: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape9: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape10: TQRShape;
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
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBTValICM: TQRDBText;
    QRDBTCod_ICM: TQRDBText;
    QRDBTAliqICM: TQRDBText;
    QRLNomeFilial: TQRLabel;
    QRLInscricaoFilial: TQRLabel;
    QRLCGCFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLTotalBaseICM0: TQRLabel;
    QRLTotalBaseICM4: TQRLabel;
    QRLTotalBaseICM5: TQRLabel;
    QRLTotalICM: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape33: TQRShape;
    QRShape35: TQRShape;
    QRLPaginaI: TQRLabel;
    QRDBText14: TQRDBText;
    QRShape37: TQRShape;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRDBTNumNota: TQRDBText;
    QRShape38: TQRShape;
    QRDBTValContabil: TQRDBText;
    QRDBText3: TQRDBText;
    QRLValContabil: TQRLabel;
    QRGCabNota: TQRGroup;
    QRBRodNota: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel55: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel33: TQRLabel;
    QRLabel45: TQRLabel;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape32: TQRShape;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    QRShape39: TQRShape;
    QRTextFilter1: TQRTextFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLabel46: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLTotalPis: TQRLabel;
    QRLTotalCofins: TQRLabel;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    procedure FRRegEntradaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGCabNotaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    fTotalBaseICM0 : Real;
    fTotalBaseICM4 : Real;
    fTotalBaseICM5 : Real;
    fTotalICM : Real;                 
    fTotalBaseIPI0 : Real;
    fTotalBaseIPI4 : Real;
    fTotalBaseIPI5 : Real;
    fTotalIPI : Real;
    fPaginaCorrente : Integer;
    fDocAnterior : String;
    fSerAnterior : String;
    fNumNota : String;
    fTotValContabil : Real;
    fTotalPis: Real;
    fTotalCofins: Real;
    Property pTotalBaseICM0 : Real Read fTotalBaseICM0 Write fTotalBaseICM0;
    Property pTotalBaseICM4 : Real Read fTotalBaseICM4 Write fTotalBaseICM4;
    Property pTotalBaseICM5 : Real Read fTotalBaseICM5 Write fTotalBaseICM5;
    Property pTotalICM : Real Read fTotalICM Write fTotalICM;
    Property pTotalBaseIPI0 : Real Read fTotalBaseIPI0 Write fTotalBaseIPI0;
    Property pTotalBaseIPI4 : Real Read fTotalBaseIPI4 Write fTotalBaseIPI4;
    Property pTotalBaseIPI5 : Real Read fTotalBaseIPI5 Write fTotalBaseIPI5;
    Property pTotalIPI : Real Read fTotalIPI Write fTotalIPI;
    Property pTotValContabil : Real Read fTotValContabil Write fTotValContabil;
    Property pDocAnterior : String Read fDocAnterior Write fDocAnterior;
    Property pSerAnterior : String Read fSerAnterior Write fSerAnterior;
    Property pNumNota : String Read fNumNota Write fNumNota;
    Property pTotalPis : Real Read fTotalPis Write fTotalPis;
    Property pTotalCofins : Real Read fTotalCofins Write fTotalCofins;
  public
    Property pPaginaCorrente : Integer Read fPaginaCorrente Write fPaginaCorrente;
  end;

var
  FRRegEntrada: TFRRegEntrada;

implementation

uses UOracle_cl, URegEntrada_cl, URegEntradaParam;

{$R *.DFM}

procedure TFRRegEntrada.FRRegEntradaBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var wEmail: TQREmail;
  wSmtpPort: String;
begin
//configuração do envio de e-mail
  Buscador.Limpa;
  Buscador.Adiciona('DESC_EMAIL', 'TB_EMAIL');
  Buscador.Adiciona('DESC_SENHA', 'TB_EMAIL');
  Buscador.Adiciona('DESC_SMTP', 'TB_EMAIL');
  Buscador.Adiciona('NUM_PORTA_SMTP', 'TB_EMAIL');
  Buscador.Adiciona('IND_SSL', 'TB_EMAIL');

  Buscador.Buscar;

  wEmail.EmailAddress := Buscador.Proximo;
  wEmail.Password := Buscador.Proximo;
  wEmail.Smtp := Buscador.Proximo;
  wSmtpPort := Buscador.Proximo;
  if wSmtpPort <> '' then
    wEmail.SmtpPort := StrToInt(wSmtpPort);
  wEmail.SSL := (Buscador.Proximo = 'S');
  Email := wEmail;
//fim da configuração do envio de e-mail

  Printer.PrinterIndex := 0;
  pTotalBaseICM0 := 0;
  pTotalBaseICM4 := 0;
  pTotalBaseICM5 := 0;
  pTotalICM := 0;
  pTotalBaseIPI0 := 0;
  pTotalBaseIPI4 := 0;
  pTotalBaseIPI5 := 0;
  pTotalIPI := 0;
  pDocAnterior := '';
  pSerAnterior := '';
  pNumNota := '';
  pTotValContabil := 0;
  PTotalPis := 0;
  PTotalCofins := 0;

end;

procedure TFRRegEntrada.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLTotalBaseICM0.Caption := FormatFloat('###,###,##0.00',pTotalBaseICM0);
  QRLTotalBaseICM4.Caption := FormatFloat('###,###,##0.00',pTotalBaseICM4);
  QRLTotalBaseICM5.Caption := FormatFloat('###,###,##0.00',pTotalBaseICM5);
  QRLTotalICM.Caption := FormatFloat('###,###,##0.00',pTotalICM);
  QRLTotalPis.Caption := FormatFloat('###,###,##0.00',pTotalPis);
  QRLTotalCofins.Caption := FormatFloat('###,###,##0.00',pTotalCofins);

//  QRLTotalBaseIPI0.Caption := FormatFloat('###,###,##0.00',pTotalBaseIPI0);
//  QRLTotalBaseIPI4.Caption := FormatFloat('###,###,##0.00',pTotalBaseIPI4);
//  QRLTotalBaseIPI5.Caption := FormatFloat('###,###,##0.00',pTotalBaseIPI5);
//  QRLTotalIPI.Caption := FormatFloat('###,###,##0.00',pTotalIPI);
  QRLValContabil.Caption := FormatFloat('###,###,##0.00',pTotValContabil);

end;

procedure TFRRegEntrada.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With DMRegEntrada do
  Begin
    If QRegEntradaNum_Classificacao.Text <> '' Then
    Begin
      Case StrToInt(QRegEntradaNum_Classificacao.Value) of
         0 : Begin
               pTotalBaseICM0 := pTotalBaseICM0+QRegEntradaVal_ICM_Base.Value;
               pTotalICM := pTotalICM+QRegEntradaVal_ICM.Value;
             End;
         4 : pTotalBaseICM4 := pTotalBaseICM4+QRegEntradaVal_ISENTO.Value;
         5 : pTotalBaseICM5 := pTotalBaseICM5+QRegEntradaVal_OUTRAS.Value;
      End;
      If (pDocAnterior = QRegEntradaCod_Nota_Cab.Text) And
         (PSerAnterior = QRegEntradaCod_Serie.Text) And
         (pNumNota = QRegEntradaNum_Nota.Text) Then
        QRDBTNumNota.Font.Color  := clWhite
      Else
       Begin
        QRDBTNumNota.Font.Color := clBlack;
        pTotValContabil := pTotValContabil+QRegEntradaVal_Contabil.Value;
       End;
      QRDBTDtEmissao.Font.Color := QRDBTNumNota.Font.Color;
      QRDBTUFOrigem.Font.Color := QRDBTNumNota.Font.Color;
      QRDBTValContabil.Font.Color := QRDBTNumNota.Font.Color;
      QRDBTDTEntrada.Font.Color := QRDBTNumNota.Font.Color;
      QRDBTEspecie.Font.Color := QRDBTNumNota.Font.Color;
      QRDBTSerie.Font.Color := QRDBTNumNota.Font.Color;
      QRDBTEmitente.Font.Color := QRDBTNumNota.Font.Color;
      pDocAnterior := QRegEntradaCod_Nota_Cab.Text;
      pSerAnterior := QRegEntradaCod_Serie.Text;
      pNumNota :=  QRegEntradaNum_Nota.Text;

      If QRegEntradaDesc_Obs.Value <> '' Then
        QRDBTCod_ICM.Font.Color := clWhite
      Else
        QRDBTCod_ICM.Font.Color := clBlack;

  //    QRDBTBaseICM.Font.Color := QRDBTCod_ICM.Font.Color;
      QRDBTAliqICM.Font.Color := QRDBTCod_ICM.Font.Color;
      QRDBTValICM.Font.Color := QRDBTCod_ICM.Font.Color;
  //    QRDBTCodIPI.Font.Color := QRDBTCod_ICM.Font.Color;
  //    QRDBTBaseIPI.Font.Color := QRDBTCod_ICM.Font.Color;
  //    QRDBTValIPI.Font.Color := QRDBTCod_ICM.Font.Color;
    End;
    pTotalPis := pTotalPis + QRegEntradaVAL_PIS.Value;
    pTotalCofins := pTotalCofins + QRegEntradaVAL_COFINS.Value;
  End;
end;

procedure TFRRegEntrada.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLPaginaI.Caption := FormatFloat('####0',pPaginaCorrente);
  pPaginaCorrente := pPaginaCorrente + 1;
end;

procedure TFRRegEntrada.QRGCabNotaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := False;
end;

procedure TFRRegEntrada.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  FRRegEntrada.pPaginaCorrente := Trunc( StrToFloat(FRegEntradaParam.ME0PaginaI.Text) );
end;

end.
