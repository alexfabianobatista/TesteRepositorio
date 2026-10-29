unit URProdutoBaixaEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QuickRpt, Qrctrls, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRProdutosBaixa = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel10: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    GroupHeaderBand1: TQRBand;
    QRLabel6: TQRLabel;
    GroupFooterBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel3: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProdutosBaixa: TFRProdutosBaixa;

implementation

uses UProduto_cl, UProdutoRelatorio_cl;

{$R *.DFM}

end.
