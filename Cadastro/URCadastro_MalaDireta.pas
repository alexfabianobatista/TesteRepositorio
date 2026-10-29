unit URCadastro_MalaDireta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls;

type
  TFRCadastro_MalaDireta = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel2: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCadastro_MalaDireta: TFRCadastro_MalaDireta;

implementation

uses UCadastro_Rel_cl;


{$R *.DFM}






end.
