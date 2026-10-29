unit RegistroC170;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC170 = Class (TRegistro)
    private
    public
      NUM_ITEM: Integer; //N
      COD_ITEM: String; //C
      DESCR_COMPL: String; //C
      QTD: Double; //N(X,3)
      UNID: String; //C
      VL_ITEM: Double; //N(X,2)
      VL_DESC: Double; //N(X,2)
      IND_MOV: String; //C
      CST_ICMS: Integer; //N(3)
      CFOP: Integer; //N(4)
      COD_NAT: String; //C
      VL_BC_ICMS: Double; //N(X,2)
      ALIQ_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)
      VL_BC_ICMS_ST: Double; //N(X,2)
      ALIQ_ST: Double; //N(X,2)
      VL_ICMS_ST: Double; //N(X,2)
      IND_APUR: String; //C(1)
      CST_IPI: String; //C(2)
      COD_ENQ: String; //C(3)
      VL_BC_IPI: Double; //N(X,2)
      ALIQ_IPI: Double; //N(X,2)
      VL_IPI: Double; //N(X,2)
      CST_PIS: String; //N(2)
      VL_BC_PIS: Double; //N(X,2)
      ALIQ_PIS_PERC: Double; //N(X,2)
      QUANT_BC_PIS: Double; //N(X,3)
      ALIQ_PIS_VAL: Double; //N(X,4)
      VL_PIS: Double; //N(X,2)
      CST_COFINS: String; //N(2)
      VL_BC_COFINS: Double; //N(X,2)
      ALIQ_COFINS_PERC: Double; //N(X,2)
      QUANT_BC_COFINS: Double; //N(X,3)
      ALIQ_COFINS_VAL: Double; //N(X,4)
      VL_COFINS: Double; //N(X,2)
      COD_CTA: String; //C
      VL_ABAT_NT: Double;

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC170 }

procedure TRegistroC170.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_ITEM, 1);
  addCampo(COD_ITEM);
  addCampo(DESCR_COMPL);
  addCampo(QTD, 3);
  addCampo(UNID);
  addCampo(VL_ITEM, 2);
  addCampo(VL_DESC, 2);
  addCampo(IND_MOV, 1);
  addCampo(CST_ICMS, 3);
  addCampo(CFOP, 4);
  addCampo(COD_NAT);
  addCampo(VL_BC_ICMS, 2);
  addCampo(ALIQ_ICMS, 2);
  addCampo(VL_ICMS, 2);
  addCampo(VL_BC_ICMS_ST, 2);
  addCampo(ALIQ_ST, 2);
  addCampo(VL_ICMS_ST, 2);
  addCampo(IND_APUR, 1);
  addCampo(CST_IPI, 2);
  addCampo(COD_ENQ, 3);
  addCampo(VL_BC_IPI, 2);
  addCampo(ALIQ_IPI, 2);
  addCampo(VL_IPI, 2);
  addCampo(CST_PIS, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS_PERC, 2);
  addCampo(QUANT_BC_PIS, 3);
  addCampo(ALIQ_PIS_VAL, 4);
  addCampo(VL_PIS, 2);
  addCampo(CST_COFINS, 2);
  addCampo(VL_BC_COFINS, 2);
  addCampo(ALIQ_COFINS_PERC, 2);
  addCampo(QUANT_BC_COFINS, 3);
  addCampo(ALIQ_COFINS_VAL, 4);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA);
  addCampo(VL_ABAT_NT, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
