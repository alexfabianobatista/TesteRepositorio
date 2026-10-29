unit ContFiscX350;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX350 = class(TRegistro)
  private

  public
    REC_LIQ: double; //(19,2)
    CUSTOS: double; //(19,2)
    LUC_BRUTO: double; //(19,2)
    REC_AUFERIDAS: double; //(19,2)
    REC_OUTRAS_OPER: double; //(19,2)
    DESP_BRASIL: double; //(19,2)
    DESP_OPER: double; //(19,2)
    LUC_OPER: double; //(19,2)
    REC_PARTIC: double; //(19,2)
    REC_OUTRAS: double; //(19,2)
    DESP_OUTRAS: double; //(19,2)
    LUC_LIC_ANT_IR: double; //(19,2)
    IMP_DEV: double; //(19,2)
    LUC_LIQ: double; //(19,2)
    LUC_ARB_ANT_IMP: double; //(19,2)
    IMP_DEV_ARB: double; //(19,2)
    LUC_ARB_PER_APUR: double; //(19,2)


    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX350.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(REC_LIQ, 2);
  addCampo(CUSTOS, 2);
  addCampo(LUC_BRUTO, 2);
  addCampo(REC_AUFERIDAS, 2);
  addCampo(REC_OUTRAS_OPER, 2);
  addCampo(DESP_BRASIL, 2);
  addCampo(DESP_OPER, 2);
  addCampo(LUC_OPER, 2);
  addCampo(REC_PARTIC, 2);
  addCampo(REC_OUTRAS, 2);
  addCampo(DESP_OUTRAS, 2);
  addCampo(LUC_LIC_ANT_IR, 2);
  addCampo(IMP_DEV, 2);
  addCampo(LUC_LIQ, 2);
  addCampo(LUC_ARB_ANT_IMP, 2);
  addCampo(IMP_DEV_ARB, 2);
  addCampo(LUC_ARB_PER_APUR, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
