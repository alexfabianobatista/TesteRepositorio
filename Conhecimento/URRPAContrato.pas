unit URRPAContrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls, QRWebFilt,
  QRPDFFilt;

type
  TFRRPAContrato = class(TFTRelSimples)
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel14: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText16: TQRDBText;
    QRBand4: TQRBand;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr25: TQRExpr;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr16: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr11: TQRExpr;
    QRBand6: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel22: TQRLabel;
    QRExpr26: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel23: TQRLabel;
    QRDBText10: TQRDBText;
    QRExpr18: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr17: TQRExpr;
    QRDBText15: TQRDBText;
    QRExpr24: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel19: TQRLabel;
    QrlDtInicial: TQRLabel;
    QRLabel25: TQRLabel;
    QrlDtFinal: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText18: TQRDBText;
    QRGroup3: TQRGroup;
    QRDBText17: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText19: TQRDBText;
    QRBand7: TQRBand;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRExpr13: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr28: TQRExpr;
    QRExpr29: TQRExpr;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpr32: TQRExpr;
    QRExpr33: TQRExpr;
    QrlContrato: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRPAContrato: TFRRPAContrato;

implementation

uses URPA_cl;

{$R *.dfm}

end.
