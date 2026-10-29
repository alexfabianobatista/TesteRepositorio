unit URBloqEmitBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRBloqEmitBanco = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand5: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand4: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRBloqEmitBanco: TFRBloqEmitBanco;

implementation

uses UBancoAgenciaRel_cl;

{$R *.DFM}

end.
