unit URPrecoVendido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRPrecoVendido = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel12: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPrecoVendido: TFRPrecoVendido;

implementation

uses URelatorioVenda_cl;

{$R *.dfm}

end.
