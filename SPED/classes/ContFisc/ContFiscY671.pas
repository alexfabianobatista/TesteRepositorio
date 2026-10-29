unit ContFiscY671;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY671 = class(TRegistro)
  private

  public
    VL_AQ_MAQ: double; //N(19,2)
    VL_DOA_CRIANCA: double; //N(19,2)
    VL_DOA_IDOSO: double; //N(19,2)
    VL_AQ_IMOBILIZADO: double; //N(19,2)
    VL_BX_IMOBILIZADO: double; //N(19,2)
    VL_INC_INI: double; //N(19,2)
    VL_INC_FIN: double; //N(19,2)
    VL_CSLL_DEPREC_INI: double; //N(19,2)
    VL_OC_SEM_IOF: double; //N(19,2)
    VL_FOLHA_ALIQ_RED: double; //N(19,2)
    VL_ALIQ_RED: double; //N(4,2)
    IND_ALTER_CAPITAL: integer; //N(1)
    IND_BCN_CSLL: integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY671.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(VL_AQ_MAQ, 2);
  addCampo(VL_DOA_CRIANCA, 2);
  addCampo(VL_DOA_IDOSO, 2);
  addCampo(VL_AQ_IMOBILIZADO, 2);
  addCampo(VL_BX_IMOBILIZADO, 2);
  addCampo(VL_INC_INI, 2);
  addCampo(VL_INC_FIN, 2);
  addCampo(VL_CSLL_DEPREC_INI, 2);
  addCampo(VL_OC_SEM_IOF, 2);
  addCampo(VL_FOLHA_ALIQ_RED, 2);
  addCampo(VL_ALIQ_RED, 1, 2);
  addCampo(IND_ALTER_CAPITAL, 1);
  addCampo(IND_BCN_CSLL, 1);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
