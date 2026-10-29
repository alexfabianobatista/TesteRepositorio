unit PisCofinsF150;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsF150 = class(TRegistro)
  private
  public
    NAT_BC_CRED: string; //C(2)
    VL_TOT_EST: Double; //N(X,2)
    EXT_IMP: Double; //N(X,2)
    VL_BC_EST: Double; //N(X,2)
    VL_BC_MEN_EST: Double; //N(X,2)
    CST_PIS: Integer; //N(2)
    ALIQ_PIS: Double; //N(8,4)
    VL_CRED_PIS: Double; //N(X,2)
    CST_COFINS: Integer; //N(2)
    ALIQ_COFINS: Double; //N(8,4)
    VL_CRED_COFINS: Double; //N(X,2)
    DESC_EST: string; //C(100)
    COD_CTA: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsF150.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NAT_BC_CRED, 2);
  addCampo(VL_TOT_EST, 2);
  addCampo(EXT_IMP, 2);
  addCampo(VL_BC_EST, 2);
  addCampo(VL_BC_MEN_EST, 2);
  addCampo(CST_PIS, 2);
  addCampo(ALIQ_PIS, 8, 4);
  addCampo(VL_CRED_PIS, 2);
  addCampo(CST_COFINS, 2);
  addCampo(ALIQ_COFINS, 8, 4);
  addCampo(VL_CRED_PIS, 2);
  addCampo(DESC_EST, 100);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
