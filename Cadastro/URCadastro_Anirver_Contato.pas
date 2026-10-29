unit URCadastro_Anirver_Contato;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TFRCadastro_Aniversariante_Contato = class(TQuickRep)
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
  private

  public

  end;

var
  FRCadastro_Aniversariante_Contato: TFRCadastro_Aniversariante_Contato;

implementation

uses UCadastro_Rel_cl;

{$R *.DFM}

end.
