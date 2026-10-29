unit PisCofinsM200;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsM200 = class(TRegistro)
  private
  public
    VL_TOT_CONT_NC_PER: Double; //N(X,2)
    VL_TOT_CRED_DESC: Double; //N(X,2)
    VL_TOT_CRED_DESC_ANT: Double; //N(X,2)
    VL_TOT_CONT_NC_DEV: Double; //N(X,2)
    VL_RET_NC: Double; //N(X,2)
    VL_OUT_DED_NC: Double; //N(X,2)
    VL_CONT_NC_REC: Double; //N(X,2)
    VL_TOT_CONT_CUM_PER: Double; //N(X,2)
    VL_OUT_DED_CUM: Double; //N(X,2)
    VL_CONT_CUM_REC: Double; //N(X,2)
    VL_TOT_CONT_REC: Double; //N(X,2)
    VL_RET_CUM: double; //N(X,2)


    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsM200.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(VL_TOT_CONT_NC_PER, 2);
  addCampo(VL_TOT_CRED_DESC, 2);
  addCampo(VL_TOT_CRED_DESC_ANT, 2);
  addCampo(VL_TOT_CONT_NC_DEV, 2);
  addCampo(VL_RET_NC, 2);
  addCampo(VL_OUT_DED_NC, 2);
  addCampo(VL_CONT_NC_REC, 2);
  addCampo(VL_TOT_CONT_CUM_PER, 2);
  addCampo(VL_RET_CUM, 2);
  addCampo(VL_OUT_DED_CUM, 2);
  addCampo(VL_CONT_CUM_REC, 2);
  addCampo(VL_TOT_CONT_REC, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
