unit URPrevisaoPreColheita;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRPrevisaoLaudoPreColheita = class(TFTRelSimples)
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel14: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPrevisaoLaudoPreColheita: TFRPrevisaoLaudoPreColheita;

implementation

uses UPrevisaoLaudo_cl;

{$R *.DFM}

end.
