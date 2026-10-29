unit Registro1320;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro1320 = Class (TRegistro)
    private
    public
      NUM_TANQUE: String; //C
      FECH_FISICO: Double; //N(X,3)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro1320 }

procedure TRegistro1320.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_TANQUE);
  addCampo(FECH_FISICO, 3);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
