unit URProdutoLocalizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, Grids, DBGrids, QRExport,
  QRWebFilt, QRPDFFilt;

type
  TFRProdutoLocalizacao = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLabel5: TQRLabel;
    QRLPrecoAtacMin: TQRLabel;
    QRLPrecoVarMax: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLLocalizacao: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLSecao: TQRLabel;
    QRLBoqueta: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProdutoLocalizacao: TFRProdutoLocalizacao;

implementation

uses UProduto_cl, UParamSistema_cl, UProdutoRelatorio_cl;

{$R *.DFM}

end.
