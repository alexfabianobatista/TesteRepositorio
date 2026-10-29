unit URPromissoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TFRPromissoria = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLDia: TQRLabel;
    QRLMes: TQRLabel;
    QRLAno: TQRLabel;
    QRLEndereco: TQRLabel;
    QRLCidade: TQRLabel;
    QRLEstado: TQRLabel;
    QRLCGCCPF: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPromissoria: TFRPromissoria;

implementation

uses UContasReceber_cl;

{$R *.DFM}

end.
