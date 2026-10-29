unit RegistroE210;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE210 = Class (TRegistro)
    private
    public
      IND_MOV_ST: String; //C(1)
      VL_SLD_CRED_ANT_ST: Double; //N(2)
      VL_DEVOL_ST: Double; //N(2)
      VL_RESSARC_ST: Double; //N(2)
      VL_OUT_CRED_ST: Double; //N(2)
      VL_AJ_CREDITOS_ST: Double; //N(2)
      VL_RETENCAO_ST: Double; //N(2)
      VL_OUT_DEB_ST: Double; //N(2)
      VL_AJ_DEBITOS_ST: Double; //N(2)
      VL_SLD_DEV_ANT_ST: Double; //N(2)
      VL_DEDUCOES_ST: Double; //N(2)
      VL_ICMS_RECOL_ST: Double; //N(2)
      VL_SLD_CRED_ST_TRANSPORTAR: Double; //N(2)
      DEB_ESP_ST: Double; //N(2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroE210 }

procedure TRegistroE210.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_MOV_ST, 1);
  addCampo(VL_SLD_CRED_ANT_ST, 2);
  addCampo(VL_DEVOL_ST, 2);
  addCampo(VL_RESSARC_ST, 2);
  addCampo(VL_OUT_CRED_ST, 2);
  addCampo(VL_AJ_CREDITOS_ST, 2);
  addCampo(VL_RETENCAO_ST, 2);
  addCampo(VL_OUT_DEB_ST, 2);
  addCampo(VL_AJ_DEBITOS_ST, 2);
  addCampo(VL_SLD_DEV_ANT_ST, 2);
  addCampo(VL_DEDUCOES_ST, 2);
  addCampo(VL_ICMS_RECOL_ST, 2);
  addCampo(VL_SLD_CRED_ST_TRANSPORTAR, 2);
  addCampo(DEB_ESP_ST, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
