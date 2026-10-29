unit RegistroC310;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC310 = Class (TRegistro)
    private
    public
      NUM_DOC_CANC: Integer; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC310 }

procedure TRegistroC310.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_DOC_CANC, 0);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
