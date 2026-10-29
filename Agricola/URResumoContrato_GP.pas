unit URResumoContrato_GP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRResumoContrato_GP = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel10: TQRLabel;
    QRBand4: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QrlFilial: TQRLabel;
    QrlPeriodo: TQRLabel;
    QrlPrazo: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRBand5: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr1: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRResumoContrato_GP: TFRResumoContrato_GP;

implementation

uses Ucontrato_cl;

{$R *.dfm}

end.
