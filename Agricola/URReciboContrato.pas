unit URReciboContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFReciboContrato = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRLValorExtenso: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRLData: TQRLabel;
    QRLabel13: TQRLabel;
    QRLObs: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRSysData1: TQRSysData;
    QRLValor: TQRLabel;
    QRDBText9: TQRDBText;
    QRLCadastro: TQRLabel;
    QRLNome: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReciboContrato: TFReciboContrato;

implementation

uses UFilial_cl, Ucontrato_cl;

{$R *.DFM}

end.
