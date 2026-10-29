unit URContabil_RazaoAnalitico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContabil_RazaoAnalitico = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    QRLData: TQRLabel;
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRDBText8: TQRDBText;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRESaldo1: TQRExpr;
    QRBand6: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLNumPagina: TQRLabel;
    QRLabel4: TQRLabel;
    QRLHistorico: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel13: TQRLabel;
    QRLSaldo: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel15: TQRLabel;
    QRLDebito: TQRLabel;
    QRLCredito: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRLDataPeriodo: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel8: TQRLabel;
    QRLSaldoAnterior: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand6AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    FNum_Linhas:Real;
    FPag_Inicial:Real;
  public
    { Public declarations }
    Property Num_Linhas : Real Read FNum_Linhas write FNum_Linhas;
    Property Pag_Inicial : Real Read FPag_Inicial write FPag_Inicial;
  end;

var
  FRContabil_RazaoAnalitico: TFRContabil_RazaoAnalitico;
  vNum_Pagina:Real;
  wSaldo : Real;
  wTotDebito,wTotCredito : Real;
implementation

uses UPlanilha_cl, UParamSistema_cl, UContabilParam;

{$R *.DFM}

procedure TFRContabil_RazaoAnalitico.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  vNum_Pagina:=vNum_Pagina+1;
  QRLNumPagina.Caption:=FloatToStr(vNum_Pagina);
  Num_Linhas:=vNum_Pagina;
{  If vNum_Pagina <> 1 Then
     QRLabel17.Caption := 'Conta:   '+DMPlanilha.QRRazaoAnaliticoCod_Reduzido.Text + '         -   ' +DMPlanilha.QRRazaoAnaliticoNum_Plano_Conta.Text + '       ' +DMPlanilha.QRRazaoAnaliticoDesc_Plano_Conta.Text
  Else
     QRLabel17.Caption :='';  }
end;

procedure TFRContabil_RazaoAnalitico.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  vNum_Pagina:=Pag_Inicial;
  Num_Linhas:=Pag_Inicial;
end;

procedure TFRContabil_RazaoAnalitico.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRESaldo1.Reset;
  QRLDebito.Caption := FormatFloat('##,###,##0.00',wTotDebito);
  QRLCredito.Caption := FormatFloat('##,###,##0.00',wTotCredito);
  wTotDebito := 0;
  wTotCredito := 0;
end;

procedure TFRContabil_RazaoAnalitico.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if DMPlanilha.QRRazaoAnaliticoVal_Lancamento.Value > 0 then
   Begin
     QRDBText8.Left := 441;
     wTotDebito := wTotDebito + DMPlanilha.QRRazaoAnaliticoVal_Lancamento.Value;
   End
  Else
   Begin
     QRDBText8.Left := 537;
     wTotCredito := wTotCredito + DMPlanilha.QRRazaoAnaliticoVal_Lancamento.Value;
   End;

  QRLHistorico.Caption := Trim(DMPlanilha.QRRazaoAnaliticoDesc_Historico_Contabil.Text) + ' - ' + Trim(DMPlanilha.QRRazaoAnaliticoDesc_Complemento.Text);
  wSaldo := wSaldo + DMPlanilha.QRRazaoAnaliticoVal_Lancamento.Value;
  QRLSaldo.Caption := FormatFloat('##,###,##0.00',wSaldo);
end;

procedure TFRContabil_RazaoAnalitico.QRGroup1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  QRShape1.Enabled := True;
  wSaldo := DMPlanilha.QRRazaoAnaliticoVal_Anterior.Value;
  QRLabel3.Font.Color:=clblack;
  QRLabel5.Font.Color:=clblack;
  QRDBText3.Font.Color:=clblack;
  QRDBText1.Font.Color:=clblack;
  QRDBText2.Font.Color:=clblack;
  QRBand6.Height := 39;
  QRLSaldoAnterior.Caption := FormatFloat('##,###,##0.00',DMPlanilha.QRRazaoAnaliticoVal_Anterior.Value);  // devido ao saldo a transportar para a pagina seguinte
  QRBand6.Height := 39;
end;

procedure TFRContabil_RazaoAnalitico.QRBand5AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  FRContabil_RazaoAnalitico.Pag_Inicial:=StrToInt(Trim(FContabilParam.Me0Pagina.Text)) - 1;

end;

procedure TFRContabil_RazaoAnalitico.QRBand4AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  QRLabel3.Font.Color:=clwhite;
  QRLabel5.Font.Color:=clwhite;
  QRDBText3.Font.Color:=clwhite;
  QRDBText1.Font.Color:=clwhite;
  QRDBText2.Font.Color:=clwhite;
  QRBand6.Height := 19;

end;

procedure TFRContabil_RazaoAnalitico.QRBand3AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  QRLabel3.Font.Color:=clblack;
  QRLabel5.Font.Color:=clblack;
  QRDBText3.Font.Color:=clblack;
  QRDBText1.Font.Color:=clblack;
  QRDBText2.Font.Color:=clblack;
  QRBand6.Height := 39;
  QRLSaldoAnterior.Caption := QRLSaldo.Caption;  // devido ao saldo a transportar para a pagina seguinte

end;

procedure TFRContabil_RazaoAnalitico.QRBand6AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  QRBand6.Height := 39;
end;

end.
