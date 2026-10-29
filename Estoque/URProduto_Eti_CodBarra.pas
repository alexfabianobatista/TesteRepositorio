unit URProduto_Eti_CodBarra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Qrctrls, Barcode,clipbrd; //, DBarImage, DBarcode, nsbar, QrnsBar;

type
  TFREtiquetasCodBarra = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRLEmpresa: TQRLabel;
    QRLData: TQRLabel;
    QRLVolume: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    Barcode1: TBarcode;
    QRImage1: TQRImage;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    LData:String;
    LVolume:String;
    LEmpresa:String;
    LCodigo_Barra:String;
  public
    { Public declarations }
    property pData:String read LData write LData;
    property pVolume:String read LVolume write LVolume;
    property pEmpresa:String read LEmpresa write LEmpresa;
    property pCodigo_Barra:String read LCodigo_Barra write LCodigo_Barra;
  end;

var
  FREtiquetasCodBarra: TFREtiquetasCodBarra;

implementation

uses UProduto_cl;

{$R *.DFM}

procedure TFREtiquetasCodBarra.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Barcode1.BarcodeCopy;
  QRImage1.Picture.Assign(ClipBoard);
end;

end.
