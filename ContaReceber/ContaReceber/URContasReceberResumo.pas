unit URContasReceberResumo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls;

type
  TFrContasReceberResumo = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand4: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    QRLPeriodo: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrContasReceberResumo: TFrContasReceberResumo;

implementation

uses UContasReceber_cl;

{$R *.DFM}

end.
