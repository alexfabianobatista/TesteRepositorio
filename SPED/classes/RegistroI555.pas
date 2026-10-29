unit RegistroI555;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI555 = Class (TRegistro)
    private
    public
      RZ_CONT_TOT: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI555 }

procedure TRegistroI555.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(RZ_CONT_TOT);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
