unit UNotaSaidaVendasVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRVendasPorVendedor = class(TFTRelSimples)
    QRBand6: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand3: TQRBand;
    QRLFilial: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVendasPorVendedor: TFRVendasPorVendedor;

implementation
uses URelatorioVenda_cl;
{$R *.DFM}

end.
