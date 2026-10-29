unit URContabil_Balancete_Analit_Mes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContabil_Balancete_Analit_Mes = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRLNumPagina: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRLFilial: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLContador: TQRLabel;
    QRLFuncaoCRC: TQRLabel;
    QRLTitular: TQRLabel;
    QRLabel17: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
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
  FRContabil_Balancete_Analit_Mes: TFRContabil_Balancete_Analit_Mes;
  vNum_Pagina:Real;

implementation

uses UPlanilha_cl, UContabilParam;

{$R *.DFM}

procedure TFRContabil_Balancete_Analit_Mes.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  vNum_Pagina:=vNum_Pagina+1;
  QRLNumPagina.Caption:=FloatToStr(vNum_Pagina);
  Num_Linhas:=vNum_Pagina;
end;

procedure TFRContabil_Balancete_Analit_Mes.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  vNum_Pagina:=Pag_Inicial;
  Num_Linhas:=Pag_Inicial;
end;

procedure TFRContabil_Balancete_Analit_Mes.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if DMPlanilha.QRBalanceteAnaliticoNUM_GRAU.Value=1 then
    begin
      QRBand4.Font.Style:=[fsBold];
      QRBand4.ForceNewPage:=True;
      //QRBand4.Font.Size:=11;
    end
  else
    begin
      QRBand4.Font.Style:=[];
      QRBand4.ForceNewPage:=False;
      //QRBand4.Font.Size:=10;
    end;
  if (DMPlanilha.QRBalanceteAnaliticoNUM_GRAU.Value=1) OR
     (DMPlanilha.QRBalanceteAnaliticoNUM_GRAU.Value=2) OR
     (DMPlanilha.QRBalanceteAnaliticoNUM_GRAU.Value=3) OR
     (DMPlanilha.QRBalanceteAnaliticoNUM_GRAU.Value=4) then
     Begin
      QRDbtext1.Font.Style:=[fsBold];
      QRDbtext3.Font.Style:=[fsBold];
      QRBand4.Height := 30;
      QRDbText1.Top := 6;
      QRDbText2.Top := 6;
      QRDbText3.Top := 6;
      QRDbText4.Top := 6;
      QRDbText5.Top := 6;
      QRDbText6.Top := 6;
      QRDbText7.Top := 6;
     End
  else
     Begin
      QRDbtext1.Font.Style:=[];
      QRDbtext3.Font.Style:=[];
      QRBand4.Height := 16;
      QRDbText1.Top := 0;
      QRDbText2.Top := 0;
      QRDbText3.Top := 0;
      QRDbText4.Top := 0;
      QRDbText5.Top := 0;
      QRDbText6.Top := 0;
      QRDbText7.Top := 0;
     End;
end;

procedure TFRContabil_Balancete_Analit_Mes.QRBand2AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  FRContabil_Balancete_Analit_Mes.Pag_Inicial:=StrToInt(Trim(FContabilParam.ME1Pagina.Text))-1;

end;

end.
