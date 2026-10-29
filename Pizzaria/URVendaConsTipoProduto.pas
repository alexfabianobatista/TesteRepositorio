unit URVendaConsTipoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadraoRelatorio, QRCtrls, QuickRpt, ExtCtrls;

type
  TFRVendaConsTipoProduto = class(TFPadraoRelatorio)
    QRLabel3: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr8: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVendaConsTipoProduto: TFRVendaConsTipoProduto;

implementation

uses UVendaCons, UDmVenda_Nova;

{$R *.dfm}

end.
