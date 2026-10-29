unit Registro0206;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro0206 = Class (TRegistro)
    private
    public
      COD_COMB: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0206 }

procedure TRegistro0206.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_COMB);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
