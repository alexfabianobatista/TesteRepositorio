unit UREtiqCodBarra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls, Barcode,clipbrd;

type
  TFREtiqCodBarra = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRLEmpresa: TQRLabel;
    QRImage1: TQRImage;
    Barcode1: TBarcode;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREtiqCodBarra: TFREtiqCodBarra;

implementation

uses UProdutoRelatorio_cl;

{$R *.dfm}

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

procedure TFREtiqCodBarra.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

begin
  FREtiqCodBarra.Barcode1.Digits:= RMaskCGC_CPF(DMProdutoRelatorio.QREtiquetaCodBarraETIQUETA1.Text,8);
  Barcode1.BarcodeCopy;
  QRImage1.Picture.Assign(ClipBoard);
  if Copy(DMProdutoRelatorio.QREtiquetaCodBarradesc_produto1.Text,1,1) = '.' then
  Begin
    QRLEmpresa.Enabled := False;
    QRDBText2.Enabled := False;
    QRImage1.Enabled := False;
    Barcode1.Enabled := False;
  end
  else
  Begin
    QRLEmpresa.Enabled := True;
    QRDBText2.Enabled := True;
    QRImage1.Enabled := True;
    Barcode1.Enabled := True;
  end;
end;

end.
