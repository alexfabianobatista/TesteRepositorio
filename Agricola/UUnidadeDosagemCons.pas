unit UUnidadeDosagemCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFUnidadeDosagemCons = class(TFTConsulta)
    Label2: TLabel;
    MECodigo: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUnidadeDosagemCons: TFUnidadeDosagemCons;

implementation

uses UPraga_cl;

{$R *.dfm}

procedure TFUnidadeDosagemCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMPraga do
  begin
    QUnidadeDosagemCons.Close;
    if MECodigo.Text <> '' then
      QUnidadeDosagemCons.SetVariable('CODIGO', StrToInt(MECodigo.Text))
    else
      QUnidadeDosagemCons.SetVariable('CODIGO', null);
    QUnidadeDosagemCons.SetVariable('UNIDADE', trim(METexto.Text));
    QUnidadeDosagemCons.Open;
  end;
end;

end.
