unit URProdutoFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRProdutoporFornecedor = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProdutoporFornecedor: TFRProdutoporFornecedor;

implementation

uses UProduto_cl, UProdutoRelatorio_cl;

{$R *.DFM}

end.
