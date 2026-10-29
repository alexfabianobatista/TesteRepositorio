unit URFormulaMatPrima;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRFormulaMatPrima = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLFilial: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFormulaMatPrima: TFRFormulaMatPrima;

implementation
uses UOracle_cl, UFormula_cl;

{$R *.dfm}

end.
