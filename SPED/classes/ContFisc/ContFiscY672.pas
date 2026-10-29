unit ContFiscY672;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY672 = class(TRegistro)
  private

  public
    VL_CAPITAL_ANT: double; //N(19,2)
    VL_CAPITAL: double; //N(19,2)
    VL_ESTOQUE_ANT: double; //N(19,2)
    VL_ESTOQUES: double; //N(19,2)
    VL_CAIXA_ANT: double; //N(19,2)
    VL_CAIXA: double; //N(19,2)
    VL_APLIC_FIN_ANT: double; //N(19,2)
    VL_APLIC_FIN: double; //N(19,2)
    VL_CTA_REC_ANT: double; //N(19,2)
    VL_CTA_REC: double; //N(19,2)
    VL_CTA_PAG_ANT: double; //N(19,2)
    VL_CTA_PAG: double; //N(19,2)
    VL_COMPRA_MERC: double; //N(19,2)
    VL_COMPRA_ATIVO: double; //N(19,2)
    VL_RECEITAS: double; //N(19,2)
    TOT_ATIVO: double; //N(19,2)
    VL_FOLHA: double; //N(19,2)
    VL_ALIQ_RED: double; //N(4,2)
    IND_REG_APUR: integer; //N(1)
    IND_AVAL_ESTOQ: string; //C(1)


    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY672.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(VL_CAPITAL_ANT, 2);
  addCampo(VL_CAPITAL, 2);
  addCampo(VL_ESTOQUE_ANT, 2);
  addCampo(VL_ESTOQUES, 2);
  addCampo(VL_CAIXA_ANT, 2);
  addCampo(VL_CAIXA, 2);
  addCampo(VL_APLIC_FIN_ANT, 2);
  addCampo(VL_APLIC_FIN, 2);
  addCampo(VL_CTA_REC_ANT, 2);
  addCampo(VL_CTA_REC, 2);
  addCampo(VL_CTA_PAG_ANT, 2);
  addCampo(VL_CTA_PAG, 2);
  addCampo(VL_COMPRA_MERC, 2);
  addCampo(VL_COMPRA_ATIVO, 2);
  addCampo(VL_RECEITAS, 2);
  addCampo(TOT_ATIVO, 2);
  addCampo(VL_FOLHA, 2);
  addCampo(VL_ALIQ_RED, 1,2);
  addCampo(IND_REG_APUR, 2);
  addCampo(IND_AVAL_ESTOQ, 1);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
