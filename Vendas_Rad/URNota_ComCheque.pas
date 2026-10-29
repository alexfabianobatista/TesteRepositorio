unit URNota_ComCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls;

type
  TFrNota_ComCheque = class(TFTRelSimples)
    QRLPrazo1: TQRLabel;
    QRLPrazo2: TQRLabel;
    QRLPrazo3: TQRLabel;
    QRLPrazo4: TQRLabel;
    QRLLongoPrazo: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel5: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrNota_ComCheque: TFrNota_ComCheque;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

end.
