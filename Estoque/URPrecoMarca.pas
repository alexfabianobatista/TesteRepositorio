unit URPrecoMarca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRPrecoMarca = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLMarca: TQRLabel;
    QRLabel4: TQRLabel;
    QRLProduto: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    DBTDescProduto: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    DBTValCusto: TQRDBText;
    QRLCusto: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPrecoMarca: TFRPrecoMarca;

implementation

uses UProdutoRelatorio_cl;

{$R *.dfm}

end.
