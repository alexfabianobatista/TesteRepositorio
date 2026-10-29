unit UROperACCAplicadoContratoVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFROperACCAplicadoContratoVenda = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand3: TQRBand;
    QRLabel9: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
    QRETotalAplicado: TQRExpr;
    QRESaldo: TQRExpr;
    QRLTotalGeralOperacao: TQRLabel;
    QRLSaldoGeral: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRETotalAplicadoReais: TQRExpr;
    QRESaldoReais: TQRExpr;
    QRExpr4: TQRExpr;
    QRLTotalGeralOperacaoReais: TQRLabel;
    QRLSaldoGeralReais: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText4: TQRDBText;
    qreTotalAplicadoTaxa: TQRExpr;
    QRLabel21: TQRLabel;
    QRDBText16: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr1: TQRExpr;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLDtOperacao: TQRLabel;
    QRLabel25: TQRLabel;
    QRLDtCredito: TQRLabel;
    QRLDtAplicacao: TQRLabel;
    QRLabel28: TQRLabel;
    QRLNumContrato: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    wTotalGeralOperacao : real;
    wSaldoGeral : real;
    wTotalGeralOperacaoReais : real;
    wTotalGeralOperacaoReaisTaxa : real;
    wSaldoGeralReais : real;
  public
    { Public declarations }
  end;

var
  FROperACCAplicadoContratoVenda: TFROperACCAplicadoContratoVenda;

implementation

uses UOperacaoCambio_cl;

{$R *.DFM}

procedure TFROperACCAplicadoContratoVenda.FormCreate(Sender: TObject);
begin
  inherited;
  wTotalGeralOperacao := 0;
  wSaldoGeral := 0;
  wTotalGeralOperacaoReais := 0;
  wSaldoGeralReais := 0;
  wTotalGeralOperacaoReaisTaxa := 0;
end;

procedure TFROperACCAplicadoContratoVenda.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  wTotalGeralOperacao := 0;
  wSaldoGeral := 0;
  wTotalGeralOperacaoReais := 0;
  wSaldoGeralReais := 0;
  wTotalGeralOperacaoReaisTaxa := 0;
end;

procedure TFROperACCAplicadoContratoVenda.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  wTotalGeralOperacao := wTotalGeralOperacao + DMOperacaoCambio.QROperACCAplicadoContratoVendaVAL_OPERACAO_DOLAR.Value;
  wSaldoGeral := wSaldoGeral + QRESaldo.Value.dblResult;
  wTotalGeralOperacaoReais := wTotalGeralOperacaoReais + DMOperacaoCambio.QROperACCAplicadoContratoVendaVAL_OPERACAO_REAL.Value;
  wSaldoGeralReais := wSaldoGeralReais + QRESaldoReais.Value.dblResult;

  wTotalGeralOperacaoReaisTaxa := wTotalGeralOperacaoReaisTaxa + DMOperacaoCambio.QROperACCAplicadoContratoVendaVAL_OPERACAO_REAL.Value;
end;

procedure TFROperACCAplicadoContratoVenda.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLTotalGeralOperacao.Caption := FormatFloat('#,##0.00', wTotalGeralOperacao);
  QRLSaldoGeral.Caption := FormatFloat('#,##0.00', wSaldoGeral);
  QRLTotalGeralOperacaoReais.Caption := FormatFloat('#,##0.00', wTotalGeralOperacaoReais);
  QRLSaldoGeralReais.Caption := FormatFloat('#,##0.00', wSaldoGeralReais);

  wTotalGeralOperacao := 0;
  wSaldoGeral := 0;
  wTotalGeralOperacaoReais := 0;
  wSaldoGeralReais := 0;
end;

end.
