unit URFichaEquipamentoPeca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TFRFichaEquipamentoPeca = class(TForm)
    QRPrimario: TQuickRep;
    v: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    TitleBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel10: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFichaEquipamentoPeca: TFRFichaEquipamentoPeca;

implementation

uses UEquipamento_cl;

{$R *.DFM}

end.
