unit UAtestadoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFAtestadoCons = class(TFTConsulta)
    MENumAtestado: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtestadoCons: TFAtestadoCons;

implementation

uses UAtestado_cl, UCadastro_cl, UCadastroCons;

{$R *.DFM}


procedure TFAtestadoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMAtestado do
  begin
    QAtestadoCons.Close;
    if Trim(MENumAtestado.Text) <> '' then
      QAtestadoCons.SetVariable('NUM_ATESTADO',Trim(MENumAtestado.Text))
    else
      QAtestadoCons.SetVariable('NUM_ATESTADO',null);
    QAtestadoCons.Open;
  end;
end;

end.
