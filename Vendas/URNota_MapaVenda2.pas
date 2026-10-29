unit URNota_MapaVenda2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, QRExport, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRNota_MapaVenda2 = class(TFTRelSimples)
    QRGCabFilial: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRDBTClasse: TQRDBText;
    QRDBTQuantidade: TQRDBText;
    QRDBTTotal: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBTCusto: TQRDBText;
    QRExprLucro: TQRExpr;
    QRBRodFilial: TQRBand;
    QRLabel8: TQRLabel;
    QRExprQuantidade: TQRExpr;
    QRExprTotal: TQRExpr;
    QRExprCusto: TQRExpr;
    QRExprSumLucro: TQRExpr;
    QRLVendedor_Oper: TQRLabel;
    QRLFornecedor: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLQuantidade: TQRLabel;
    QRLTotal: TQRLabel;
    QRLCusto: TQRLabel;
    QrlLucro: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_MapaVenda2: TFRNota_MapaVenda2;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

end.
