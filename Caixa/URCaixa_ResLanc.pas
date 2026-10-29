unit URCaixa_ResLanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, UBiblioteca, QRExport,
  QRWebFilt, QRPDFFilt;

type
  TFRCaixa_ResLanc = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLReceitas: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand4: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBTCredito: TQRDBText;
    QRDBTDebito: TQRDBText;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel9: TQRLabel;
    QRLSaldoAnterior: TQRLabel;
    QRLabel10: TQRLabel;
    QRLSaldoAtual: TQRLabel;
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCaixa_ResLanc: TFRCaixa_ResLanc;

implementation

uses UCaixa_cl, UCaixaRel_cl;

{$R *.DFM}

procedure TFRCaixa_ResLanc.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  //Saldo anterior e saldo atual. Solicitação Sidnei(Feira Calçados). Junior 26/06/2020
  QRLSaldoAnterior.Caption := FormatFloat('#,##0.00', DMCaixa.QSaldoCredito.Value - DMCaixa.QSaldoDebito.Value);
  QRLSaldoAtual.Caption := FormatFloat('#,##0.00', (DMCaixa.QSaldoCredito.Value - DMCaixa.QSaldodebito.Value) + QRExpr3.Value.dblResult );
  if QRExpr3.Value.dblResult > 0 then
  begin
    QRExpr3.Enabled := True;
    QRExpr4.Enabled := False;
  end
  else
  begin
    QRExpr3.Enabled := False;
    QRExpr4.Enabled := True;
  end;
end;

end.
