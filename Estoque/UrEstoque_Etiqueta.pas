unit UrEstoque_Etiqueta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls;

type
  TFrEstoque_Etiqueta = class(TForm)
    QRPrimario: TQuickRep;
    QRBand2: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrEstoque_Etiqueta: TFrEstoque_Etiqueta;

implementation

uses URelatorioEstoque_cl;

{$R *.dfm}

end.
