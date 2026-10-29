unit UFRNota_MapaVendaRes40Colunas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRNota_MapaVendaRes40Colunas = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBTCodProduto: TQRDBText;
    QRDBTDescProduto: TQRDBText;
    QRDBTQuantidade: TQRDBText;
    QRDBTTotal: TQRDBText;
    QRBRodFilial: TQRBand;
    QRLabel8: TQRLabel;
    QRExprQuantidade: TQRExpr;
    QRExprTotal: TQRExpr;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_MapaVendaRes40Colunas: TFRNota_MapaVendaRes40Colunas;

implementation
uses URelatorioVenda_cl, UParamSistema_cl;

{$R *.dfm}

end.
