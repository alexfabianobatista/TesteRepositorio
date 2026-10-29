unit URTabelaPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFRTabelaPreco = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText9: TQRDBText;
    QRGroup2: TQRGroup;
    QRGroup3: TQRGroup;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRHRule1: TQRHRule;
    QRLQtde: TQRLabel;
    QRLTotal: TQRLabel;
    QRDBVal_Total_Item: TQRDBText;
    QRDBQtd: TQRDBText;
    QRSumaryTabelaPreco: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel9: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTabelaPreco: TFRTabelaPreco;

implementation
uses UTabelaPreco_cl;

{$R *.dfm}

end.
