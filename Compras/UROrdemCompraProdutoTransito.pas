unit UROrdemCompraProdutoTransito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFROrdemCompraProdutoTransito = class(TFTRelSimples)
    QRLbFornecedor: TQRLabel;
    QRLbFilial: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel6: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText15: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel16: TQRLabel;
    QRExpr3: TQRExpr;
    DetailBand1: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemCompraProdutoTransito: TFROrdemCompraProdutoTransito;

implementation

uses UOrdemCompra_cl;

{$R *.DFM}

end.
