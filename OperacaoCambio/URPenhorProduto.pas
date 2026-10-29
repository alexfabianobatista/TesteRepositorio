unit URPenhorProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QRExport, QuickRpt, ExtCtrls;

type
  TFRPenhorProduto = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPenhorProduto: TFRPenhorProduto;

implementation

uses UEGF_cl;

{$R *.DFM}

end.
