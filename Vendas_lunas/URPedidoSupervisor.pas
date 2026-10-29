unit URPedidoSupervisor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls;

type
  TFRPedidoSupervisor = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLMacarraoInst: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel40: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRBand4: TQRBand;
    QRLabel35: TQRLabel;
    QRLabel34: TQRLabel;
    QRExpr9: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr22: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidoSupervisor: TFRPedidoSupervisor;

implementation

uses UPedido_cl;

{$R *.dfm}

end.
