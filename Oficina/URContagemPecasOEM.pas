unit URContagemPecasOEM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QRExport, QuickRpt, ExtCtrls;

type
  TFRContagemPecasOEM = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLFilial: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    Quantidade: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape1: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContagemPecasOEM: TFRContagemPecasOEM;

implementation

uses URelatorio_cl;

{$R *.DFM}

end.
