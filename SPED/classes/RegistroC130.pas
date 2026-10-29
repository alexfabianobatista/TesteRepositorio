unit RegistroC130;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC130 = Class (TRegistro)
    private
    public
      VL_SERV_NT: Double; //N(X,2)
      VL_BC_ISSQN: Double; //N(X,2)
      VL_ISSQN: Double; //N(X,2)
      VL_BC_IRRF: Double; //N(X,2)
      VL_IRRF: Double; //N(X,2)
      VL_BC_PREV: Double; //N(X,2)
      VL_PREV: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC130 }

procedure TRegistroC130.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(VL_SERV_NT, 2);
  addCampo(VL_BC_ISSQN, 2);
  addCampo(VL_ISSQN, 2);
  addCampo(VL_BC_IRRF, 2);
  addCampo(VL_IRRF, 2);
  addCampo(VL_BC_PREV, 2);
  addCampo(VL_PREV, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
