unit URCaixaMensal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRCaixaMensal = class(TFTRelSimples)
    QRBand3: TQRBand;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRLSaldoAnterior: TQRLabel;
    QRLSaldoGeral: TQRLabel;
    QRShape1: TQRShape;
    ColumnHeaderBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLSaldoFinal: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape2: TQRShape;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCaixaMensal: TFRCaixaMensal;
  wSaldoLinha:Real;
implementation

uses UCaixaRel_cl, UCaixa_cl;

{$R *.dfm}

procedure TFRCaixaMensal.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wSaldoLinha:=DMCaixa.QSaldoCredito.Value-DMCaixa.QSaldoDebito.Value;
  QRLSaldoAnterior.Caption := FormatFloat('#,##0.00',wSaldoLinha);
end;

procedure TFRCaixaMensal.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wSaldoLinha := wSaldoLinha - DMCaixaRel.QRCaixaMensalDEBITO.Value + DMCaixaRel.QRCaixaMensalCREDITO.Value;
  QRLSaldoGeral.Caption := FormatFloat('#,##0.00',wSaldoLinha);
end;

procedure TFRCaixaMensal.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLSaldoFinal.Caption := FormatFloat('#,##0.00',wSaldoLinha);
end;

end.
