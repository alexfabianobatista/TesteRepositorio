unit UnitEtiqueta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, Qrctrls, ExtCtrls, DBTables, Db, UBiblioteca, Barcode;

type
  TTEtiquetaBarra = class(TForm)
    QRPrimario: TQuickRep;
    DetailBand1: TQRBand;
    QRImage1: TQRImage;
    Barcode1: TBarcode;
    //Barcode1: Barcode;
    procedure QRPrimarioNeedData(Sender: TObject; var MoreData: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Clipbrd;

{$R *.DFM}

procedure TTEtiquetaBarra.QRPrimarioNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  Tag := Tag + 1;
  MoreData := Tag <= 39;
end;

procedure TTEtiquetaBarra.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Tag := 0;
end;

procedure TTEtiquetaBarra.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Barcode1.Digits := Bib.StrZero(IntToStr(Tag), 10);
  Barcode1.BarcodeCopy;
  QRImage1.Picture.Assign(Clipboard);
end;

end.

