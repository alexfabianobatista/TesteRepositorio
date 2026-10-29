unit URTipoEquipamentoCarac;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRTipoEquipamentoCarac = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTipoEquipamentoCarac: TFRTipoEquipamentoCarac;

implementation

uses UTipoEquipamento_cl;

{$R *.DFM}

procedure TFRTipoEquipamentoCarac.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:= CaFree;
  FRTipoEquipamentoCarac := Nil;
end;

end.
