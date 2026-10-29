unit UTermoAberturaCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFTermoAberturaCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTermoAberturaCons: TFTermoAberturaCons;

implementation

uses UTermoAbertura_cl, UUsuario_cl;

{$R *.dfm}

procedure TFTermoAberturaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMTermoAbertura do
    begin
      QTermoAberturaCons.Close;
      QTermoAberturaCons.SetVariable('DESC_NAT_LIVRO', METexto.Text);
      QTermoAberturaCons.Open;
    end;
end;

end.
