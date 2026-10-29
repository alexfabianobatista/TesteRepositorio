unit URComissaoSintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRComissaoSintetico = class(TFTRelSimples)
    QRBand5: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLVendedor: TQRLabel;
    QRLData: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLFilial: TQRLabel;
    QRBand3: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRComissaoSintetico: TFRComissaoSintetico;

implementation

uses URelatorio_cl;

{$R *.dfm}

end.
