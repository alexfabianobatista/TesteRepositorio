unit URMovimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRMovimento = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRLDepartamento: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMovimento: TFRMovimento;

implementation

uses UFluxoCaixa_cl;

{$R *.DFM}

end.
