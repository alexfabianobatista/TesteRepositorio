unit URContabil_Diario1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRContabil_Diario1 = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRLEmpresa: TQRLabel;
    QRLTitulo: TQRLabel;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLNumPagina: TQRLabel;
    QRSysData1: TQRSysData;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand5: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRBand6: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLValor: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
  private
    { Private declarations }
    FPag_Inicial: real;
    FNum_Linhas : Real;
   public
    { Public declarations }
    Property Pag_Inicial: Real Read FPag_Inicial write FPag_Inicial;
    Property Num_Linhas : Real Read FNum_Linhas write FNum_Linhas;
  end;

var
  FRContabil_Diario1: TFRContabil_Diario1;
  vNum_Pagina:Real;
  Val_deb,Val_cred :Real;

implementation

uses UPlanilha_cl, UOracle_cl, UContabilParam;

{$R *.DFM}

procedure TFRContabil_Diario1.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  QRPrimario.QRPrinter.PaperLength := Round(QRPrimario.Page.Length);
  QRPrimario.QRPrinter.PaperWidth := Round(QRPrimario.Page.Width);
  vNum_Pagina:=Pag_Inicial;
  Num_Linhas:=Pag_Inicial;

end;

procedure TFRContabil_Diario1.FormCreate(Sender: TObject);
begin
  QRLEmpresa.Caption := 'Empresa: '+DMOracle.BuscaNome('SELECT DESC_EMPRESA FROM TB_PARAM_SISTEMA',
                                                       'COD_FILIAL >= 0');
end;

procedure TFRContabil_Diario1.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vNum_Pagina:=vNum_Pagina+1;
  QRLNumPagina.Caption:=FloatToStr(vNum_Pagina);
  Num_Linhas:=vNum_Pagina;
end;

procedure TFRContabil_Diario1.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 If DMPlanilha.QRContabil_DiarioVAL_DEBITO.Value <>  0 then
  Begin
   QRLvalor.Caption:= FormatFloat('#,##0.00',DMPlanilha.QRContabil_DiarioVAL_DEBITO.Value);
   QRDBText4.Left := 95;
  End
 Else
  Begin
   QRLvalor.Caption:= FormatFloat('#,##0.00',DMPlanilha.QRContabil_DiarioVAL_CREDITO.Value);
   QRDBText4.Left := 176;
  End;

end;

procedure TFRContabil_Diario1.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  FRContabil_Diario1.Pag_Inicial:=strToInt(Trim(FContabilParam.ME2Pagina.Text))-1;

end;

end.
