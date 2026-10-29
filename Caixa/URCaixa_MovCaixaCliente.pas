unit URCaixa_MovCaixaCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRCaixa_MovCaixaCliente = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLPeriodo: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLFilial: TQRLabel;
    QRLHistorico: TQRLabel;
    QRLDepartamento: TQRLabel;
    QRLCadastro: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBTValEntrada: TQRDBText;
    QRDBTValSaida: TQRDBText;
    QRLRsEntrada: TQRLabel;
    QRLRsSaida: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand4: TQRBand;
    QREValEntrada: TQRExpr;
    QRLabel17: TQRLabel;
    QREValSaida: TQRExpr;
    QRLabel11: TQRLabel;
    QRLHistoricoFinal: TQRLabel;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText5: TQRDBText;
    QRLTotal: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLSaldoAnterior: TQRLabel;
    QRLTotalEntradas: TQRLabel;
    QRLTotalSaidas: TQRLabel;
    QRLSaldoAtual: TQRLabel;
    QRBand5: TQRBand;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCaixa_MovCaixaCliente: TFRCaixa_MovCaixaCliente;
  wReceita, wDespesa, wReceita_Dep, wDespesa_Dep: Real;

implementation

uses UCaixaRel_cl, UCaixa_cl;

{$R *.dfm}

procedure TFRCaixa_MovCaixaCliente.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;

  {if DMCaixaRel.QRCaixa_MovCaixaClienteVAL_MAIS.Value > 0 then
  begin
    QRLRsEntrada.Enabled := True;
    QRDBTValEntrada.Enabled := True;
    QRLRsSaida.Enabled := False;
    QRDBTValSaida.Enabled := False;
  end
  else
  begin
    QRLRsEntrada.Enabled := False;
    QRDBTValEntrada.Enabled := False;
    QRLRsSaida.Enabled := True;
    QRDBTValSaida.Enabled := True;
  end; }
  if DMCaixaRel.QRCaixa_MovCaixaClienteVAL_MAIS.Value > 0 then
    wReceita := wReceita + DMCaixaRel.QRCaixa_MovCaixaClienteVal_Mais.Value
  else
    wDespesa := wDespesa + DMCaixaRel.QRCaixa_MovCaixaClienteVal_Menos.Value;
   
end;

procedure TFRCaixa_MovCaixaCliente.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLSaldoAnterior.Caption := FormatFloat('#,##0.00', DMCaixa.QSaldoCredito.Value - DMCaixa.QSaldoDebito.Value);
  QRLTotalEntradas.Caption := FormatFloat('#,##0.00', wReceita);
  QRLTotalSaidas.Caption := FormatFloat('#,##0.00', wDespesa);
  QRLSaldoAtual.Caption := FormatFloat('#,##0.00', DMCaixa.QSaldoCredito.Value - DMCaixa.QSaldodebito.Value + wReceita - wDespesa);
  QRLTotal.Caption := FormatFloat('#,##0.00', DMCaixaRel.QRCaixa_DetDinheiro.Value +
    DMCaixaRel.QRCaixa_DetCheques.Value + DMCaixaRel.QRCaixa_DetVales.Value +
    DMCaixaRel.QRCaixa_DetOutros.Value);
end;

procedure TFRCaixa_MovCaixaCliente.QRBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  wreceita := 0;
  wdespesa := 0;
end;

end.

