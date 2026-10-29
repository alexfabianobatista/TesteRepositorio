unit FContM355;

interface

uses Arquivo, Registro, Controls;

type
  TFContM355 = class(TRegistro)
  private
  public
    COD_CTA: string; //C
    COD_CCUS: string; //C
    COD_CTA_REF: string; //C
    VL_SLD_FIN_SOC: Double; //(19,2)
    IND_DC_FIN_SOC: string; //C(1)
    VL_DEB_FCONT_E: Double; //(19,2)
    VL_CRED_FCONT_E: Double; //(19,2)
    VL_DEB_FCONT_I: Double; //(19,2)
    VL_CRED_FCONT_I: Double; //(19,2)
    VL_SLD_FIN_FC_AL: Double; //(19,2)
    IND_DC_FIN_FC_AL: string; //C(1)
    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContM355 }

procedure TFContM355.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CTA);
  addCampo(COD_CCUS);
  addCampo(COD_CTA_REF);
  addCampo(VL_SLD_FIN_SOC, 19, 2);
  addCampo(IND_DC_FIN_SOC, 1);
  addCampo(VL_DEB_FCONT_E, 19, 2);
  addCampo(VL_CRED_FCONT_E, 19, 2);
  addCampo(VL_DEB_FCONT_I, 19, 2);
  addCampo(VL_CRED_FCONT_I, 19, 2);
  addCampo(VL_SLD_FIN_FC_AL, 19, 2);
  addCampo(IND_DC_FIN_FC_AL, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
