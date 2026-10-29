unit RegistroD360;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD360 = Class (TRegistro)
    private
    public
      VL_PIS: Double; //N(X,2)
      VL_COFINS: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD360 }

procedure TRegistroD360.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
