unit UAnpCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFAnpCons = class(TFTConsulta)
    MECodigo: TMaskEdit;
    Label2: TLabel;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAnpCons: TFAnpCons;

implementation

uses UAnp_cl;

{$R *.dfm}

procedure TFAnpCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMAnp do
  begin
    QAnpCons.Close;
    if Trim(METexto.Text) <> '' then
      QAnpCons.SetVariable('DESCRICAO', Trim(METexto.Text)+'%')
    else
      QAnpCons.SetVariable('DESCRICAO', null);
    if Trim(MECodigo.Text) <> '' then
      QAnpCons.SetVariable('COD_ANP', Trim(MECodigo.Text)+'%')
    else
      QAnpCons.SetVariable('COD_ANP', null);
    QAnpCons.Open;
  end;
end;

end.
