unit PisCofinsF210;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsF210 = class(TRegistro)
  private
  public
    VL_CUS_ORC: Double; //N(X,2)
    VL_EXC: Double; //N(X,2)
    VL_CUS_ORC_AJU: Double; //N(X,2)
    VL_BC_CRED: Double; //N(X,2)
    CST_PIS: Integer; //N(2)
    ALIQ_PIS: Double; //N(8,4)
    VL_CRED_PIS_UTIL: Double; //N(X,2)
    CST_COFINS: Integer; //N(2)
    ALIQ_COFINS: Double; //N(8,4)
    VL_CRED_COFINS_UTIL: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsF210.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(VL_CUS_ORC, 2);
  addCampo(VL_EXC, 2);
  addCampo(VL_CUS_ORC_AJU, 2);
  addCampo(VL_BC_CRED, 2);
  addCampo(CST_PIS, 2);
  addCampo(ALIQ_PIS, 8, 4);
  addCampo(VL_CRED_PIS_UTIL, 2);
  addCampo(CST_COFINS, 2);
  addCampo(ALIQ_COFINS, 8, 4);
  addCampo(VL_CRED_COFINS_UTIL, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
