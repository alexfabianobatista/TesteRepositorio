unit URCadastroDadosPessoais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRCadastroDadosPessoais = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRSysData3: TQRSysData;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCadastroDadosPessoais: TFRCadastroDadosPessoais;

implementation

uses UCadastro_Rel_cl;

{$R *.DFM}

end.
