unit UREntregaEntregador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QuickRpt, QRExport, QRWebFilt, QRPDFFilt,
  ExtCtrls;

type
  TFREntregaEntregador = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGCabEntregador: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText15: TQRDBText;
    QRBand4: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRGFTotal: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr5: TQRExpr;
    QRBand5: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREntregaEntregador: TFREntregaEntregador;

implementation

uses UPedido_cl;

{$R *.dfm}

end.
