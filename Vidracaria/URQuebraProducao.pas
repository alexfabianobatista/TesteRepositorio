unit URQuebraProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRQuebraProducao = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr2: TQRExpr;
    QRLSetor: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRQuebraProducao: TFRQuebraProducao;

implementation

uses UVidracaria_cl;

{$R *.dfm}

end.
