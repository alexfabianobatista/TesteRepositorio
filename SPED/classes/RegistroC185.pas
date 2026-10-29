unit RegistroC185;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC185 = Class (TRegistro)
    private
    public
      NUM_ITEM: Integer; //N(3)
      COD_ITEM: Integer; //C(60)
      CST_ICMS: Integer; //N(3)
      CFOP: Integer; //N(4)
      COD_MOT_REST_COMPL: Integer; //N(5)
      QUANT_CONV: Double; //N(X,6)
      UNID: String; //C - tipo não encontrado
      VL_UNIT_CONV: Double;  //N(X,6)
      VL_UNIT_ICMS_OPERACAO_CONV: Double;  //N(X,6)
      VL_UNIT_ICMS_OP_CONV: Double;  //N(X,6)
      VL_UNIT_ICMS_OP_ESTOQUE_CONV: Double;  //N(X,6)
      VL_UNIT_ICMS_ST_ESTOQUE_CONV: Double;  //N(X,6)
      VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV: Double;  //N(X,6)
      VL_UNIT_ICMS_ST_CONV_REST: Double;  //N(X,6)
      VL_UNIT_FCP_ST_CONV_REST: Double;  //N(X,6)
      VL_UNIT_ICMS_ST_CONV_COMPL: Double;  //N(X,6)
      VL_UNIT_FCP_ST_CONV_COMPL: Double;  //N(X,6)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC185 }

procedure TRegistroC185.grava;
begin
  inherited;

  addCampo(bloco + registro);
      addCampo(NUM_ITEM, 3);
      addCampo(COD_ITEM, 60);
      addCampo(CST_ICMS, 3);
      addCampo(CFOP, 4);
      addCampo(COD_MOT_REST_COMPL, 5);
      addCampo(QUANT_CONV, 6);
      addCampo(UNID, 3);
      addCampo(VL_UNIT_CONV, 6);
      addCampo(VL_UNIT_ICMS_OPERACAO_CONV, 6);
      addCampo(VL_UNIT_ICMS_OP_CONV, 6);
      addCampo(VL_UNIT_ICMS_OP_ESTOQUE_CONV, 6);
      addCampo(VL_UNIT_ICMS_ST_ESTOQUE_CONV, 6);
      addCampo(VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV, 6);
      addCampo(VL_UNIT_ICMS_ST_CONV_REST, 6);
      addCampo(VL_UNIT_FCP_ST_CONV_REST, 6);
      addCampo(VL_UNIT_ICMS_ST_CONV_COMPL, 6);
      addCampo(VL_UNIT_FCP_ST_CONV_COMPL, 6);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.

