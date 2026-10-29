unit UREtiquetaCodBarraNF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, QuickRpt, Qrctrls, ExtCtrls, Barcode;

type
  TFREtiquetaCodBarraNF = class(TForm)
    QRPrimario: TQuickRep;
    DetailBand1: TQRBand;
    QRImage1: TQRImage;
    Barcode1: TBarcode;
    QRImage2: TQRImage;
    QRImage3: TQRImage;
    Barcode2: TBarcode;
    Barcode3: TBarcode;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREtiquetaCodBarraNF: TFREtiquetaCodBarraNF;

implementation

uses Clipbrd, URelatorio_cl;

{$R *.DFM}

procedure TFREtiquetaCodBarraNF.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  Barcode1.Digits := DMOficina_Relatorio.QEtiquetaCodigoBarraETIQUETA1.Value;
  Barcode1.BarcodeCopy;
  QRImage1.Picture.Assign(Clipboard);

  Barcode2.Digits := DMOficina_Relatorio.QEtiquetaCodigoBarraETIQUETA2.Value;
  Barcode2.BarcodeCopy;
  QRImage2.Picture.Assign(Clipboard);

  Barcode3.Digits := DMOficina_Relatorio.QEtiquetaCodigoBarraETIQUETA3.Value;
  Barcode3.BarcodeCopy;
  QRImage3.Picture.Assign(Clipboard);

end;

end.
