unit URCustoProducao_CentroCusto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QuickRpt, QRExport, QRWebFilt, QRPDFFilt,
  ExtCtrls;

type
  TFRCustoProducao_CentroCusto = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRDBText11: TQRDBText;
    QRDBText18: TQRDBText;
    QRBandFinalidade: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel3: TQRLabel;
    QRBand4: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCustoProducao_CentroCusto: TFRCustoProducao_CentroCusto;

implementation

{$R *.dfm}

end.
