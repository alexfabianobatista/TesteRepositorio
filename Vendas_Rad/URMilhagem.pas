unit URMilhagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRMilhagem = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLFilial: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRLComissao: TQRLabel;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText5: TQRDBText;
    QRLValComis: TQRLabel;
    QRLTotal_G: TQRLabel;
    QRLTotal_P: TQRLabel;
    QRLTotal_A: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    fVal_Total,fTotalPago,fTotalAberto : Real;
  public
    Property pVal_Total : Real Read fVal_Total Write fVal_Total;
    Property pTotalPago : Real Read fTotalPago Write fTotalPago;
    Property pTotalAberto : Real Read fTotalAberto Write fTotalAberto;
    { Private declarations }
  end;

var
  FRMilhagem: TFRMilhagem;

implementation

uses UNotaSaidaParam, URelatorioVenda_cl;

{$R *.DFM}

procedure TFRMilhagem.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  fVal_Total := 0;
  fTotalPago := 0;
  fTotalAberto := 0;
end;

procedure TFRMilhagem.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLTotal_G.Caption := formatFloat('#,##0.00',fVal_Total * StrToFloat(FNotaSaidaParam.ME28Percentual.Text) / 100);
  QRLTotal_A.Caption := formatFloat('#,##0.00',fTotalAberto * StrToFloat(FNotaSaidaParam.ME28Percentual.Text) / 100);
  QRLTotal_P.Caption := formatFloat('#,##0.00',fTotalPago * StrToFloat(FNotaSaidaParam.ME28Percentual.Text) / 100);
end;

procedure TFRMilhagem.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  With DMRelatorio_Venda do
  Begin
    fVal_Total := fVal_Total +  QRMilhagemVal_Total.Value;
    fTotalPago :=  fTotalPago + QRMilhagemTotalPago.Value;
    fTotalAberto := fTotalAberto + QRMilhagemTotalAberto.Value;

  End;

end;

procedure TFRMilhagem.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DMRelatorio_Venda do
  Begin
    QRLValComis.Caption := formatFloat('#,##0.00',QRMilhagemVAL_TOTAL.Value * StrToFloat(FNotaSaidaParam.ME28Percentual.Text) / 100) ;
  End;    

end;

end.
