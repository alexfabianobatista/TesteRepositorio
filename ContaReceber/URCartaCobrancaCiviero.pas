unit URCartaCobrancaCiviero;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRCartaCobrancaCiviero = class(TForm)
    QRepCartaCobranca: TQuickRep;
    QRBand2: TQRBand;
    QRMemo1: TQRMemo;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel10: TQRLabel;
    QRMemo3: TQRMemo;
    QRLabel6: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCartaCobrancaCiviero: TFRCartaCobrancaCiviero;

implementation

uses UContasReceber_cl, UParamSistema_cl;

{$R *.DFM}

end.
