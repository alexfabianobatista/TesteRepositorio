unit URProdutoCodBarraPeq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, QuickRpt, Qrctrls, ExtCtrls, Barcode;

type
  TFREtiquetaCodBarraPeq = class(TForm)
    QRPrimario: TQuickRep;
    DetailBand1: TQRBand;
    Barcode1: TBarcode;
    QRImage1: TQRImage;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREtiquetaCodBarraPeq: TFREtiquetaCodBarraPeq;

implementation

uses UProduto_cl, clipbrd, UProdutoRelatorio_cl;

{$R *.DFM}

procedure TFREtiquetaCodBarraPeq.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  Barcode1.Digits := DMProdutoRelatorio.QRProdutoCodBarraPeqCOD_PRODUTO.Text;
  Barcode1.BarcodeCopy;
  QRImage1.Picture.Assign(Clipboard);
end;

end.
