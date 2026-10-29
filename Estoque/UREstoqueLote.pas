unit UREstoqueLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QuickRpt, QRExport, QRWebFilt, QRPDFFilt,
  ExtCtrls;

type
  TFREstoqueLote = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREstoqueLote: TFREstoqueLote;

implementation

uses UProdutoRelatorio_cl;

{$R *.dfm}

end.
