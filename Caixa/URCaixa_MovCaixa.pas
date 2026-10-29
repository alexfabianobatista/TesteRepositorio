unit URCaixa_MovCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRCaixa_MovCaixa = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    QRBand3: TQRBand;
    QRBDetail: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBTHistorico: TQRDBText;
    QRDBTDtMovimento: TQRDBText;
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
    QRDBComplemento: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand7: TQRBand;
    QRLabel21: TQRLabel;
    QRLEntradas: TQRLabel;
    QRLSaidas: TQRLabel;
    QRLParc: TQRLabel;
    QRLTraco: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBObservacao: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLTotalCR: TQRLabel;
    procedure QRBDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCaixa_MovCaixa: TFRCaixa_MovCaixa;
  wReceita, wDespesa, wReceita_Dep, wDespesa_Dep: Real;

implementation

uses UCaixa_cl, UCaixaRel_cl, UOracle_cl, UCaixaParam, UParamSistema_cl;

{$R *.DFM}

procedure TFRCaixa_MovCaixa.QRBDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMCaixaRel.QRCaixa_MovCaixaInd_Operacao.Value = '+' then
  begin
    QRDBTVal_Movimento.Left := 586;
    wReceita := wReceita + DMCaixaRel.QRCaixa_MovCaixaVal_Movimento.Value;
    wReceita_Dep := wReceita_Dep + DMCaixaRel.QRCaixa_MovCaixaVal_Movimento.Value;
  end
  else
  begin
    QRDBTVal_Movimento.Left := 670;
    if DMParamSistema.CodEmpresa = 'INJEPAR' then
      QRDBTVal_Movimento.Left := 684;
    wDespesa := wDespesa + DMCaixaRel.QRCaixa_MovCaixaVal_Movimento.Value;
    wDespesa_Dep := wDespesa_Dep + DMCaixaRel.QRCaixa_MovCaixaVal_Movimento.Value;
  end;
  if DMCaixaRel.QRCaixa_MovCaixaCod_Conta_Receber_Cab.Text <> '' then
  begin
    QRLParc.Caption := DMOracle.BuscaNome('SELECT NUM_PARCELA FROM TB_CONTA_RECEBER_CAB', 'COD_CONTA_RECEBER_CAB = ' + DMCaixaRel.QRCaixa_MovCaixaCod_Conta_Receber_Cab.Text);
    QRLTraco.Caption := '/';
  end
  else
  begin
    QRLParc.Caption := '';
    QRLTraco.Caption := '';
  end;

  if DMParamSistema.CodEmpresa = 'PRAIASMI' then
  begin
    if ((DMCaixaRel.QRCaixa_MovCaixaDESC_COMPLEMENTO1.Text <> '') or
      (DMCaixaRel.QRCaixa_MovCaixaDESC_OBSERVACAO.Text <> '')) then
      QRBDetail.Height := 39
    else
      QRBDetail.Height := 18;
  end;
  if (DMParamSistema.CodEmpresa = 'HOSPITAL') then
  begin
    QRDBTHistorico.Left := 5;
    QRDBTHistorico.Width := 230;
  end;

end;

procedure TFRCaixa_MovCaixa.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
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

procedure TFRCaixa_MovCaixa.QRBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wreceita := 0;
  wdespesa := 0;
end;

procedure TFRCaixa_MovCaixa.QRBand7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLEntradas.Caption := FormatFloat('#,##0.00', wReceita_Dep);
  QRLSaidas.Caption := FormatFloat('#,##0.00', wDespesa_Dep);
  wReceita_Dep := 0;
  wDespesa_Dep := 0;
end;

procedure TFRCaixa_MovCaixa.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'PUBLICAR' then
  begin
    if FCaixaParam.RG2Saldo.ItemIndex = 0 then
      QRBand5.Enabled := True
    else
    begin
      QRBand5.Enabled := true;
      QRLabel10.Enabled := false;
      QRLabel13.Enabled := false;
      QRLSaldoAnterior.Enabled := false;
      QRLTotalEntradas.Enabled := true;
      QRLTotalSaidas.Enabled := true;
      QRLSaldoAtual.Enabled := false;
      QRLabel14.Enabled := false;
      QRLabel15.Enabled := false;
      QRLabel16.Enabled := false;
      QRLabel17.Enabled := false;
      QRLabel18.Enabled := false;
      QRLabel19.Enabled := false;
      QRDBText11.Enabled := false;
      QRDBText7.Enabled := false;
      QRDBText8.Enabled := false;
      QRDBText9.Enabled := false;
      QRLTotal.Enabled := false;
    end;
  end
  else
  begin
    if FCaixaParam.RG2Saldo.ItemIndex = 0 then
      QRBand5.Enabled := True
    else
      QRBand5.Enabled := False;
  end;
  if (DMParamSistema.CodEmpresa <> 'PERTUTTI') and (DMParamSistema.CodEmpresa <> 'INJEPAR') then
  begin
    QRLabel14.Visible := False;
    QRLabel15.Visible := False;
    QRLabel16.Visible := False;
    QRLabel17.Visible := False;
    QRLabel18.Visible := False;
    QRLabel19.Visible := False;
    QRDBText11.Visible := False;
    QRDBText7.Visible := False;
    QRDBText9.Visible := False;
    QRDBText8.Visible := False;
    QRLTotal.Visible := False;

    QRLabel14.Enabled := False;
    QRLabel15.Enabled := False;
    QRLabel16.Enabled := False;
    QRLabel17.Enabled := False;
    QRLabel18.Enabled := False;
    QRLabel19.Enabled := False;
    QRDBText11.Enabled := False;
    QRDBText7.Enabled := False;
    QRDBText9.Enabled := False;
    QRDBText8.Enabled := False;
    QRLTotal.Enabled := False;
  end;

end;

end.

