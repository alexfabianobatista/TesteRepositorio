unit RegistroC601;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC601 = Class (TRegistro)
    private
    public
      NUM_DOC_CANC: Integer; //N(9)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC601 }

procedure TRegistroC601.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_DOC_CANC, 9);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
