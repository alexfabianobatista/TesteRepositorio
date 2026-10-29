unit URCaixa_MovSaldos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRCaixa_MovSaldos = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBTVal_Movimento: TQRDBText;
    QRLSaldoLinha: TQRLabel;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRLSaldoAnterior: TQRLabel;
    QRBand6: TQRBand;
    QRLabel12: TQRLabel;
    QRLSaldoFinal: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLHistorico: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
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
  FRCaixa_MovSaldos: TFRCaixa_MovSaldos;
  wSaldoLinha:Real;

implementation

uses UCaixa_cl, UOracle_cl, UCaixaRel_cl;

{$R *.DFM}

procedure TFRCaixa_MovSaldos.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If Trim(DMCaixaRel.QRCaixa_MovSaldosDesc_Complemento.Text) <> '' Then
     QRLHistorico.Caption := Trim(DMCaixaRel.QRCaixa_MovSaldosDesc_Historico.Text) + '-' + Trim(DMCaixaRel.QRCaixa_MovSaldosDesc_Complemento.Text)
  Else
     If Trim(DMCaixaRel.QRCaixa_MovSaldosCod_Cadastro.Text) <> '' Then
        QRLHistorico.Caption := Trim(DMCaixaRel.QRCaixa_MovSaldosDesc_Historico.Text) + '-' + DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+ DMCaixaRel.QRCaixa_MovSaldosCod_Cadastro.Text)
     Else
        QRLHistorico.Caption := Trim(DMCaixaRel.QRCaixa_MovSaldosDesc_Historico.Text);
  If DMCaixaRel.QRCaixa_MovSaldosIND_OPERACAO.Value='-' then
    begin
      wSaldoLinha:=wSaldoLinha-DMCaixaRel.QRCaixa_MovSaldosVAL_MOVIMENTO.Value;
      QRLSaldoLinha.Caption:=FormatFloat('#,##0.00',wSaldoLinha);
      QRDBTVal_Movimento.Left:=575;
    end
  Else
    begin
      wSaldoLinha:=wSaldoLinha+DMCaixaRel.QRCaixa_MovSaldosVAL_MOVIMENTO.Value;
      QRLSaldoLinha.Caption:=FormatFloat('#,##0.00',wSaldoLinha);
      QRDBTVal_Movimento.Left:=479;
    end;

end;

procedure TFRCaixa_MovSaldos.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wSaldoLinha:=DMCaixa.QSaldoCredito.Value-DMCaixa.QSaldoDebito.Value;
end;

procedure TFRCaixa_MovSaldos.QRBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLSaldoFinal.Caption:=FormatFloat('#,##0.00',wSaldoLinha);
end;

end.
