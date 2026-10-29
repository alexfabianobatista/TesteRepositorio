unit ContFisc0020;

interface

uses Arquivo, Controls, Registro;

type
  TContFisc0020 = Class(TRegistro)
  private

  public
    IND_ALIQ_CSLL: String; //C(1)
    IND_QTE_SCP: Integer; //N(3)
    IND_ADM_FUN_CLU: String; //C(1)
    IND_PART_CONS: String; //C(1)
    IND_OP_EXT: String; //C(1)
    IND_OP_VINC: String; //C(1)
    IND_PJ_ENQUAD: String; //C(1)
    IND_PART_EXT: String; //(1)
    IND_ATIV_RURAL: String; //(1)
    IND_LUC_EXP: String; //C(1)
    IND_RED_ISEN: String; //C(1)
    IND_FIN: String; //C(1)
    //IND_DOA_ELEIT: String; //C(1)
    IND_PART_COLIG: String; //C(1)
    //IND_VEND_EXP: String; //C(1)
    IND_REC_EXT: String; //C(1)
    IND_ATIV_EXT: String; //C(1)
    //IND_COM_EXP: String; //C(1)
    IND_PGTO_EXT: String; //C(1)
    IND_ECOM_TI: String; //C(1)
    IND_ROY_REC: String; //C(1)
    IND_ROY_PAG: String; //C(1)
    IND_REND_SERV: String; //C(1)
    IND_PGTO_REM: String; //C(1)
    IND_INOV_TEC: String; //C(1)
    IND_CAP_INF: String; //C(1)
    IND_PJ_HAB: String; //C(1)
    IND_POLO_AM: String; //C(1)
    IND_ZON_EXP: String; //C(1)
    IND_AREA_COM: String; //C(1)
    IND_PAIS_A_PAIS: String; //C(1)
    IND_DEREX: String; //C(1)
    //IND_PR_TRANSF: String; //C(1)
    POSSUI_CEBRAS: String; //C(1)
    CEBAS: String; //C(255)
    procedure grava;
  end;

implementation

uses uFuncoes;

procedure TContFisc0020.grava;
begin

  inherited;

  addCampo(bloco + registro);
  addCampo(IND_ALIQ_CSLL, 1);
  addCampo(IND_QTE_SCP, 3);
  addCampo(IND_ADM_FUN_CLU, 1);
  addCampo(IND_PART_CONS, 1);
  addCampo(IND_OP_EXT, 1);
  addCampo(IND_OP_VINC, 1);
  addCampo(IND_PJ_ENQUAD, 1);
  addCampo(IND_PART_EXT, 1);
  addCampo(IND_ATIV_RURAL, 1);
  addCampo(IND_LUC_EXP, 1);
  addCampo(IND_RED_ISEN, 1);
  addCampo(IND_FIN, 1);
  //addCampo(IND_DOA_ELEIT, 1);
  addCampo(IND_PART_COLIG, 1);
  //addCampo(IND_VEND_EXP, 1);
  addCampo(IND_REC_EXT, 1);
  addCampo(IND_ATIV_EXT, 1);
  //addCampo(IND_COM_EXP, 1);
  addCampo(IND_PGTO_EXT, 1);
  addCampo(IND_ECOM_TI, 1);
  addCampo(IND_ROY_REC, 1);
  addCampo(IND_ROY_PAG, 1);
  addCampo(IND_REND_SERV, 1);
  addCampo(IND_PGTO_REM, 1);
  addCampo(IND_INOV_TEC, 1);
  addCampo(IND_CAP_INF, 1);
  addCampo(IND_PJ_HAB, 1);
  addCampo(IND_POLO_AM, 1);
  addCampo(IND_ZON_EXP, 1);
  addCampo(IND_AREA_COM, 1);
  addCampo(IND_PAIS_A_PAIS, 1);
  addCampo(IND_DEREX, 1);
// addCampo(IND_PR_TRANSF, 1);
  addCampo(POSSUI_CEBRAS,1);
  addCampo(CEBAS,255);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;

end;

end.
