unit RegistroJ150;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroJ150 = Class (TRegistro)
    private
    public
      NU_ORDEM: String; //C(19)
      COD_AGL: String; //C
      IND_COD_AGL: String; //C
      NIVEL_AGL: Integer; //N
      COD_AGL_SUP: String; //C
      DESCR_COD_AGL: String; //C
      VAL_CTA_INI: Double; //N(X,2)
      IND_DC_CTA_INI: String; //C
      VL_CTA_FIN: Double; //N(X,2)
      IND_DC_CTA_FIN: String; //C
      //VL_CTA: Double; //N(X,2)
      //IND_DC_CTA: String; //C
      IND_GRP_DRE: String;
      //IND_VL: String; //C(1)
      //VL_CTA_ULT_DRE: double; //N(X,2)
      //IND_VL_ULT_DRE: string;//C(1)
      NOTA_EXP_REF: string; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroJ150 }

procedure TRegistroJ150.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NU_ORDEM);
  addCampo(COD_AGL);
  addCampo(IND_COD_AGL);
  addCampo(NIVEL_AGL, 0);
  addCampo(COD_AGL_SUP);
  addCampo(DESCR_COD_AGL);
  addCampo(VAL_CTA_INI, 2);
  addCampo(IND_DC_CTA_INI);
  addCampo(VL_CTA_FIN, 2);
  addCampo(IND_DC_CTA_FIN);
  //addCampo(VL_CTA_FIN, 2);
  //addCampo(VL_CTA, 2);
  //addCampo(IND_DC_CTA);
  addCampo(IND_GRP_DRE);
  //addCampo(IND_VL, 1);
  //addCampo(VL_CTA_ULT_DRE, 2);
  //addCampo(IND_VL_ULT_DRE, 1);
  addCampo(NOTA_EXP_REF); //NOTA_EXP_REF
  
  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
