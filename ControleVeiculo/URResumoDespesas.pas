unit URResumoDespesas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRResumoDespesas = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand3: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRResumoDespesas: TFRResumoDespesas;

implementation

uses UCustoVeiculoMov_cl;

{$R *.DFM}

end.
