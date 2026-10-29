unit Registro0460;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro0460 = Class (TRegistro)
    private
    public
      COD_OBS: String; //C
      TXT: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0460 }

procedure TRegistro0460.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_OBS);
  addCampo(TXT);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
