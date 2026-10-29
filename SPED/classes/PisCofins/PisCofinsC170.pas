unit PisCofinsC170;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC170 = class(TRegistro)
  private
  public
    NUM_ITEM: Integer; //N(3)
    COD_ITEM: string; //C(60)
    DESCR_COMPL: string; //C
    QTD: Double; //N(X,5)
    UNID: string; //C(6)
    VL_ITEM: Double; //N(X,2)
    VL_DESC: Double; //N(X,2)
    IND_MOV: string; //C(1)
    CST_ICMS: Integer; //N(3)
    CFOP: Integer; //N(4)
    COD_NAT: string; //C(10)
    VL_BC_ICMS: Double; //N(X,2)
    ALIQ_ICMS: Double; //N(3,2)
    VL_ICMS: Double; //N(X,2)
    VL_BC_ICMS_ST: Double; //N(X,2)
    ALIQ_ST: Double; //N(3,2)
    VL_ICMS_ST: Double; //N(X,2)
    IND_APUR: string; //C(1)
    CST_IPI: string; //C(2)
    COD_ENQ: string; //C(3)
    VL_BC_IPI: Double; //N(X,2)
    ALIQ_IPI: Double; //N(6,2)
    VL_IPI: Double; //N(X,2)
    CST_PIS: String; //N(2)
    VL_BC_PIS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(8,4)
    QUANT_BC_PIS: Double; //N(X,3)
    ALIQ_PIS_QUANT: Double; //N(X,4)
    VL_PIS: Double; //N(X,2)
    CST_COFINS: String; //N(2)
    VL_BC_COFINS: Double; //N(X,2)
    ALIQ_COFINS: Double; //N(8,4)
    QUANT_BC_COFINS: Double; //N(X,3)
    ALIQ_COFINS_QUANT: Double; //N(X,4)
    VL_COFINS: Double; //N(X,2)
    COD_CTA: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC170 }

procedure TPisCofinsC170.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_ITEM, 3);
  addCampo(COD_ITEM, 60);
  addCampo(DESCR_COMPL);
  addCampo(QTD, 5);
  addCampo(UNID, 6);
  addCampo(VL_ITEM, 2);
  addCampo(VL_DESC, 2);
  addCampo(IND_MOV, 1);
  addCampo(CST_ICMS, 3);
  addCampo(CFOP, 4);
  addCampo(COD_NAT, 10);
  addCampo(VL_BC_ICMS, 2);
  addCampo(ALIQ_ICMS, 3, 2);
  addCampo(VL_ICMS, 2);
  addCampo(VL_BC_ICMS_ST, 2);
  addCampo(ALIQ_ST, 3, 2);
  addCampo(VL_ICMS_ST, 2);
  addCampo(IND_APUR, 1);
  if CST_IPI <> '0' then
    addCampo(CST_IPI, 2)
  else
    addCampo('');
  addCampo(COD_ENQ, 3);
  addCampo(VL_BC_IPI, 2);
  addCampo(ALIQ_IPI, 3, 2);
  addCampo(VL_IPI, 2);
  addCampo(CST_PIS, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS, 3, 4);
  if QUANT_BC_PIS > 0 then
    addCampo(QUANT_BC_PIS, 3)
  else
    addCampo('');
  if ALIQ_PIS_QUANT > 0 then
    addCampo(ALIQ_PIS_QUANT, 4)
  else
    addCampo('');
  addCampo(VL_PIS, 2);
  addCampo(CST_COFINS, 2);
  addCampo(VL_BC_COFINS, 2);
  addCampo(ALIQ_COFINS, 3, 4);
  if QUANT_BC_COFINS > 0 then
    addCampo(QUANT_BC_COFINS, 3)
  else
    addCampo('');
  if ALIQ_COFINS_QUANT > 0 then
    addCampo(ALIQ_COFINS_QUANT, 4)
  else
    addCampo('');
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA, 60);
  
  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
