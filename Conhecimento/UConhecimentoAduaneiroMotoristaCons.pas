unit UConhecimentoAduaneiroMotoristaCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFConhecimentoAduaneiroMotoristaCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimentoAduaneiroMotoristaCons: TFConhecimentoAduaneiroMotoristaCons;

implementation

uses UConhecimento, UConhecimento_cl;

{$R *.dfm}

procedure TFConhecimentoAduaneiroMotoristaCons.BtProcurarClick(
  Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    QConhecimentoAduaneiroMotCons.Close;
    QConhecimentoAduaneiroMotCons.SetVariable('NOME', METexto.Text);
    QConhecimentoAduaneiroMotCons.Open;
  end;
end;

end.
