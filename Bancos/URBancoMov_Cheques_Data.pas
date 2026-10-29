unit URBancoMov_Cheques_Data;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRBancoMov_Cheques_Data = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel8: TQRLabel;
    QRBand6: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText11: TQRDBText;
    QRLVendedor: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBancoMov_Cheques_Data: TFRBancoMov_Cheques_Data;

implementation

uses UBancoAgencia_cl, UBancoAgenciaRel_cl;

{$R *.DFM}

end.
