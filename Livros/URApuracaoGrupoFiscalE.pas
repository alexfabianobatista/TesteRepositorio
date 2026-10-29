unit URApuracaoGrupoFiscalE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, QRExport, QRPDFFilt;

type
  TFRApuracaoGrupoFiscalE = class(TForm)
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
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRDBText7: TQRDBText;
    QRBand3: TQRBand;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel19: TQRLabel;
    QRExpr5: TQRExpr;
    QRLContabil3: TQRLabel;
    QRLContabil2: TQRLabel;
    QRLContabil1: TQRLabel;
    QRLBase1: TQRLabel;
    QRLBase2: TQRLabel;
    QRLBase3: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLICM3: TQRLabel;
    QRLICM2: TQRLabel;
    QRLICM1: TQRLabel;
    QRLIsento1: TQRLabel;
    QRLIsento2: TQRLabel;
    QRLIsento3: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLOutra3: TQRLabel;
    QRLOutra2: TQRLabel;
    QRLOutra1: TQRLabel;
    QRBand4: TQRBand;
    QRLabel25: TQRLabel;
    QRShape17: TQRShape;
    QRLabel26: TQRLabel;
    QRShape19: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape20: TQRShape;
    QRLabel30: TQRLabel;
    QRShape21: TQRShape;
    QRLabel31: TQRLabel;
    QRShape22: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape24: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape25: TQRShape;
    QRLabel37: TQRLabel;
    QRShape3: TQRShape;
    QRCompositeReport1: TQRCompositeReport;
    QRPDFFilter1: TQRPDFFilter;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
    fPaginaCorrente : Integer;
    fBase1 : Real;
    fBase2 : Real;
    fBase3 : Real;
    fICM1  : Real;
    fICM2  : Real;
    fICM3  : Real;
    fContabil1 : Real;
    fContabil2 : Real;
    fContabil3 : Real;
    fIsenta1 : Real;
    fIsenta2 : Real;
    fIsenta3 : Real;
    fOutra1  : real;
    fOutra2  : Real;
    fOutra3  : Real;
  public
    { Public declarations }
    Property pPaginaCorrente : Integer Read fPaginaCorrente Write fPaginaCorrente;
    Property pBase1 : Real Read fBase1 Write fBase1;
    Property pBase2 : Real Read fBase2 Write fBase2;
    Property pBase3 : Real Read fBase3 Write fBase3;
    Property pICM1 : Real Read fICM1 Write fICM1;
    Property pICM2 : Real Read fICM2 Write fICM2;
    Property pICM3 : Real Read fICM3 Write fICM3;
    Property pISENTA1 : Real Read fISENTA1 Write fISENTA1;
    Property pISENTA2 : Real Read fISENTA2 Write fISENTA2;
    Property pISENTA3 : Real Read fISENTA3 Write fISENTA3;
    Property pOUTRA1 : Real Read fOUTRA1 Write fOUTRA1;
    Property pOUTRA2 : Real Read fOUTRA2 Write fOUTRA2;
    Property pOUTRA3 : Real Read fOUTRA3 Write fOUTRA3;
    Property pCONTABIL1 : Real Read fCONTABIL1 Write fCONTABIL1;
    Property pCONTABIL2 : Real Read fCONTABIL2 Write fCONTABIL2;
    Property pCONTABIL3 : Real Read fCONTABIL3 Write fCONTABIL3;
  end;

var
  FRApuracaoGrupoFiscalE: TFRApuracaoGrupoFiscalE;

implementation

uses URegEntrada_cl, URApuracaoGrupoFiscalS;

{$R *.DFM}

procedure TFRApuracaoGrupoFiscalE.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  pBase1 := 0;
  pBase2 := 0;
  pBase3 := 0;
  pICM1 := 0;
  pICM2 := 0;
  pICM3 := 0;
  pIsenta1 := 0;
  pIsenta2 := 0;
  pIsenta3 := 0;
  pOutra1 := 0;
  pOutra2 := 0;
  pOutra3 := 0;
  pCONTABIL1 := 0;
  pCONTABIL2 := 0;
  pCONTABIL3 := 0;
end;

procedure TFRApuracaoGrupoFiscalE.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLPaginaI.Caption := FormatFloat('####0',pPaginaCorrente);
  pPaginaCorrente := pPaginaCorrente + 1;
end;

procedure TFRApuracaoGrupoFiscalE.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var wNumNat : Integer;
begin
  With DMRegEntrada do
  Begin
    If QApuracaoGrupoFiscalENAT_OPERACAO_INICIO.Text <> '' Then
     Begin
      wNumNat := QApuracaoGrupoFiscalENAT_OPERACAO_INICIO.AsInteger;//StrToInt( Copy(QApuracaoENat_Operacao.Text,1,1) );
      Case wNumNat of
        1 : Begin
              pBase1 := pBase1 + QApuracaoGrupoFiscalEVal_ICM_Base.Value;
              pICM1 := pICM1 + QApuracaoGrupoFiscalEVal_ICM.Value;
              pIsenta1 := pIsenta1 + QApuracaoGrupoFiscalEVal_ICM_Base_Isento.Value;
              pOutra1 := pOutra1 + QApuracaoGrupoFiscalEVal_ICM_Base_Outras.Value;
              pContabil1  := pContabil1 + QApuracaoGrupoFiscalEVal_Contabil.Value;
            End;
        2 : Begin
              pBase2 := pBase2 + QApuracaoGrupoFiscalEVal_ICM_Base.Value;
              pICM2 := pICM2 + QApuracaoGrupoFiscalEVal_ICM.Value;
              pIsenta2 := pIsenta2 + QApuracaoGrupoFiscalEVal_ICM_Base_Isento.Value;
              pOutra2 := pOutra2 + QApuracaoGrupoFiscalEVal_ICM_Base_Outras.Value;
              pContabil2  := pContabil2 + QApuracaoGrupoFiscalEVal_Contabil.Value;
            End;
        3 : Begin
              pBase3 := pBase3 + QApuracaoGrupoFiscalEVal_ICM_Base.Value;
              pICM3 := pICM3 + QApuracaoGrupoFiscalEVal_ICM.Value;
              pIsenta3 := pIsenta3 + QApuracaoGrupoFiscalEVal_ICM_Base_Isento.Value;
              pOutra3 := pOutra3 + QApuracaoGrupoFiscalEVal_ICM_Base_Outras.Value;
              pContabil3  := pContabil3 + QApuracaoGrupoFiscalEVal_Contabil.Value;
            End;
      End; // Case
     End;
  End;
end;

procedure TFRApuracaoGrupoFiscalE.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
{  QRLabel33.Caption := 'SAIDAS';
  QRLabel30.Caption := 'OPERAÇÕES COM DEB. DO IMP.';
  QRLabel32.Caption := 'IMP. DEBITADO';
  QRLabel35.Caption := 'OPERAÇÕES SEM DEB. DO IMP.';}
  QRPrimario.NewPage;
end;

procedure TFRApuracaoGrupoFiscalE.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLBase1.Caption := FormatFloat('###,###,##0.00',pBase1);
  QRLICM1.Caption :=  FormatFloat('###,###,##0.00',pICM1);
  QRLIsento1.Caption :=  FormatFloat('###,###,##0.00',pIsenta1);
  QRLOutra1.Caption :=  FormatFloat('###,###,##0.00',pOutra1);
  QRLContabil1.Caption :=  FormatFloat('###,###,##0.00',pContabil1);

  QRLBase2.Caption := FormatFloat('###,###,##0.00',pBase2);
  QRLICM2.Caption :=  FormatFloat('###,###,##0.00',pICM2);
  QRLIsento2.Caption :=  FormatFloat('###,###,##0.00',pIsenta2);
  QRLOutra2.Caption :=  FormatFloat('###,###,##0.00',pOutra2);
  QRLContabil2.Caption :=  FormatFloat('###,###,##0.00',pContabil2);

  QRLBase3.Caption := FormatFloat('###,###,##0.00',pBase3);
  QRLICM3.Caption :=  FormatFloat('###,###,##0.00',pICM3);
  QRLIsento3.Caption :=  FormatFloat('###,###,##0.00',pIsenta3);
  QRLOutra3.Caption :=  FormatFloat('###,###,##0.00',pOutra3);
  QRLContabil3.Caption :=  FormatFloat('###,###,##0.00',pContabil3);

end;

procedure TFRApuracaoGrupoFiscalE.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  QRCompositeReport1.Reports.Add(FRApuracaoGrupoFiscalE.QRPrimario);
  QRCompositeReport1.Reports.Add(FRApuracaoGrupoFiscalS.QRPrimario);
end;

end.
