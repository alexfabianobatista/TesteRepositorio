unit FContI001;

interface

uses Arquivo, Registro, Controls;

type
  TFContI001 = class(TRegistro)
  private
  public
    IND_DAD: Integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContI001 }

procedure TFContI001.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

