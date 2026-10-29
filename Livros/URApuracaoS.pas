unit URApuracaoS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, QRExport, QRPDFFilt;

type
  TFRApuracaoS = class(TForm)
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
    QRBTotalTipo: TQRBand;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel19: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLBase5: TQRLabel;
    QRLBase6: TQRLabel;
    QRLBase7: TQRLabel;
    QRLICM5: TQRLabel;
    QRLICM6: TQRLabel;
    QRLICM7: TQRLabel;
    QRLIsento5: TQRLabel;
    QRLIsento6: TQRLabel;
    QRLIsento7: TQRLabel;
    QRLOutra5: TQRLabel;
    QRLOutra6: TQRLabel;
    QRLOutra7: TQRLabel;
    QRExpr4: TQRExpr;
    QRDBText7: TQRDBText;
    QRExpr5: TQRExpr;
    QRLContabil5: TQRLabel;
    QRLContabil6: TQRLabel;
    QRLContabil7: TQRLabel;
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel18: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBTotalTipoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    fPaginaCorrente : Integer;
    fBase5 : Real;
    fBase6 : Real;
    fBase7 : Real;
    fICM5  : Real;
    fICM6  : Real;
    fICM7  : Real;
    fIsenta5 : Real;
    fIsenta6 : Real;
    fIsenta7 : Real;
    fOutra5  : real;
    fOutra6  : Real;
    fOutra7  : Real;
    fContabil5 : Real;
    fContabil6 : Real;
    fContabil7 : Real;
  public
    { Public declarations }
    Property pPaginaCorrente : Integer Read fPaginaCorrente Write fPaginaCorrente;
    Property pBase5 : Real Read fBase5 Write fBase5;
    Property pBase6 : Real Read fBase6 Write fBase6;
    Property pBase7 : Real Read fBase7 Write fBase7;
    Property pICM5 : Real Read fICM5 Write fICM5;
    Property pICM6 : Real Read fICM6 Write fICM6;
    Property pICM7 : Real Read fICM7 Write fICM7;
    Property pISENTA5 : Real Read fISENTA5 Write fISENTA5;
    Property pISENTA6 : Real Read fISENTA6 Write fISENTA6;
    Property pISENTA7 : Real Read fISENTA7 Write fISENTA7;
    Property pOUTRA5 : Real Read fOUTRA5 Write fOUTRA5;
    Property pOUTRA6 : Real Read fOUTRA6 Write fOUTRA6;
    Property pOUTRA7 : Real Read fOUTRA7 Write fOUTRA7;
    Property pCONTABIL5 : Real Read fCONTABIL5 Write fCONTABIL5;
    Property pCONTABIL6 : Real Read fCONTABIL6 Write fCONTABIL6;
    Property pCONTABIL7 : Real Read fCONTABIL7 Write fCONTABIL7;
  end;

var
  FRApuracaoS: TFRApuracaoS;

implementation

uses URegEntrada_cl, URApuracaoE, UApuracaoParam;

{$R *.DFM}

procedure TFRApuracaoS.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLPaginaI.Caption := FormatFloat('####0',pPaginaCorrente);
  pPaginaCorrente := pPaginaCorrente + 1;
end;

procedure TFRApuracaoS.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  pBase5 := 0;
  pBase6 := 0;
  pBase7 := 0;
  pICM5 := 0;
  pICM6 := 0;
  pICM7 := 0;
  pIsenta5 := 0;
  pIsenta6 := 0;
  pIsenta7 := 0;
  pOutra5 := 0;
  pOutra6 := 0;
  pOutra7 := 0;
  pContabil5 := 0;
  pContabil6 := 0;
  pContabil7 := 0;
end;

procedure TFRApuracaoS.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var wNumNat : Integer;
begin
  With DMRegEntrada do
  Begin
    If QApuracaoSNat_Operacao.Text <> '' Then
     Begin
      wNumNat := StrToInt( Copy(QApuracaoSNat_Operacao.Text,1,1) );
      Case wNumNat of
        5 : Begin
              pBase5 := pBase5 + QApuracaoSVal_ICM_Base.Value;
              pICM5 := pICM5 + QApuracaoSVal_ICM.Value;
              pIsenta5 := pIsenta5 + QApuracaoSVal_ICM_Base_Isento.Value;
              pOutra5 := pOutra5 + QApuracaoSVal_ICM_Base_Outras.Value;
              pContabil5 := pContabil5 + QApuracaoSVal_Contabil.Value;
            End;
        6 : Begin
              pBase6 := pBase6 + QApuracaoSVal_ICM_Base.Value;
              pICM6 := pICM6 + QApuracaoSVal_ICM.Value;
              pIsenta6 := pIsenta6 + QApuracaoSVal_ICM_Base_Isento.Value;
              pOutra6 := pOutra6 + QApuracaoSVal_ICM_Base_Outras.Value;
              pContabil6 := pContabil6 + QApuracaoSVal_Contabil.Value;
            End;
        7 : Begin
              pBase7 := pBase7 + QApuracaoSVal_ICM_Base.Value;
              pICM7 := pICM7 + QApuracaoSVal_ICM.Value;
              pIsenta7 := pIsenta7 + QApuracaoSVal_ICM_Base_Isento.Value;
              pOutra7 := pOutra7 + QApuracaoSVal_ICM_Base_Outras.Value;
              pContabil7 := pContabil7 + QApuracaoSVal_Contabil.Value;
            End;
      End; // Case
    End;
  End;
end;

procedure TFRApuracaoS.QRBTotalTipoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLBase5.Caption := FormatFloat('###,###,##0.00',pBase5);
  QRLICM5.Caption :=  FormatFloat('###,###,##0.00',pICM5);
  QRLIsento5.Caption :=  FormatFloat('###,###,##0.00',pIsenta5);
  QRLOutra5.Caption :=  FormatFloat('###,###,##0.00',pOutra5);
  QRLContabil5.Caption :=  FormatFloat('###,###,##0.00',pContabil5);

  QRLBase6.Caption := FormatFloat('###,###,##0.00',pBase6);
  QRLICM6.Caption :=  FormatFloat('###,###,##0.00',pICM6);
  QRLIsento6.Caption :=  FormatFloat('###,###,##0.00',pIsenta6);
  QRLOutra6.Caption :=  FormatFloat('###,###,##0.00',pOutra6);
  QRLContabil6.Caption :=  FormatFloat('###,###,##0.00',pContabil6);

  QRLBase7.Caption := FormatFloat('###,###,##0.00',pBase7);
  QRLICM7.Caption :=  FormatFloat('###,###,##0.00',pICM7);
  QRLIsento7.Caption :=  FormatFloat('###,###,##0.00',pIsenta7);
  QRLOutra7.Caption :=  FormatFloat('###,###,##0.00',pOutra7);
  QRLContabil7.Caption :=  FormatFloat('###,###,##0.00',pContabil7);
  FRApuracaoE.pPaginaCorrente := Trunc( StrToFloat(FApuracaoParam.ME0PaginaI.Text) );

end;

end.
