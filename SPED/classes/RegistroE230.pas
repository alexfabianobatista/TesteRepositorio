unit RegistroE230;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE230 = Class (TRegistro)
    private
    public
      NUM_DA: String; //C
      NUM_PROC: String; //C(60)
      IND_PROC: Integer; //N(1)
      PROC: String; //C
      COD_OBS: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroE230 }

procedure TRegistroE230.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_DA);
  addCampo(NUM_PROC);
  addCampo(IND_PROC, 1);
  addCampo(PROC);
  addCampo(COD_OBS);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
