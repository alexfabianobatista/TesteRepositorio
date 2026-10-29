unit URPedidoValor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRPedidoValor = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLPeriodo: TQRLabel;
    QRBand3: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLFilial: TQRLabel;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidoValor: TFRPedidoValor;

implementation

uses UPedido_cl;

{$R *.DFM}

end.
