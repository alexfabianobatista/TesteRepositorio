unit URCustos_Departamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QuickRpt, Qrctrls, ExtCtrls;

type
  TFRCustoDepartamento = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand4: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCustoDepartamento: TFRCustoDepartamento;
  mSaldo, mSaldoGrupo, mSaldoFinal: Real;

implementation

uses UDMCustos;

{$R *.DFM}

procedure TFRCustoDepartamento.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  mSaldo     := 0;
  mSaldoGrupo:= 0;
  mSaldoFinal:= 0;
end;

procedure TFRCustoDepartamento.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  mSaldo := (mSaldo + (DMCustos.QRCustoDepartamentoTEntrada.Value -
                       DMCustos.QRCustoDepartamentoTSaida.Value));
  QRLabel11.Caption := FloatToStrF(mSaldo,ffNumber,12,2);
  mSaldoFinal := mSaldoFinal + mSaldo;
end;

procedure TFRCustoDepartamento.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  mSaldo := 0;  // Inicializa valor da variavel.
  QRLabel12.Caption := FloatToStrF(mSaldoGrupo,ffNumber,12,2);
end;

procedure TFRCustoDepartamento.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  mSaldoGrupo := 0;  // reinicia valor da variavel.
end;

procedure TFRCustoDepartamento.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLabel13.Caption := FloatToStrF(mSaldoFinal,ffNumber,12,2);
end;

procedure TFRCustoDepartamento.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  mSaldoFinal := 0;  // Inicializa variavel
end;

procedure TFRCustoDepartamento.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  mSaldoGrupo := mSaldo            // mSaldoGrupo + mSaldo;
end;

end.
