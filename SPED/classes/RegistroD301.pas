unit RegistroD301;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD301 = Class (TRegistro)
    private
    public
      NUM_DOC_CANC: Integer; //C(2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD301 }

procedure TRegistroD301.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_DOC_CANC, 0);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
