unit RegistroE510;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE510 = Class (TRegistro)
    private
    public
      CFOP: Integer; //C(4)
      CST_IPI: String; //C(2)
      VL_CONT_IPI: Double; //N(X,2)
      VL_BC_IPI: Double; //N(X,2)
      VL_IPI: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroE510 }

procedure TRegistroE510.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(CFOP, 4);
  addCampo(CST_IPI, 2);
  addCampo(VL_CONT_IPI, 2);
  addCampo(VL_BC_IPI, 2);
  addCampo(VL_IPI, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
