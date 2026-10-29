unit URCaixa_Fluxo_Caixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFrCaixa_Fluxo_Caixa = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    Sld_Bancos: TQRLabel;
    QRLabel9: TQRLabel;
    Sld_Caixa: TQRLabel;
    QRLabel11: TQRLabel;
    Sld_Saldo: TQRLabel;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRBand5: TQRBand;
    SVal_Saldo: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    SVal_Saldo_Dia: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBTData: TQRDBText;
    Sld_Aplicacoes: TQRLabel;
    QRLabel13: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrCaixa_Fluxo_Caixa: TFrCaixa_Fluxo_Caixa;

implementation

uses UCaixa_cl, UCaixaParam, UCaixaRel_cl;

{$R *.DFM}

procedure TFrCaixa_Fluxo_Caixa.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
Var wValor_Caixa,wValor_Bancos,wValor_Aplicacoes: String;
    I : Integer;
begin
  inherited;
   wValor_Caixa := '';
   For i:= 1 to Length(FCaixaParam.Me6SaldoCaixa.Text) do
     if FCaixaParam.Me6SaldoCaixa.Text[I] in ['0','1','2','3','4','5','6','7','8','9',',','-'] Then
        wValor_Caixa := wValor_Caixa + FCaixaParam.Me6SaldoCaixa.Text[I];
   FRCaixa_Fluxo_Caixa.Sld_Caixa.Caption :=  FormatFloat('##,###,##0.00',StrToFloat(wValor_Caixa));
   wValor_Bancos := '';
   For i:= 1 to Length(FCaixaParam.Me6SaldoBancos.Text) do
     if FCaixaParam.Me6SaldoBancos.Text[I] in ['0','1','2','3','4','5','6','7','8','9',',','-'] Then
        wValor_Bancos := wValor_Bancos + FCaixaParam.Me6SaldoBancos.Text[I];
   wValor_Aplicacoes := '';
   For i:= 1 to Length(FCaixaParam.Me6SaldoAplicacoes.Text) do
     if FCaixaParam.Me6SaldoAplicacoes.Text[I] in ['0','1','2','3','4','5','6','7','8','9',',','-'] Then
        wValor_Aplicacoes := wValor_Aplicacoes + FCaixaParam.Me6SaldoAplicacoes.Text[I];

  FRCaixa_Fluxo_Caixa.Sld_Aplicacoes.Caption := FormatFloat('##,###,##0.00',StrToFloat(wValor_Aplicacoes));
  FRCaixa_Fluxo_Caixa.Sld_Bancos.Caption := FormatFloat('##,###,##0.00',StrToFloat(wValor_Bancos));
  FRCaixa_Fluxo_Caixa.Sld_Saldo.Caption := FormatFloat('##,###,##0.00',StrToFloat(wValor_Bancos)+StrToFloat(wValor_Caixa)+StrToFloat(wValor_Aplicacoes));
  FRCaixa_Fluxo_Caixa.SVal_Saldo.Caption := FormatFloat('##,###,##0.00',StrToFloat(wValor_Bancos)+StrToFloat(wValor_Caixa)+StrToFloat(wValor_Aplicacoes));

end;

procedure TFrCaixa_Fluxo_Caixa.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  Var wValor : String;
    I : Integer;
begin
  inherited;
  wValor := '';
  For i:= 1 to Length(FRCaixa_Fluxo_Caixa.SVal_Saldo.Caption) do
    if FRCaixa_Fluxo_Caixa.SVal_Saldo.Caption[I] in ['0','1','2','3','4','5','6','7','8','9',',','-'] Then
       wValor := wValor + FRCaixa_Fluxo_Caixa.SVal_Saldo.Caption[I];
  FRCaixa_Fluxo_Caixa.SVal_Saldo.Caption := FormatFloat('##,###,##0.00',StrToFloat(wValor) + SVal_Saldo_Dia.Value.dblResult);
end;

end.
