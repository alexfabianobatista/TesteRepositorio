unit UROrdemServico_Entrada5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFROrdemServico_Entrada5 = class(TFTRelSimples)
    Cliente: TQRLabel;
    QRILogo: TQRImage;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRBand4: TQRBand;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRBand5: TQRBand;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel20: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr6: TQRExpr;
    QRHRule3: TQRHRule;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText25: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemServico_Entrada5: TFROrdemServico_Entrada5;

implementation
uses UOrdemServico_cl, UParamSistema_cl;

{$R *.dfm}

end.
