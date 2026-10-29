unit URCadastro_Estado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRCadastro_Estado = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLEstado: TQRLabel;
    QRLabel4: TQRLabel;
    QRLTipoCadastro: TQRLabel;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCadastro_Estado: TFRCadastro_Estado;

implementation

uses UCadastro_Rel_cl;

{$R *.dfm}

end.
