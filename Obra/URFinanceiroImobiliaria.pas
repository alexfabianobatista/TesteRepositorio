unit URFinanceiroImobiliaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRFinanceiroImobiliaria = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand5: TQRBand;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText8: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFinanceiroImobiliaria: TFRFinanceiroImobiliaria;

implementation

uses UImobiliaria_cl;

{$R *.dfm}

end.
