unit URBancosMov_Lanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRBancosMov_Lanc = class(TFTRelSimples)
    QRDBText1: TQRDBText;
    QRLabel6: TQRLabel;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLPeriodo: TQRLabel;
    QRBand5: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand6: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    sss: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBancosMov_Lanc: TFRBancosMov_Lanc;

implementation

uses UBancoAgencia_cl, UBancoAgenciaRel_cl;

{$R *.DFM}

end.
