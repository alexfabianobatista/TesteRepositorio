unit URContabilMovConf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFrContabilMovConf = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLConta1: TQRLabel;
    QRLConta2: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrContabilMovConf: TFrContabilMovConf;

implementation

uses UPlanilha_cl;

{$R *.DFM}

end.
