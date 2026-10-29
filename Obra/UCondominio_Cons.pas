unit UCondominio_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFCondominio_Cons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCondominio_Cons: TFCondominio_Cons;

implementation

uses UImobiliaria_cl;

{$R *.dfm}

procedure TFCondominio_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMImobiliaria.QCondominio_Cons.Close;
  DMImobiliaria.QCondominio_Cons.SetVariable('Descricao',Trim(MeTexto.Text));
  DMImobiliaria.QCondominio_Cons.Open;
end;

end.
