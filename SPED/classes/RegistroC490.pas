unit RegistroC490;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC490 = Class (TRegistro)
    private
    public
      CST_ICMS: Integer; //N(3)
      CFOP: Integer; //N(4)
      ALIQ_ICMS: Double; //N(X,2)
      VL_OPR: Double; //N(X,2)
      VL_BC_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)
      COD_OBS: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC490 }

procedure TRegistroC490.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(CST_ICMS, 3);
  addCampo(CFOP, 4);
  addCampo(ALIQ_ICMS, 2);
  addCampo(VL_OPR, 2);
  addCampo(VL_BC_ICMS, 2);
  addCampo(VL_ICMS, 2);
  addCampo(COD_OBS);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
