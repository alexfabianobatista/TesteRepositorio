unit URPedidoItemQtdCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRPedidoItemQtdCliente = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel13: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGCabCidade: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText15: TQRDBText;
    QRBand4: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRGFTotal: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand5: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidoItemQtdCliente: TFRPedidoItemQtdCliente;

implementation

uses UPedido_cl;

{$R *.dfm}

end.
