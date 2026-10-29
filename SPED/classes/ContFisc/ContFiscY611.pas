unit ContFiscY611;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY611 = class(TRegistro)
  private

  public
    PAIS: integer; //N(3)
    IND_PF_PJ: string; //C(2)
    CPF_CNPJ: string; //C(14)
    NOME_EMP: string; //C
    QUALIF: string; //C(2)
    VL_REM_TRAB: double; //N(19,2)
    VL_LUC_DIV: double; //N(19,2)
    VL_JUR_CAP: double; //N(19,2)
    VL_DEM_REND: double; //N(19,2)
    VL_IR_RET: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY611.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(PAIS, 3);
  addCampo(IND_PF_PJ);
  addCampo(CPF_CNPJ);
  addCampo(NOME_EMP);
  addCampo(QUALIF);
  addCampo(VL_REM_TRAB, 2);
  addCampo(VL_LUC_DIV, 2);
  addCampo(VL_JUR_CAP, 2);
  addCampo(VL_DEM_REND, 2);
  addCampo(VL_IR_RET, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
