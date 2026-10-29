unit URFixarSintetico_Res;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRFixarSintetico_Res = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLDepartamento: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRExpr8: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFixarSintetico_Res: TFRFixarSintetico_Res;

implementation

uses URomaneioRel_cl;

{$R *.DFM}

end.
