unit PisCofinsC175;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC175 = class(TRegistro)
  private
  public
    CFOP: string; //C(4)
    VL_OPR: double; //N(X,2)
    VL_DESC: double; //N(X,2)
    CST_PIS: string; //C(2)
    VL_BC_PIS: double; //N(X,2)
    ALIQ_PIS: double;  //N(8,4)
    QUANT_BC_PIS: string; //N(X,3)
    ALIQ_PIS_QUANT: string; //N(X,4)
    VL_PIS: double; //N(X,2)
    CST_COFINS: string; //C(2)
    VL_BC_COFINS: double; //N(X,2)
    ALIQ_COFINS: double; //N(8,4)
    QUANT_BC_COFINS: string; //N(X,3)
    ALIQ_COFINS_QUANT: string; //N(X,4)
    VL_COFINS: double; //N(X,2)
    COD_CTA: string; //C(60)
    INFO_COMPL: string; //C
    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC175 }

procedure TPisCofinsC175.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(CFOP, 4);
  addCampo(VL_OPR, 2);
  addCampo(VL_DESC, 2);
  addCampo(CST_PIS, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS, 3, 4);
  addCampo(QUANT_BC_PIS);
  addCampo(ALIQ_PIS_QUANT);
  addCampo(VL_PIS, 2);
  addCampo(CST_COFINS, 2);
  addCampo(VL_BC_COFINS, 2);
  addCampo(ALIQ_COFINS, 3, 4);
  addCampo(QUANT_BC_COFINS);
  addCampo(ALIQ_COFINS_QUANT);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA);
  addCampo(INFO_COMPL);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
