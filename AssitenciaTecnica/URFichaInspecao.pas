unit URFichaInspecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, DB, grimgctrl;

type
  TFRFichaInspecao = class(TFTRelSimples)
    QRBand3: TQRBand;
    DataSource1: TDataSource;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRBand5: TQRBand;
    QRMemo1: TQRMemo;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel54: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText17: TQRDBText;
    QRShape1: TQRShape;
    QRDBText11: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape5: TQRShape;
    QRDBText8: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText21: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFichaInspecao: TFRFichaInspecao;

implementation

{$R *.dfm}
uses UOrdemServico_cl;

end.
