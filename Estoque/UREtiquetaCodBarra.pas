unit UREtiquetaCodBarra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Barcode,clipbrd;

type
  TFREtiquetaBarra = class(TForm)
    QRPrimario: TQuickRep;
    DetailBand1: TQRBand;
    Barcode1: TBarcode;
    QRImage1: TQRImage;
    Barcode2: TBarcode;
    Barcode3: TBarcode;
    Barcode4: TBarcode;
    Barcode5: TBarcode;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    QRImage5: TQRImage;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRLEmpresa: TQRLabel;
    QRLEmpresa2: TQRLabel;
    QRLEmpresa3: TQRLabel;
    QRLEmpresa4: TQRLabel;
    QRLEmpresa5: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREtiquetaBarra: TFREtiquetaBarra;

implementation

uses UProduto_cl, UProdutoRelatorio_cl;

{$R *.DFM}

function RMaskCGC_CPF( wCgc1 : String ; Zeros : Integer) : string;
var S : string;
    x : integer;
begin

for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0','1','2','3','4','5','6','7','8','9'] then
       S := S + wCgc1[x];

while Length(S) < Zeros do
      S := '0' + S;

Result := S;

end;

procedure TFREtiquetaBarra.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  with DMProdutoRelatorio do
  begin
    if QREtiquetaCodBarraETIQUETA1.Text <> '' then
    begin
      Barcode1.Digits:= RMaskCGC_CPF(Trim(QREtiquetaCodBarraETIQUETA1.Value),8);
      //Barcode1.BarcodeCopy;
      QRImage1.Visible := True;
      QRImage1.Enabled := True;
      QRImage1.Picture.Assign(Barcode1.PBitmap);
    end
    else
    begin
      QRLEmpresa.Caption := '';
      QRImage1.Visible := False;
      QRImage1.Enabled := False;
    end;

    if QREtiquetaCodBarraETIQUETA2.Text <> '' then
    begin
      QRImage2.Visible := True;
      QRImage2.Enabled := True;
      Barcode2.Digits:= RMaskCGC_CPF(Trim(QREtiquetaCodBarraETIQUETA2.Value),8);
      //Barcode2.BarcodeCopy;
      QRImage2.Picture.Assign(Barcode2.PBitmap);
    end
    else
    begin
      QRLEmpresa2.Caption := '';
      QRImage2.Visible := False;
      QRImage2.Enabled := False;
    end;

    if QREtiquetaCodBarraETIQUETA3.Text <> '' then
    begin
      QRImage3.Visible := True;
      QRImage3.Enabled := True;
      Barcode3.Digits:= RMaskCGC_CPF(Trim(QREtiquetaCodBarraETIQUETA3.Value),8);
      //Barcode3.BarcodeCopy;
      QRImage3.Picture.Assign(Barcode3.PBitmap);
    end
    else
    begin
      QRLEmpresa3.Caption := '';
      QRImage3.Visible := False;
      QRImage3.Enabled := False;
    end;

    if QREtiquetaCodBarraETIQUETA4.Text <> '' then
    begin
      QRImage4.Visible := True;
      QRImage4.Enabled := True;
      Barcode4.Digits:= RMaskCGC_CPF(Trim(QREtiquetaCodBarraETIQUETA4.Value),8);
      //Barcode4.BarcodeCopy;
      QRImage4.Picture.Assign(Barcode4.PBitmap);
    end
    else
    begin
      QRLEmpresa4.Caption := '';
      QRImage4.Visible := False;
      QRImage4.Enabled := False;
    end;

    if QREtiquetaCodBarraETIQUETA5.Text <> '' then
    begin
      QRImage5.Visible := True;
      QRImage5.Enabled := True;
      Barcode5.Digits:= RMaskCGC_CPF(Trim(QREtiquetaCodBarraETIQUETA5.Value),8);
      //Barcode5.BarcodeCopy;
      QRImage5.Picture.Assign(Barcode5.PBitmap);
    end
    else
    begin
      QRLEmpresa5.Caption := '';
      QRImage5.Visible := False;
      QRImage5.Enabled := False;
    end;

  end;
end;

end.
