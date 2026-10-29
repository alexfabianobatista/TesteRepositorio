unit FContI350;

interface

uses Arquivo, Registro, Controls;

type
  TFContI350 = class(TRegistro)
  private
  public
    DT_RES: TDate; //N(8)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContI350 }

procedure TFContI350.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_RES, 'D');

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
