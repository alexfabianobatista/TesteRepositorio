unit URecibos2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, Grids, DBGrids;

type
  TFRRecibos2 = class(TForm)
    QuickRep1: TQuickRep;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText20: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText14: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel10: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel19: TQRLabel;
    QRLRODAPE: TQRLabel;
    QRShape1: TQRShape;
    QRLabel20: TQRLabel;
    QRDBText15: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRecibos2: TFRRecibos2;

implementation

uses UContasReceber_cl, UFilial_cl;

{$R *.DFM}

end.
