unit UROrdemCompraNota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFROrdemCompraNota = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    QRDBText9: TQRDBText;
    QRLFornecedor: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand3: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel16: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText15: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText14: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLFilial: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemCompraNota: TFROrdemCompraNota;

implementation

uses UOrdemCompra_cl;

{$R *.DFM}

end.
