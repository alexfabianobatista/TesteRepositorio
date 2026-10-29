unit Registro0015;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro0015 = Class (TRegistro)
    private
    public
      UF_ST: String; //C(2)
      IE_ST: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0015 }

procedure TRegistro0015.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(UF_ST, 2);
  addCampo(IE_ST);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
