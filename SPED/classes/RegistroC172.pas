unit RegistroC172;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC172 = Class (TRegistro)
    private
    public
      VL_BC_ISSQN: Double; //N(X,2)
      ALIQ_ISSQN: Double; //N(X,2)
      VL_ISSQN: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC172 }

procedure TRegistroC172.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(VL_BC_ISSQN, 2);
  addCampo(ALIQ_ISSQN, 2);
  addCampo(VL_ISSQN, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end. 
