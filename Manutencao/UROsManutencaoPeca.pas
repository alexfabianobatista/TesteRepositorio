unit UROsManutencaoPeca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, grimgctrl;

type
  TFROsManutencaoPeca = class(TForm)
    QuickRep1: TQuickRep;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
    QRHRule1: TQRHRule;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROsManutencaoPeca: TFROsManutencaoPeca;

implementation

uses UOSManutencao_cl;

{$R *.dfm}

end.
