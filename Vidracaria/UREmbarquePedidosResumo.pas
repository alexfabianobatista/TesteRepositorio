unit UREmbarquePedidosResumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFREmbarquePedidosResumo = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    qrdbtProduto: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREmbarquePedidosResumo: TFREmbarquePedidosResumo;

implementation

uses UVidracaria_cl;

{$R *.dfm}

end.
