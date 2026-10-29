unit UROrdemPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls;

type
  TFROrdemPagamento = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRLFilial: TQRLabel;
    QRLCidade: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText15: TQRDBText;
    QRShape5: TQRShape;
    QRLabel17: TQRLabel;
    QRShape6: TQRShape;
    QRLabel18: TQRLabel;
    QRShape7: TQRShape;
    QRLabel19: TQRLabel;
    QRShape8: TQRShape;
    QRLabel20: TQRLabel;
    QRShape9: TQRShape;
    QRLabel21: TQRLabel;
    QRShape11: TQRShape;
    QRLabel23: TQRLabel;
    QRBand2: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRShape4: TQRShape;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel24: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel25: TQRLabel;
    QRDBText23: TQRDBText;
    QRLData: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRLabel26: TQRLabel;
    QRShape31: TQRShape;
    QRLabel27: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRLabel28: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel29: TQRLabel;
    QRShape36: TQRShape;
    QRLabel33: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText26: TQRDBText;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRLabel30: TQRLabel;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRLCondicao: TQRLabel;
    QRLContato: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    QRLPedido: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemPagamento: TFROrdemPagamento;

implementation

uses UNotaEntrada_cl;

{$R *.dfm}

end.
