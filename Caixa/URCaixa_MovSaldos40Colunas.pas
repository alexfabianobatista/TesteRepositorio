unit URCaixa_MovSaldos40Colunas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRCaixa_MovSaldos40Colunas = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRLSaldoFinal: TQRLabel;
    QRBand6: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBTVal_Movimento: TQRDBText;
    QRLHistorico: TQRLabel;
    QRLabel3: TQRLabel;
    QRLSaldoAnterior: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel9: TQRLabel;
    procedure QRBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCaixa_MovSaldos40Colunas: TFRCaixa_MovSaldos40Colunas;
  wSaldoLinha:Real;

implementation

uses UCaixa_cl, UOracle_cl, UCaixaRel_cl;

{$R *.dfm}

procedure TFRCaixa_MovSaldos40Colunas.QRBand6BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
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
//      QRLSaldoLinha.Caption:=FormatFloat('#,##0.00',wSaldoLinha);
      QRDBTVal_Movimento.Left:=226;
    end
  Else
    begin
      wSaldoLinha:=wSaldoLinha+DMCaixaRel.QRCaixa_MovSaldosVAL_MOVIMENTO.Value;
//      QRLSaldoLinha.Caption:=FormatFloat('#,##0.00',wSaldoLinha);
      QRDBTVal_Movimento.Left:=180;
    end;

end;

procedure TFRCaixa_MovSaldos40Colunas.QRBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLSaldoFinal.Caption:=FormatFloat('#,##0.00',wSaldoLinha);
end;

procedure TFRCaixa_MovSaldos40Colunas.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  wSaldoLinha:=DMCaixa.QSaldoCredito.Value-DMCaixa.QSaldoDebito.Value;
end;

end.
