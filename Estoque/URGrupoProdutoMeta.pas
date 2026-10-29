unit URGrupoProdutoMeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRGrupoProdutoMeta = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLProduto: TQRLabel;
    QRLabel4: TQRLabel;
    QRLGrupo: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRGrupoProdutoMeta: TFRGrupoProdutoMeta;

implementation

uses UGrupoProdutoMeta_cl;

{$R *.dfm}

end.
