unit RegistroD310;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD310 = Class (TRegistro)
    private
    public
      COD_MUN_ORIG: Integer; //N(7)
      VL_SERV: Double; //N(X,2)
      VL_BC_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD310 }

procedure TRegistroD310.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MUN_ORIG, 7);
  addCampo(VL_SERV, 2);
  addCampo(VL_BC_ICMS, 2);
  addCampo(VL_ICMS, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
