unit URContasReceber_Duplicatas_Faville;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRContasReceberDuplicatas_Faville = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText16: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasReceberDuplicatas_Faville: TFRContasReceberDuplicatas_Faville;

implementation

uses UContasReceber_cl;

{$R *.DFM}

end.
