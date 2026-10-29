unit RegistroI155;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI155 = Class (TRegistro)
    private
    public
      COD_CTA: String; //C
      COD_CCUS: String; //C
      VL_SLD_INI: Double; //N(X,2)
      IND_DC_INI: String; //C(1)
      VL_DEB: Double; //N(X,2)
      VL_CRED: Double; //N(X,2)
      VL_SLD_FIN: Double; //N(X,2)
      IND_DC_FIN: String; //C(1)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI155 }

procedure TRegistroI155.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CTA);
  addCampo(COD_CCUS);
  addCampo(VL_SLD_INI, 2);
  addCampo(IND_DC_INI, 1);
  addCampo(VL_DEB, 2);
  addCampo(VL_CRED, 2);
  addCampo(VL_SLD_FIN, 2);
  addCampo(IND_DC_FIN, 1);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
