unit ContFisc0010;

interface

uses Arquivo, Controls, Registro;

type
  TContFisc0010 = class(TRegistro)
  private

  public
    HASH_ECF_ANTERIOR: String; //C(40);
    OPT_REFIS: String; //C(1);
    //OPT_PAES: String; //C(1);
    FORMA_TRIB: String; //C(1);
    FORMA_APUR: String; //C(1);
    COD_QUALIF_PJ: Integer; //N(2)
    FORMA_TRIB_PER: String; //C(4)
    MES_BAL_RED: String; //C(12)
    TIP_ESC_PRE: String; //C(1)
    TIP_ENT: string; //N(2)
    FORMA_APUR_I: String; //C(1)
    APUR_CSLL: String; //C(1)
    IND_REC_RECEITA: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFisc0010.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(HASH_ECF_ANTERIOR, 40);
  addCampo(OPT_REFIS, 1);
  //addCampo(OPT_PAES, 1);
  addCampo(FORMA_TRIB, 1);
  addCampo(FORMA_APUR, 1);
  addCampo(COD_QUALIF_PJ, 2);
  addCampo(FORMA_TRIB_PER, 4);
  addCampo(MES_BAL_RED, 12);
  addCampo(TIP_ESC_PRE, 1);
  addCampo(TIP_ENT, 2);
  addCampo(FORMA_APUR_I, 1);
  addCampo(APUR_CSLL, 1);
  addCampo(IND_REC_RECEITA);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;
end;

end.
