unit URNota_MapaVendaRes2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, QRExport, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRNota_MapaVendaRes2 = class(TFTRelSimples)
    QRGCabFilial: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBTTotal: TQRDBText;
    QRDBCusto: TQRDBText;
    QRExprLucro: TQRExpr;
    QRBRodFilial: TQRBand;
    QRLabel8: TQRLabel;
    QRExprQuantidade: TQRExpr;
    QRExprTotal: TQRExpr;
    QRExprCusto: TQRExpr;
    QRExprSumLucro: TQRExpr;
    QRLVendedor_Oper: TQRLabel;
    QRLFornecedor: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLTotal: TQRLabel;
    QrlCusto: TQRLabel;
    QRLLucro: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_MapaVendaRes2: TFRNota_MapaVendaRes2;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

end.
