unit RegistroC180;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC180 = Class (TRegistro)
    private
    public
      COD_RESP_RET: Integer; //N(1)                    02
      QUANT_CONV: Double; //N(X,6)                     03
      UNID: String; //C - tipo não encontrado          04
      VL_UNIT_CONV: Double;  //N(X,6)                  05
      VL_UNIT_ICMS_OP_CONV: Double;  //N(X,6)          06
      VL_UNIT_BC_ICMS_ST_CONV: Double;  //N(X,6)       07
      VL_UNIT_ICMS_ST_CONV: Double;  //N(X,6)          08
      VL_UNIT_FCP_ST_CONV: Double;  //N(X,6)           09
      COD_DA: String; //C (1)                          10
      NUM_DA: String; //C                              11

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC180 }

procedure TRegistroC180.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_RESP_RET,1);
  addCampo(QUANT_CONV,6);
  addCampo(UNID, 3);
  addCampo(VL_UNIT_CONV,6);
  addCampo(VL_UNIT_ICMS_OP_CONV,6);
  addCampo(VL_UNIT_BC_ICMS_ST_CONV,6);
  addCampo(VL_UNIT_ICMS_ST_CONV,6);
  addCampo(VL_UNIT_FCP_ST_CONV,6);
  addCampo(COD_DA, 1);
  addCampo(NUM_DA, 10);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.

