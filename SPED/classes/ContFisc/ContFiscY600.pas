unit ContFiscY600;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY600 = class(TRegistro)
  private

  public
    DT_ALT_SOC: tdate; //C(8)
    DT_FIM_SOC: tdate; //C(8)
    PAIS: integer; //N(3)
    IND_QUALIF: string; //C(2)
    CPF_CNPJ: string; //C(14)
    NOME_EMP: string; //C
    QUALIF: string; //C(2)
    PERC_CAP_TOT: double; //N(4,2)
    PERC_CAP_VOT: double; //N(4,2)
    CPF_REP_LEG: string; //N(11)
    QUALIF_REP_LEG: string; //N(1)
    VL_REM_TRAB: string; //C(19,2)
    VL_LUC_DIV: string; //C(19,2)
    VL_JUR_CAP: string; //C(19,2)
    VL_DEM_REND: string; //C(19,2)
    VL_IR_RET: string; //C(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY600.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(DT_ALT_SOC, 'D');
  addCampo(DT_FIM_SOC, 'D');
  addCampo(PAIS, 3);
  addCampo(IND_QUALIF);
  addCampo(CPF_CNPJ);
  addCampo(NOME_EMP);
  addCampo(QUALIF);
  addCampo(PERC_CAP_TOT, 1,2);
  addCampo(PERC_CAP_VOT, 1,2);
  addCampo(CPF_REP_LEG);
  addCampo(QUALIF_REP_LEG);
  addCampo(VL_REM_TRAB);
  addCampo(VL_LUC_DIV);
  addCampo(VL_JUR_CAP);
  addCampo(VL_DEM_REND);
  addCampo(VL_IR_RET);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
