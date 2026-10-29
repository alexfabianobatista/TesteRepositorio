unit URSaldoDiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRSaldoDiario = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRLDepartamento: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLSaldoAnterior: TQRLabel;
    QRLabel5: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRLSaldodiario: TQRLabel;
    QRLabel7: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRSaldoDiario: TFRSaldoDiario;
  wSaldoFinal:real;
implementation

uses UCaixaRel_cl, UCaixa_cl;

{$R *.DFM}

procedure TFRSaldoDiario.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wSaldoFinal := wSaldoFinal + DMCaixaRel.QRSaldoDiarioSALDO.Value;
  QRLSaldoDiario.Caption:=FormatFloat('#,##0.00',wSaldoFinal);

end;

procedure TFRSaldoDiario.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wSaldoFinal :=DMCaixa.QSaldoCredito.Value-DMCaixa.QSaldoDebito.Value;
end;

end.
