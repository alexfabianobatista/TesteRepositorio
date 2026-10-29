unit RegistroJ100;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroJ100 = Class (TRegistro)
    private
    public
      COD_AGL: String; //C
      IND_COD_AGL: String; //C
      NIVEL_AGL: Integer; //N
      COD_AGL_SUP: String;
      IND_GRP_BAL: String; //C(1)
      DESCR_COD_AGL: String; //C
      VL_CTA_FIN: Double; //N(X,2)
      IND_DC_BAL: String; //C(1)
      VL_CTA_INI: Double; //N(X,2)
      IND_DC_CTA_INI: String; //C(1)
      NOTA_EXP_REF: String; //C
      IND_DC_CTA_FIN: String; //C(1)
      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroJ100 }

procedure TRegistroJ100.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_AGL);
  addCampo(IND_COD_AGL);
  addCampo(NIVEL_AGL, 0);
  if COD_AGL_SUP <> '0' then
    addCampo(COD_AGL_SUP)
  else
    addCampo('');
  addCampo(IND_GRP_BAL, 1);
  addCampo(DESCR_COD_AGL);
  addCampo(VL_CTA_INI, 2);
  addCampo(IND_DC_CTA_INI, 1);
  addCampo(VL_CTA_FIN, 2);
  addCampo(IND_DC_CTA_FIN, 1);
  addCampo(''); //NOTA_EXP_REF
  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
