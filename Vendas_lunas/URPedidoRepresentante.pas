unit URPedidoRepresentante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRPedidoRepresentante = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRLVendedor: TQRLabel;
    QRLPeriodo: TQRLabel;
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRBand3: TQRBand;
    QRLabel34: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRLabel35: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLSupervisor: TQRLabel;
    QRExpr9: TQRExpr;
    QRLabel3: TQRLabel;
    QRLMacarraoInst: TQRLabel;
    QRDBText8: TQRDBText;
    QRExpr10: TQRExpr;
    QRExpr19: TQRExpr;
    QRLabel4: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr20: TQRExpr;
    QRExpr23: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidoRepresentante: TFRPedidoRepresentante;

implementation

uses UPedido_cl;

{$R *.DFM}

end.
