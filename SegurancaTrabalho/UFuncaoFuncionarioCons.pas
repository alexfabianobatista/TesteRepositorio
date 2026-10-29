unit UFuncaoFuncionarioCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFFuncaoFuncionarioCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFuncaoFuncionarioCons: TFFuncaoFuncionarioCons;

implementation

uses UFuncaoFuncionario_cl;

{$R *.DFM}

procedure TFFuncaoFuncionarioCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMFuncaoFuncionario do
  begin
    QFuncaoFuncionarioCons.Close;
    QFuncaoFuncionarioCons.setVariable('DESC_FUNCAO_FUNCIONARIO',METexto.text);
    QFuncaoFuncionarioCons.open
  end
end;

end.
