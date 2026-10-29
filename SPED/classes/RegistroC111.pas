unit RegistroC111;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC111 = Class (TRegistro)
    private
    public
      NUM_PROC: String; //C(60)
      IND_PROC: String; //C(1)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC111 }

procedure TRegistroC111.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_PROC);
  addCampo(IND_PROC, 1);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
