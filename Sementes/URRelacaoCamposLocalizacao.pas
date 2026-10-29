unit URRelacaoCamposLocalizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRRelacaoCamposLocalizacao = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand3: TQRBand;
    QRDBRichText1: TQRDBRichText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRelacaoCamposLocalizacao: TFRRelacaoCamposLocalizacao;

implementation

uses UCampoPlantio_cl;

{$R *.DFM}

end.
