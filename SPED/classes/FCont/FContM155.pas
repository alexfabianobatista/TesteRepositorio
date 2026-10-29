unit FContM155;

interface

uses Arquivo, Registro, Controls;

type
  TFContM155 = class(TRegistro)
  private
  public
    COD_CTA: string; //C
    COD_CCUS: string; //C
    COD_CTA_REF: string; //C
    VL_SLD_INI_SOC_ANT: Double; //(19,2)
    IND_DC_INI_SOC_ANT: string; //C(1)
    VL_IS_DEB: Double; //(19,2)
    VL_IS_CRED: Double; //(19,2)
    VL_SLD_INI_SOC: Double; //(19,2)
    IND_DC_INI_SOC: string; //C(1)
    VL_SLD_INI_FC_ANT: Double; //(19,2)
    IND_DC_INI_FC_ANT: string; //C(1)
    VL_IF_DEB: Double; //(19,2)
    VL_IF_CRED: Double; //(19,2)
    VL_SLD_INI_FC: Double; //(19,2)
    IND_DC_INI_FC: string; //C(1)
    VL_DEB_CONTABIL: Double; //(19,2)
    VL_CRED_CONTABIL: Double; //(19,2)
    VL_DEB_FCONT_E: Double; //(19,2)
    VL_CRED_FCONT_: Double; //(19,2)
    VL_DEB_FCONT_I: Double; //(19,2)
    VL_CRED_FCONT_I: Double; //(19,2)
    VL_TR_DEB: Double; //(19,2)
    VL_TR_CRED: Double; //(19,2)
    VL_TF_DEB: Double; //(19,2)
    VL_TF_CRED: Double; //(19,2)
    VL_TS_DEB: Double; //(19,2)
    VL_TS_CRED: Double; //(19,2)
    VL_EF_DEB: Double; //(19,2)
    VL_EF_CRED: Double; //(19,2)
    VL_SLD_FIN_FC: Double; //(19,2)
    IND_DC_FIN_FC: string; //C(1)
    VL_SLD_FIN_SOC: Double; //(19,2)
    IND_DC_FIN_SOC: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContM155 }

procedure TFContM155.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CTA);
  addCampo(COD_CCUS);
  addCampo(COD_CTA_REF);
  addCampo(VL_SLD_INI_SOC_ANT, 19, 2);
  addCampo(IND_DC_INI_SOC_ANT, 1);
  addCampo(VL_IS_DEB, 19, 2);
  addCampo(VL_IS_CRED, 19, 2);
  addCampo(VL_SLD_INI_SOC, 19, 2);
  addCampo(IND_DC_INI_SOC, 1);
  addCampo(VL_SLD_INI_FC_ANT, 19, 2);
  addCampo(IND_DC_INI_FC_ANT, 1);
  addCampo(VL_IF_DEB, 19, 2);
  addCampo(VL_IF_CRED, 19, 2);
  addCampo(VL_SLD_INI_FC, 19, 2);
  addCampo(IND_DC_INI_FC, 1);
  addCampo(VL_DEB_CONTABIL, 19, 2);
  addCampo(VL_CRED_CONTABIL, 19, 2);
  addCampo(VL_DEB_FCONT_E, 19, 2);
  addCampo(VL_CRED_FCONT_, 19, 2);
  addCampo(VL_DEB_FCONT_I, 19, 2);
  addCampo(VL_CRED_FCONT_I, 19, 2);
  addCampo(VL_TR_DEB, 19, 2);
  addCampo(VL_TR_CRED, 19, 2);
  addCampo(VL_TF_DEB, 19, 2);
  addCampo(VL_TF_CRED, 19, 2);
  addCampo(VL_TS_DEB, 19, 2);
  addCampo(VL_TS_CRED, 19, 2);
  addCampo(VL_EF_DEB, 19, 2);
  addCampo(VL_EF_CRED, 19, 2);
  addCampo(VL_SLD_FIN_FC, 19, 2);
  addCampo(IND_DC_FIN_FC, 1);
  addCampo(VL_SLD_FIN_SOC, 19, 2);
  addCampo(IND_DC_FIN_SOC, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

