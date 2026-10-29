unit URNotaVendasVndRegiao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRVendasVndRegiao = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRGroupVendedorRegiao: TQRGroup;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand5: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRBand4: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVendasVndRegiao: TFRVendasVndRegiao;

implementation
uses
   URelatorioVenda_cl;

{$R *.DFM}

end.
