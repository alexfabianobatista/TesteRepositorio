unit URSaldoFixar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRelSimples, QRCtrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt,
  QRPDFFilt;

type
  TFRSaldoFixar = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel3: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText12: TQRDBText;
    QRExpr6: TQRExpr;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRSaldoFixar: TFRSaldoFixar;

implementation

uses UCadastro_cl, UContratoArroz_cl;

{$R *.dfm}

end.
