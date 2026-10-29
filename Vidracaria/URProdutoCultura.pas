unit URProdutoCultura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRProdutoCultura = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand5: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr1: TQRExpr;
    QRLabel4: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel9: TQRLabel;
    QRLFilial: TQRLabel;
    QRLVendedor: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLCultura: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRGroup3: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand6: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProdutoCultura: TFRProdutoCultura;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

end.
