unit RegistroE220;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE220 = Class (TRegistro)
    private
    public
      COD_AJ_APUR: String; //C(8)
      DESCR_COMPL_AJ: String; //C
      VL_AJ_APUR: Double; //N(2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroE220 }

procedure TRegistroE220.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_AJ_APUR, 8);
  addCampo(DESCR_COMPL_AJ);
  addCampo(VL_AJ_APUR, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
