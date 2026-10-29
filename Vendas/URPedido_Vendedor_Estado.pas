unit URPedido_Vendedor_Estado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls, QRWebFilt,
  QRPDFFilt;

type
  TFRPedido_Vendedor_Estado = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRLabel5: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText6: TQRDBText;
    QRBand3: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRBand5: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedido_Vendedor_Estado: TFRPedido_Vendedor_Estado;

implementation

uses UEmbarque_cl;

{$R *.dfm}

end.
