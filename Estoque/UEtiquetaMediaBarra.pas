unit UEtiquetaMediaBarra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Barcode, QuickRpt, ExtCtrls, clipbrd;

type
  TFREtiqueta_Media = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    Barcode1: TBarcode;
    QRDBText1: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREtiqueta_Media: TFREtiqueta_Media;

implementation

uses UProduto_cl, UProdutoRelatorio_cl;

{$R *.DFM}

procedure TFREtiqueta_Media.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Barcode1.BarcodeCopy;
  QRImage1.Picture.Assign(ClipBoard);
end;

end.
