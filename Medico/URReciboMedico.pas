unit URReciboMedico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRReciboMedico = class(TFTRelSimples)
    QRLFoneFax: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText11: TQRDBText;
    QRGroup1: TQRGroup;
    QRBand6: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel3: TQRLabel;
    QRLNumRecibo: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText15: TQRDBText;
    QRLValorExtenso: TQRLabel;
    QRLabel13: TQRLabel;
    QRLData: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText12: TQRDBText;
    QRLabel14: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRReciboMedico: TFRReciboMedico;

implementation

uses UFilial_cl, ULancamento_cl;

{$R *.dfm}

end.
