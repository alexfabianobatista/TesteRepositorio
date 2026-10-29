unit RegistroD697;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD697 = Class (TRegistro)
    private
    public
      UF: String; //C(2)
      VL_BC_ICMS_ST: Double; //N(X,2)
      VL_ICMS_ST: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD697 }

procedure TRegistroD697.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(UF, 2);
  addCampo(VL_BC_ICMS_ST, 2);
  addCampo(VL_ICMS_ST, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
