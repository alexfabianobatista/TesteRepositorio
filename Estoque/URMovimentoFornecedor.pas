unit URMovimentoFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QuickRpt, QRExport, Qrctrls, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRMovimentoFornecedor = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel4: TQRLabel;
    QRLFornecedor: TQRLabel;
    QRLFilial: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand4: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRLClasse: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMovimentoFornecedor: TFRMovimentoFornecedor;

implementation

uses UProduto_cl, UProdutoRelatorio_cl;

{$R *.DFM}

end.
