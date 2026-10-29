unit ContFiscX351;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX351 = class(TRegistro)
  private

  public
    RES_INV_PER: double; //N(19,2)
    RES_INV_PER_REAL: double; //N(19,2)
    RES_ISEN_PETR_PER: double; //N(19,2)
    RES_ISEN_PETR_PER_REAL: double; //N(19,2)
    RES_NEG_ACUM: double; //N(19,2)
    RES_POS_TRIB: double; //N(19,2)
    RES_POS_TRIB_REAL: double; //N(19,2)
    IMP_LUCR: double; //N(19,2)
    IMP_LUCR_REAL: double; //N(19,2)
    IMP_PAG_RED: double; //N(19,2)
    IMP_PAG_REND_REAL: double; //N(19,2)
    IMP_RET_EXT: double; //N(19,2)
    IMP_RET_EXT_REAL: double; //N(19,2)
    IMB_RET_BR: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX351.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(RES_INV_PER, 2);
  addCampo(RES_INV_PER_REAL, 2);
  addCampo(RES_ISEN_PETR_PER, 2);
  addCampo(RES_ISEN_PETR_PER_REAL, 2);
  addCampo(RES_NEG_ACUM, 2);
  addCampo(RES_POS_TRIB, 2);
  addCampo(RES_POS_TRIB_REAL, 2);
  addCampo(IMP_LUCR, 2);
  addCampo(IMP_LUCR_REAL, 2);
  addCampo(IMP_PAG_RED, 2);
  addCampo(IMP_PAG_REND_REAL, 2);
  addCampo(IMP_RET_EXT, 2);
  addCampo(IMP_RET_EXT_REAL, 2);
  addCampo(IMB_RET_BR, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
