unit URFichaEquipamentoItem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TFRFichaEquipamentoitem = class(TForm)
    QRPrimario: TQuickRep;
    v: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    c: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFichaEquipamentoitem: TFRFichaEquipamentoitem;

implementation

uses UEquipamento_cl;

{$R *.DFM}

end.
