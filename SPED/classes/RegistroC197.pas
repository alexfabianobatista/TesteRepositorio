unit RegistroC197;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC197 = Class (TRegistro)
    private
    public
      COD_AJ: String; //C(10)
      DESCR_COMPL_AJ: String; //C
      COD_ITEM: String; //C
      VL_BC_ICMS: Double; //N(X,2)
      ALIQ_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)
      VL_OUTROS: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC197 }

procedure TRegistroC197.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_AJ, 10);
  addCampo(DESCR_COMPL_AJ);
  addCampo(COD_ITEM);
  addCampo(VL_BC_ICMS, 2);
  addCampo(ALIQ_ICMS, 2);
  addCampo(VL_ICMS, 2);
  addCampo(VL_OUTROS, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
