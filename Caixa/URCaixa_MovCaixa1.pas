unit URCaixa_MovCaixa1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRCaixa_MovCaixa1 = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBTVal_Movimento: TQRDBText;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLSaldoAnterior: TQRLabel;
    QRLTotalEntradas: TQRLabel;
    QRLTotalSaidas: TQRLabel;
    QRLSaldoAtual: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand6: TQRBand;
    QRLabel20: TQRLabel;
    QRLTotal: TQRLabel;
    QRDBText6: TQRDBText;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCaixa_MovCaixa1: TFRCaixa_MovCaixa1;
  wReceita, wDespesa:Real;

implementation

uses UCaixa_cl, UCaixaRel_cl;

{$R *.DFM}

procedure TFRCaixa_MovCaixa1.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMCaixaRel.QRCaixa_MovCaixaInd_Operacao.Value='+' then
    begin
      QRDBTVal_Movimento.Left:=599;
      wReceita:=wReceita+DMCaixaRel.QRCaixa_MovCaixaVal_Movimento.Value;
    end
  else
    begin
      QRDBTVal_Movimento.Left:=670;
      wDespesa:=wDespesa+DMCaixaRel.QRCaixa_MovCaixaVal_Movimento.Value;
    end;
end;

procedure TFRCaixa_MovCaixa1.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLSaldoAnterior.Caption:=FormatFloat('#,##0.00',DMCaixa.QSaldoCredito.Value-DMCaixa.QSaldoDebito.Value);
  QRLTotalEntradas.Caption:=FormatFloat('#,##0.00',wReceita);
  QRLTotalSaidas.Caption:=FormatFloat('#,##0.00',wDespesa);
  QRLSaldoAtual.Caption:=FormatFloat('#,##0.00',DMCaixa.QSaldoCredito.Value-DMCaixa.QSaldodebito.Value+wReceita-wDespesa);
  QRLTotal.Caption:=FormatFloat('#,##0.00',DMCaixaRel.QRCaixa_DetDinheiro.Value+
  DMCaixaRel.QRCaixa_DetCheques.Value+DMCaixaRel.QRCaixa_DetVales.Value+
  DMCaixaRel.QRCaixa_DetOutros.Value);
end;

procedure TFRCaixa_MovCaixa1.QRBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wreceita:=0;
  wdespesa:=0;
end;

end.
