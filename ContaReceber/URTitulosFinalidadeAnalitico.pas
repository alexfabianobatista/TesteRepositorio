unit URTitulosFinalidadeAnalitico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRTitulosFinalidadeAnalitico = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTitulosFinalidadeAnalitico: TFRTitulosFinalidadeAnalitico;

implementation

uses UContasReceber_cl;

{$R *.dfm}

end.
