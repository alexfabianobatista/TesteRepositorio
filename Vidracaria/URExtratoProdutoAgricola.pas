unit URExtratoProdutoAgricola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRExtratoProdutoAgricola = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBVal_Unitario: TQRDBText;
    QRDBVal_Total: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExprValorUnitario: TQRExpr;
    QRExprValorTotal: TQRExpr;
    QRLIcms: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRExtratoProdutoAgricola: TFRExtratoProdutoAgricola;

implementation

uses URelatorioVenda_cl;

{$R *.dfm}

end.
