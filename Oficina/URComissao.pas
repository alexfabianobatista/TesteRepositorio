unit URComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRComissao = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRGroup1: TQRGroup;
    QRBand5: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLVendedor: TQRLabel;
    QRLData: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel13: TQRLabel;
    QRLFilial: TQRLabel;
    QRBand3: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRComissao: TFRComissao;

implementation

uses URelatorio_cl;

{$R *.dfm}

end.
