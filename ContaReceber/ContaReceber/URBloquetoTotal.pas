unit URBloquetoTotal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRBloquetoTotal = class(TForm)
    QRPrimario: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    DSBloquetoCodigoBarra: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBloquetoTotal: TFRBloquetoTotal;

implementation

uses UContasReceber_cl;

{$R *.DFM}

end.
