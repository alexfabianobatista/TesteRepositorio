unit URBancosMov_MovSaldosAvemed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRBancosMov_MovSaldosAvemed = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLPeriodo: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRLSALDO_LINHA: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel4: TQRLabel;
    QRGroup3: TQRGroup;
    QRLabel3: TQRLabel;
    QRSaldo: TQRLabel;
    QRGroup4: TQRGroup;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand3: TQRBand;
    QRLabel6: TQRLabel;
    QRLDebito: TQRLabel;
    QRLCredito: TQRLabel;
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroup3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBancosMov_MovSaldosAvemed: TFRBancosMov_MovSaldosAvemed;
  wSaldo,wDebito,wCredito:Real;

implementation

uses UBancoAgencia_cl, UBancoAgenciaRel_cl;

{$R *.DFM}

procedure TFRBancosMov_MovSaldosAvemed.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if not(DMBancoAgenciaRel.QRBancoMov_SaldosBanco.Locate('COD_CONTA_CORRENTE',DMBancoAgenciaRel.QRBancoMov_MovSaldosCOD_CONTA_CORRENTE.Value,[])) then
  begin
    QRSaldo.Caption := '0,00';
    wSaldo := 0;
  end
  else
  begin
    QRSaldo.Caption := FormatFloat('###,##0.00',DMBancoAgenciaRel.QRBancoMov_SaldosBancoSALDO.Value);
    wSaldo := DMBancoAgenciaRel.QRBancoMov_SaldosBancoSALDO.Value;
  end;
end;

procedure TFRBancosMov_MovSaldosAvemed.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wSaldo:=wSaldo+DMBancoAgenciaRel.QRBancoMov_MovSaldosVAL_MOVIMENTO.Value;
  QRLSALDO_LINHA.Caption:=FormatFloat('#,##0.00',wSaldo);
  If DMBancoAgenciaRel.QRBancoMov_MovSaldosVAL_MOVIMENTO.Value < 0 then
   Begin
    QRDBText4.Left := 731;
    wCredito := wCredito + DMBancoAgenciaRel.QRBancoMov_MovSaldosVAL_MOVIMENTO.Value;
   End
  else
   Begin
    wDebito := wDebito + DMBancoAgenciaRel.QRBancoMov_MovSaldosVAL_MOVIMENTO.Value;
    QRDBText4.Left := 539;
   End;
end;

procedure TFRBancosMov_MovSaldosAvemed.QRGroup2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
//  wSaldo:=0
end;

procedure TFRBancosMov_MovSaldosAvemed.QRGroup3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMBancoAgenciaRel.QRBancoMov_MovSaldosDESC_CONCILIA.Value = 'M' then
     QRLabel3.Caption := 'M O V I M E N T A Ç Ã O'
  else
     QRLabel3.Caption := 'C O N C I L I A Ç Ã O';
end;

procedure TFRBancosMov_MovSaldosAvemed.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLDebito.Caption:=FormatFloat('#,##0.00',wDebito);
  QRLCredito.Caption:=FormatFloat('#,##0.00',wCredito);
  wDebito := 0;
  wCredito := 0;
end;

end.
