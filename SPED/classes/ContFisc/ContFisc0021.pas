unit ContFisc0021;

interface

uses Arquivo, Controls, Registro;

type
  TContFisc0021 = Class(TRegistro)
  private

  public
    IND_REPES: String; //C(1)
    IND_RECAP: String; //C(1)
    IND_PADIS: String; //C(1)
    IND_REIDI: String; //C(1)
    IND_RECINE: String; //C(1)
    IND_RETID: String; //C(1)
    IND_OLEO_BUNKER: String; //(1)
    IND_REPORTO: String; //(1)
    IND_RET_II: String; //(1)
    IND_RET_PMCMV: String; //C(1)
    IND_RET_EEI: String; //C(1)
    IND_EBAS: String; //C(1)
    IND_REPETRO_INDUSTRIALIZACAO: String; //C(1)
    IND_REPETRO_NACIONAL: String; //C(1)
    IND_REPETRO_PERMANENTE: String; //C(1)
    IND_REPETRO_TEMPORARIO: String; //C(1)
    procedure grava;
  end;

implementation

uses uFuncoes;

procedure TContFisc0021.grava;
begin

  inherited;

  addCampo(bloco + registro);
  addCampo(IND_REPES, 1);
  addCampo(IND_RECAP, 1);
  addCampo(IND_PADIS, 1);
  addCampo(IND_REIDI, 1);
  addCampo(IND_RECINE, 1);
  addCampo(IND_RETID, 1);
  addCampo(IND_OLEO_BUNKER, 1);
  addCampo(IND_REPORTO, 1);
  addCampo(IND_RET_II, 1);
  addCampo(IND_RET_PMCMV, 1);
  addCampo(IND_RET_EEI, 1);
  addCampo(IND_EBAS, 1);
  addCampo(IND_REPETRO_INDUSTRIALIZACAO, 1);
  addCampo(IND_REPETRO_NACIONAL, 1);
  addCampo(IND_REPETRO_PERMANENTE, 1);
  addCampo(IND_REPETRO_TEMPORARIO, 1);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;

end;

end.
