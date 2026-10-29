unit URCadastro_MalaDiretaMaioresClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRCadastro_MalaDiretaMaioresClientes = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCadastro_MalaDiretaMaioresClientes: TFRCadastro_MalaDiretaMaioresClientes;

implementation

uses UCadastro_Rel_cl;

{$R *.DFM}

end.
