unit URApuracaoResumo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, QRExport, QRPDFFilt;

type
  TFRApuracaoResumo = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLNomeFilial: TQRLabel;
    QRLInscricaoFilial: TQRLabel;
    QRLPaginaI: TQRLabel;
    QRLCGCFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRBDetalhe: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRGCabBanda: TQRGroup;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape6: TQRShape;
    QRDBText4: TQRDBText;
    QRBRodBanda: TQRBand;
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRDBText6: TQRDBText;
    QRLDescTotal: TQRLabel;
    QRLTotal: TQRLabel;
    QRLSoma: TQRLabel;
    QRL014: TQRLabel;
    QRDBText2: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    procedure QRBDetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBRodBandaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    fPaginaCorrente : Integer;
    fTotalDebito : Real;
    fTotalCredito : Real;
    fImpostoRecolher : Real;
    fSaldoTransportar : Real;
    Property pTotalCredito : Real Read fTotalCredito Write fTotalCredito;
    Property pTotalDebito : Real Read fTotalDebito Write fTotalDebito;
    Property pImpostoRecolher : Real Read fImpostoRecolher Write fImpostoRecolher;
  public
    { Public declarations }
    Property pPaginaCorrente : Integer Read fPaginaCorrente Write fPaginaCorrente;
    Property pSaldoTransportar : Real Read fSaldoTransportar Write fSaldoTransportar;
  end;

var
  FRApuracaoResumo: TFRApuracaoResumo;

implementation

uses ULivroFiscal_Cl, FResumoApuracaoParam;

{$R *.DFM}

procedure TFRApuracaoResumo.QRBDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With DMLivroFiscal do
  Begin
    QRLSoma.Caption := FormatFloat('###,###,##0.00',QResumoApuracaoValor.Value);
    {Case Trunc(QResumoApuracaoCod_Operacao.Value) Of
      001 : pTotalDebito := pTotalDebito + QResumoApuracaoValor.Value;
      002 : pTotalDebito := pTotalDebito + QResumoApuracaoValor.Value;
      003 : pTotalDebito := pTotalDebito + QResumoApuracaoValor.Value;
      005 : pTotalCredito := pTotalCredito + QResumoApuracaoValor.Value;
      006 : pTotalCredito := pTotalCredito + QResumoApuracaoValor.Value;
      007 : pTotalCredito := pTotalCredito + QResumoApuracaoValor.Value;
      009 : pTotalCredito := pTotalCredito + QResumoApuracaoValor.Value;
      011 : Begin
              If (pTotalDebito-pTotalCredito) > 0 Then
                QRLSoma.Caption := Formatfloat('###,###,##0.00',pTotalDebito-pTotalCredito)
              Else
                QRLSoma.Caption := '0,00';
              pImpostoRecolher := pTotalDebito-pTotalCredito;
            End;
      012 : Begin
              pTotalCredito := pTotalCredito + QResumoApuracaoValor.Value;
              pImpostoRecolher := pImpostoRecolher-QResumoApuracaoValor.Value;
            End;
      013 : Begin
              If pImpostoRecolher > 0 Then
                QRLSoma.Caption := FormatFloat('###,###,##0.00',pImpostoRecolher)
              Else
                QRLSoma.Caption := '0,00';
            End;
    End;}
    Case Trunc(QResumoApuracaoNUM_GIA.Value) Of
      //51 : pTotalDebito := pTotalDebito + QResumoApuracaoValor.Value;
      //52 : pTotalDebito := pTotalDebito + QResumoApuracaoValor.Value;
      //53 : pTotalDebito := pTotalDebito + QResumoApuracaoValor.Value;

      51..59 : pTotalDebito  := pTotalDebito + QResumoApuracaoValor.Value;
      61..69 : pTotalCredito := pTotalCredito + QResumoApuracaoValor.Value;
      //62 : pTotalCredito := pTotalCredito + QResumoApuracaoValor.Value;
      //63 : pTotalCredito := pTotalCredito + QResumoApuracaoValor.Value;
      //64 : pTotalCredito := pTotalCredito + QResumoApuracaoValor.Value;
      //61 : pTotalCredito := pTotalCredito + QResumoApuracaoValor.Value;
      80 : Begin
              If (pTotalDebito-pTotalCredito) > 0 Then
                QRLSoma.Caption := Formatfloat('###,###,##0.00',pTotalDebito-pTotalCredito)
              Else
                QRLSoma.Caption := '0,00';
              pImpostoRecolher := pTotalDebito-pTotalCredito;
            End;
      -12 : Begin
              pTotalCredito := pTotalCredito + QResumoApuracaoValor.Value;
              pImpostoRecolher := pImpostoRecolher-QResumoApuracaoValor.Value;
            End;
      90 : Begin
              If pImpostoRecolher > 0 Then
                QRLSoma.Caption := FormatFloat('###,###,##0.00',pImpostoRecolher)
              Else
                QRLSoma.Caption := '0,00';
            End;
    End;
  End;
end;

procedure TFRApuracaoResumo.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLPaginaI.Caption := FormatFloat('####0',pPaginaCorrente);
  pPaginaCorrente := pPaginaCorrente + 1;
end;

procedure TFRApuracaoResumo.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := DMLivroFiscal.QRLctoCod_Filial.Value > 0;
  If Trim(DMLivroFiscal.QRLctoDesc_Complemento.Value) <> '' Then
    QRSubDetail1.Height := 32
  Else
    QRSubDetail1.Height := 16;
end;

procedure TFRApuracaoResumo.QRBRodBandaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With DMLivroFiscal do
  Begin
    Case StrToInt(QResumoApuracaoNum_Banda.Value) of
      01 : Begin
             QRLTotal.Caption := FormatFloat('###,###,##0.00',pTotalDebito);
             QRLDescTotal.Caption := '004 - SUBTOTAL';
             QRL014.Caption  := '';
             QRBRodBanda.Height := 21;
           End;
      02 : Begin
             QRLTotal.Caption := FormatFloat('###,###,##0.00',pTotalCredito);
             QRLDescTotal.Caption := '010 - TOTAL';
             QRL014.Caption  := '';
             QRBRodBanda.Height := 21;
           End;
      03 : Begin
             If pImpostoRecolher < 0 Then
             Begin
               QRLTotal.Caption := FormatFloat('###,###,##0.00',Abs(pImpostoRecolher));
               pSaldoTransportar := Abs(pImpostoRecolher);
             End
             Else
             Begin
               QRLTotal.Caption := '0.00';
               pSaldoTransportar := 0;
             End;
             QRLDescTotal.Caption := '014 - SALDO CREDOR (CREDITO MENOS DEBITO)';
             QRL014.Caption := 'A TRANSPORTAR P/ O PERIODO SEGUINTE';
             QRBRodBanda.Height := 37;
           End;
    End;
  End;
end;

procedure TFRApuracaoResumo.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  pTotalCredito := 0;
  pTotalDebito := 0;
end;

procedure TFRApuracaoResumo.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
    FRApuracaoResumo.pPaginaCorrente := Trunc( StrToFloat(FApuracaoResumoParam.ME0PaginaI.Text) );
end;

end.
