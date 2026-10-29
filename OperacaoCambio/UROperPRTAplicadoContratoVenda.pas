unit UROperPRTAplicadoContratoVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFROperPRTAplicadoContratoVenda = class(TFTRelSimples)
    QRBand3: TQRBand;
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText9: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRETotalAplicado: TQRExpr;
    QRETotalAplicadoReais: TQRExpr;
    QRESaldoReais: TQRExpr;
    QRESaldo: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel18: TQRLabel;
    QRLSaldoGeral: TQRLabel;
    QRExpr2: TQRExpr;
    QRLTotalGeralOperacao: TQRLabel;
    QRLTotalGeralOperacaoReais: TQRLabel;
    QRExpr4: TQRExpr;
    QRLSaldoGeralReais: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRDBText4: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText16: TQRDBText;
    QRExpr5: TQRExpr;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLDtOperacao: TQRLabel;
    QRLabel25: TQRLabel;
    QRLDtCredito: TQRLabel;
    QRLDtAplicacao: TQRLabel;
    QRLabel28: TQRLabel;
    QRLNumContrato: TQRLabel;
    QRExpr6: TQRExpr;
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
    wSaldoGeralReais : real;    
  public
    { Public declarations }
  end;

var
  FROperPRTAplicadoContratoVenda: TFROperPRTAplicadoContratoVenda;

implementation

uses UOperacaoCambio_cl;

{$R *.DFM}

procedure TFROperPRTAplicadoContratoVenda.FormCreate(Sender: TObject);
begin
  inherited;
  wTotalGeralOperacao := 0;
  wSaldoGeral := 0;
  wTotalGeralOperacaoReais := 0;
  wSaldoGeralReais := 0;
end;

procedure TFROperPRTAplicadoContratoVenda.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  wTotalGeralOperacao := 0;
  wSaldoGeral := 0;
  wTotalGeralOperacaoReais := 0;
  wSaldoGeralReais := 0;
end;

procedure TFROperPRTAplicadoContratoVenda.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  wTotalGeralOperacao := wTotalGeralOperacao + DMOperacaoCambio.QROperPRTAplicadoContratoVendaVAL_OPERACAO_DOLAR.Value;
  wSaldoGeral := wSaldoGeral + QRESaldo.Value.dblResult;
  wTotalGeralOperacaoReais := wTotalGeralOperacaoReais + DMOperacaoCambio.QROperPRTAplicadoContratoVendaVAL_OPERACAO_REAL.Value;
  wSaldoGeralReais := wSaldoGeralReais + QRESaldoReais.Value.dblResult;
end;

procedure TFROperPRTAplicadoContratoVenda.QRBand3BeforePrint(
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
