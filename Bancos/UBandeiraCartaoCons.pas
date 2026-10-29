unit UBandeiraCartaoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFBandeiraCartaoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBandeiraCartaoCons: TFBandeiraCartaoCons;

implementation
uses UOracle_cl, UBandeiraCartao_cl;

{$R *.dfm}

procedure TFBandeiraCartaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMBandeiraCartao do
  begin
    QBandeiraCartaoCons.Close;
    if Trim(METexto.Text) <> '' then
      QBandeiraCartaoCons.SetVariable('DESC_BANDEIRA_CARTAO',Trim(METexto.Text) )
    else
      QBandeiraCartaoCons.SetVariable('DESC_BANDEIRA_CARTAO', null);

    QBandeiraCartaoCons.Open;
  end;

end;

end.
