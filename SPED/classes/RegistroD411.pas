unit RegistroD411;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD411 = Class (TRegistro)
    private
    public
      NUM_DOC_CANC: Integer; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD411 }

procedure TRegistroD411.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_DOC_CANC, 0);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
