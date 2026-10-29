unit URCaixa_ResLanc40Col;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFRCaixa_ResLanc40Col = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLReceitas: TQRLabel;
    QRLabel5: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBTCredito: TQRDBText;
    QRDBTDebito: TQRDBText;
    QRBand5: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRLPeriodo: TQRLabel;
    QRLabel10: TQRLabel;
    QRLSaldoAtual: TQRLabel;
    QRHRule1: TQRHRule;
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCaixa_ResLanc40Col: TFRCaixa_ResLanc40Col;

implementation
uses UCaixa_cl, UCaixaRel_cl;

{$R *.dfm}

procedure TFRCaixa_ResLanc40Col.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;                                                       
  QRLSaldoAtual.Caption := FormatFloat('#,##0.00', (QRExpr1.Value.dblResult - QRExpr3.Value.dblResult)); //(DMCaixaRel.QRCaixa_ResLancCREDITO.Value - DMCaixaRel.QRCaixa_ResLancDEBITO.Value));
end;

end.
