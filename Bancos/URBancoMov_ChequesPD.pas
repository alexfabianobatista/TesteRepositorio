unit URBancoMov_ChequesPD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRBancoMov_ChequesPD = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand4: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand5: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRLPeriodo: TQRLabel;
    QRBand6: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel6: TQRLabel;
    QRExpr3: TQRExpr;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBancoMov_ChequesPD: TFRBancoMov_ChequesPD;

implementation

uses UBancoAgencia_cl, UBancoAgenciaRel_cl;

{$R *.DFM}

end.
