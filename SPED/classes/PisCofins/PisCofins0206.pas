unit PisCofins0206;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins0206 = class(TRegistro)
  private
  public
    COD_COMB: String; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins0206 }

procedure TPisCofins0206.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_COMB);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
