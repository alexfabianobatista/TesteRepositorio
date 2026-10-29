unit RegistroE520;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE520 = Class (TRegistro)
    private
    public
      VL_SD_ANT_IPI: Double; //N(X,2)
      VL_DEB_IPI: Double; //N(X,2)
      VL_CRED_IPI: Double; //N(X,2)
      VL_OD_IPI: Double; //N(X,2)
      VL_OC_IPI: Double; //N(X,2)
      VL_SC_IPI: Double; //N(X,2)
      VL_SD_IPI: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroE520 }

procedure TRegistroE520.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(VL_SD_ANT_IPI, 2);
  addCampo(VL_DEB_IPI, 2);
  addCampo(VL_CRED_IPI, 2);
  addCampo(VL_OD_IPI, 2);
  addCampo(VL_OC_IPI, 2);
  addCampo(VL_SC_IPI, 2);
  addCampo(VL_SD_IPI, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
