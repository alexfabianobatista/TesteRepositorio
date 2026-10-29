unit URProdutoBaixar2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRProdutoBaixar2 = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProdutoBaixar2: TFRProdutoBaixar2;

implementation

{$R *.dfm}

uses UProduto_cl;

end.
