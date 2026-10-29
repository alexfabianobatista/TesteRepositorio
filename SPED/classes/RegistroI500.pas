unit RegistroI500;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI500 = Class (TRegistro)
    private
    public
      TAM_FONTE: Integer; //N(2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI500 }

procedure TRegistroI500.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(TAM_FONTE, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
