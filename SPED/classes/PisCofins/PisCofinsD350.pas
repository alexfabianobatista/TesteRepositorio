unit PisCofinsD350;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsD350 = class(TRegistro)
  private
  public
    COD_MOD: string; //C(2)
    ECF_MOD: string; //C(20)
    ECF_FAB: string; //C(20)
    DT_DOC: TDate; //N(8)
    CRO: Integer; //N(3)
    CRZ: Integer; //N(6)
    NUM_COO_FIN: Integer; //N(6)
    GT_FIN: Double; //N(X,2)
    VL_BRT: Double; //N(X,2)
    CST_PIS: Integer; //N(2)
    VL_BC_PIS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(8,4)
    QUANT_BC_PIS: Double; //N(X,3)
    ALIQ_PIS_QUANT: Double; //N(X,4)
    VL_PIS: Double; //N(X,2)
    CST_COFINS: Integer; //N(2)
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

{ TRegistro0001 }

procedure TPisCofinsD350.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(ECF_MOD, 20);
  addCampo(ECF_FAB, 20);
  addCampo(DT_DOC, 'D');
  addCampo(CRO, 3);
  addCampo(CRZ, 6);
  addCampo(NUM_COO_FIN, 6);
  addCampo(GT_FIN, 2);
  addCampo(VL_BRT, 2);
  addCampo(CST_PIS, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS, 2);
  addCampo(QUANT_BC_PIS, 2);
  addCampo(ALIQ_PIS_QUANT, 2);
  addCampo(VL_PIS, 2);
  addCampo(CST_COFINS, 2);
  addCampo(VL_BC_COFINS, 2);
  addCampo(ALIQ_COFINS, 2);
  addCampo(QUANT_BC_COFINS, 2);
  addCampo(ALIQ_COFINS_QUANT, 2);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
