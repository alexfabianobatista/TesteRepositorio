unit URPesagemProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRPesagemProducao = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr2: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPesagemProducao: TFRPesagemProducao;

implementation

uses UProdutoRelatorio_cl;

{$R *.dfm}

end.
