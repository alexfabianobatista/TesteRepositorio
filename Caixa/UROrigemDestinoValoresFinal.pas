unit UROrigemDestinoValoresFinal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, grimgctrl;

type
  TFROrigemDestinoValoresFinal = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRHRule1: TQRHRule;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrigemDestinoValoresFinal: TFROrigemDestinoValoresFinal;

implementation

uses UCaixaRel_cl, UROrigemDestinoValoresHoje, UROrigemDestinoValores;

{$R *.dfm}

end.
