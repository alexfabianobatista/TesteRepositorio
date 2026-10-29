unit UrCaixaSaldoDep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFrCaixaSaldoDep = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel7: TQRLabel;
    QRLFilial: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrCaixaSaldoDep: TFrCaixaSaldoDep;

implementation

uses UCaixaRel_cl;

{$R *.DFM}

end.
