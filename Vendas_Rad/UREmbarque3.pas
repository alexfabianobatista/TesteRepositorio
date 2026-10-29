unit UREmbarque3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFREmbarque3 = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand4: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREmbarque3: TFREmbarque3;

implementation

uses UEmbarque_cl;

{$R *.DFM}

end.
