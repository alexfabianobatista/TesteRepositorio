unit Registro0450;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro0450 = Class (TRegistro)
    private
    public
      COD_INF: String; //C
      TXT: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0450 }

procedure TRegistro0450.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_INF);
  addCampo(TXT);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
