unit URegistroTipo60DCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFRegistroTipo60DCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegistroTipo60DCons: TFRegistroTipo60DCons;

implementation

uses UImpressoraFiscal_cl, DateUtils;

{$R *.dfm}

procedure TFRegistroTipo60DCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMImpressoraFiscal do
  begin
    QReg60DCons.Close;
    if Trim(MeTexto.Text) <> '' then
      QReg60DCons.SetVariable('DT_EMISSAO',METexto.Text)
    else
      QReg60DCons.SetVariable('DT_EMISSAO',null);
    QReg60DCons.Open;
  end;
end;

end.
