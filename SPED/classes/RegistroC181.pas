unit RegistroC181;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC181 = Class (TRegistro)
    private
    public
      COD_MOT_REST_COMPL: Integer; //C(5)                         02
      QUANT_CONV: Double; //N(X,6)                                03
      UNID: String; //C(6) - tipo não encontrado                  04
      COD_MOD_SAIDA: String; // C(2)                              05
      SERIE_SAIDA: String;  //C(2)                                06
      ECF_FAB_SAIDA: String;  // C(21)                            07
      NUM_DOC_SAIDA: String;  // C(9)                             08
      CHV_DFE_SAIDA: String;  // C(44)                            09
      DT_DOC_SAIDA: String;  // N(8)                              10
      NUM_ITEM_SAIDA: Integer; // N(3)                            11
      VL_UNIT_CONV_SAIDA: Double; // N(X,6)                       12
      VL_UNIT_ICMS_OP_ESTOQUE_CONV_SAIDA: Double; // N(X,6)       13
      VL_UNIT_ICMS_ST_ESTOQUE_CONV_SAIDA: Double; // N(X,6)       14
      VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV_SAIDA: Double; // N(X,6)   15
      VL_UNIT_ICMS_NA_OPERACAO_CONV_SAIDA: Double; // N(X,6)      16
      VL_UNIT_ICMS_OP_CONV_SAIDA: Double;// N(X,6)                17
      VL_UNIT_ICMS_ST_CONV_REST: Double; // N(X,6)                18
      VL_UNIT_FCP_ST_CONV_REST: Double; // N(X,6)                 19
      VL_UNIT_ICMS_ST_CONV_COMPL: Double; // N(X,6)               20
      VL_UNIT_FCP_ST_CONV_COMPL:  Double; // N(X,6)               21

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC181 }

procedure TRegistroC181.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOT_REST_COMPL,5);
  addCampo(QUANT_CONV,6);
  addCampo(UNID,6);
  addCampo(COD_MOD_SAIDA, 2);
  addCampo(SERIE_SAIDA, 2);
  addCampo(ECF_FAB_SAIDA, 21);
  addCampo(NUM_DOC_SAIDA, 9);
  addCampo(CHV_DFE_SAIDA, 44);
  addCampo(DT_DOC_SAIDA, 8);
  addCampo(NUM_ITEM_SAIDA, 3);
  addCampo(VL_UNIT_CONV_SAIDA, 6);
  addCampo(VL_UNIT_ICMS_OP_ESTOQUE_CONV_SAIDA, 6);
  addCampo(VL_UNIT_ICMS_ST_ESTOQUE_CONV_SAIDA, 6);
  addCampo(VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV_SAIDA, 6);
  addCampo(VL_UNIT_ICMS_NA_OPERACAO_CONV_SAIDA, 6);
  addCampo(VL_UNIT_ICMS_OP_CONV_SAIDA, 6);
  addCampo(VL_UNIT_ICMS_ST_CONV_REST, 6);
  addCampo(VL_UNIT_FCP_ST_CONV_REST, 6);
  addCampo(VL_UNIT_ICMS_ST_CONV_COMPL, 6);
  addCampo(VL_UNIT_FCP_ST_CONV_COMPL, 6);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.

