unit RegistroE112;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE112 = Class (TRegistro)
    private
    public
      NUM_DA: String; //C
      NUM_PROC: String; //C(60)
      IND_PROC: String; //C(1)
      PROC: String; //C
      COD_OBS: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroE112 }

procedure TRegistroE112.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_DA);
  addCampo(NUM_PROC);
  addCampo(IND_PROC);
  addCampo(PROC);
  addCampo(COD_OBS);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
