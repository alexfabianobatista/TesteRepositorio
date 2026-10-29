unit UEmailCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFEmailCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmailCons: TFEmailCons;

implementation

uses UCadastro_cl;

{$R *.dfm}

procedure TFEmailCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMCadastro do
  begin
    QEmailCons.Close;
    QEmailCons.SetVariable('EMAIL', Trim(METexto.Text));
    QEmailCons.Open;
  end;
end;

end.
