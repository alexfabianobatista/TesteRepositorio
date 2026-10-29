unit RegistroE110;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE110 = Class (TRegistro)
    private
    public
      VL_TOT_DEBITOS: Double; //N(2)
      VL_AJ_DEBITOS: Double; //N(2)
      VL_TOT_AJ_DEBITOS: Double; //N(2)
      VL_ESTORNOS_CRED: Double; //N(2)
      VL_TOT_CREDITOS: Double; //N(2)
      VL_AJ_CREDITOS: Double; //N(2)
      VL_TOT_AJ_CREDITOS: Double; //N(2)
      VL_ESTORNOS_DEB: Double; //N(2)
      VL_SLD_CREDOR_ANT: Double; //N(2)
      VL_SLD_APURADO: Double; //N(2)
      VL_TOT_DED: Double; //N(2)
      VL_ICMS_RECOLHER: Double; //N(2)
      VL_SLD_CREDOR_TRANSPORTAR: Double; //N(2)
      DEB_ESP: Double; //N(2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroE110 }

procedure TRegistroE110.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(VL_TOT_DEBITOS, 2);
  addCampo(VL_AJ_DEBITOS, 2);
  addCampo(VL_TOT_AJ_DEBITOS, 2);
  addCampo(VL_ESTORNOS_CRED, 2);
  addCampo(VL_TOT_CREDITOS, 2);
  addCampo(VL_AJ_CREDITOS, 2);
  addCampo(VL_TOT_AJ_CREDITOS, 2);
  addCampo(VL_ESTORNOS_DEB, 2);
  addCampo(VL_SLD_CREDOR_ANT, 2);
  addCampo(VL_SLD_APURADO, 2);
  addCampo(VL_TOT_DED, 2);
  addCampo(VL_ICMS_RECOLHER, 2);
  addCampo(VL_SLD_CREDOR_TRANSPORTAR, 2);
  addCampo(DEB_ESP, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
