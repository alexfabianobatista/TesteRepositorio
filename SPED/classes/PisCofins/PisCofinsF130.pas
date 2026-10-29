unit PisCofinsF130;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsF130 = class(TRegistro)
  private
  public
    NAT_BC_CRED: string; //C(2)
    IDENT_BEM_IMOB: Integer; //N(2)
    IND_ORIG_CRED: string; //C(1)
    IND_UTIL_BEM_IMOB: Integer; //N(1)
    MES_OPER_AQUIS: Integer; //N(6)
    VL_OPER_AQUIS: Double; //N(X,2)
    PARC_OPER_NAO_BC_CRED: Double; //N(X,2)
    VL_BC_CRED: Double; //N(X,2)
    IND_NR_PARC: Integer; //N(1)
    CST_PIS: string; //C(2)
    VL_BC_PIS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(8,4)
    VL_PIS: Double; //N(X,2)
    CST_COFINS: string; //N(2)
    VL_BC_COFINS: Double; //N(X,2)
    ALIQ_COFINS: Double; //N(8,4)
    VL_COFINS: Double; //N(X,2)
    COD_CTA: string; //C(60)
    COD_CCUS: string; //C(60)
    DESC_BEM_IMOB: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsF130.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NAT_BC_CRED, 2);
  addCampo(IDENT_BEM_IMOB, 2);
  addCampo(IND_ORIG_CRED, 1);
  addCampo(IND_UTIL_BEM_IMOB, 1);
  addCampo(MES_OPER_AQUIS, 6);
  addCampo(VL_OPER_AQUIS, 2);
  addCampo(PARC_OPER_NAO_BC_CRED, 2);
  addCampo(VL_BC_CRED, 2);
  addCampo(IND_NR_PARC, 1);
  addCampo(CST_PIS, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS, 4);
  addCampo(VL_PIS, 2);
  addCampo(CST_COFINS, 2);
  addCampo(VL_BC_COFINS, 2);
  addCampo(ALIQ_COFINS, 4);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA, 60);
  addCampo(COD_CCUS, 60);
  addCampo(DESC_BEM_IMOB);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
