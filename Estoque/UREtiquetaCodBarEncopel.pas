unit UREtiquetaCodBarEncopel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Barcode, clipbrd;

type
  TFREtiquetaCodBarEncopel = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRImage1: TQRImage;
    QRDBText3: TQRDBText;
    Barcode1: TBarcode;
    QRLabel2: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREtiquetaCodBarEncopel: TFREtiquetaCodBarEncopel;

implementation

uses UProduto_cl, UProdutoRelatorio_cl;

{$R *.DFM}

procedure TFREtiquetaCodBarEncopel.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  Barcode1.BarcodeCopy;
  QRImage1.Picture.Assign(ClipBoard);

end;

end.
