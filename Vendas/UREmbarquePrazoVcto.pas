unit UREmbarquePrazoVcto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFREmbarquePrazoVcto = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel4: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREmbarquePrazoVcto: TFREmbarquePrazoVcto;

implementation
uses uEmbarque_cl;
{$R *.dfm}

end.
