unit URMovMercadoria_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls;

type
  TFRMovMercadoria_Sintetico = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand5: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLPeriodo: TQRLabel;
    QRLVendedor: TQRLabel;
    QRLDepartamento: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMovMercadoria_Sintetico: TFRMovMercadoria_Sintetico;

implementation

uses URelatorioVenda_cl;

{$R *.dfm}

end.
