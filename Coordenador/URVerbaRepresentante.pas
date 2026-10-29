unit URVerbaRepresentante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRCtrls, QuickRpt, ExtCtrls;

type
  TFRVerbaRepresentante = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLMes: TQRLabel;
    QRLAno: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand4: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVerbaRepresentante: TFRVerbaRepresentante;

implementation

uses UVerbaRepresentante_cl;

{$R *.dfm}

end.
