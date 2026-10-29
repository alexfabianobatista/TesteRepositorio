unit PisCofinsF205;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsF205 = class(TRegistro)
  private
  public
    VL_CUS_INC_ACUM_ANT: Double; //N(X,2)
    VL_CUS_INC_PER_ESC: Double; //N(X,2)
    VL_CUS_INC_ACUM: Double; //N(X,2)
    VL_EXC_BC_CUS_INC_ACUM: Double; //N(X,2)
    VL_BC_CUS_INC: Double; //N(X,2)
    CST_PIS: Integer; //N(2)
    ALIQ_PIS: Double; //N(8,4)
    VL_CRED_PIS_ACUM: Double; //N(X,2)
    VL_CRED_PIS_DESC_ANT: Double; //N(X,2)
    VL_CRED_PIS_DESC: Double; //N(X,2)
    VL_CRED_PIS_DESC_FUT: Double; //N(X,2)
    CST_COFINS: Integer; //N(2)
    ALIQ_COFINS: Double; //N(8,4)
    VL_CRED_COFINS_ACUM: Double; //N(X,2)
    VL_CRED_COFINS_DESC_ANT: Double; //N(X,2)
    VL_CRED_COFINS_DESC: Double; //N(X,2)
    VL_CRED_COFINS_DESC_FUT: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsF205.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(VL_CUS_INC_ACUM_ANT, 2);
  addCampo(VL_CUS_INC_PER_ESC, 2);
  addCampo(VL_CUS_INC_ACUM, 2);
  addCampo(VL_EXC_BC_CUS_INC_ACUM, 2);
  addCampo(VL_BC_CUS_INC, 2);
  addCampo(CST_PIS, 2);
  addCampo(ALIQ_PIS, 8, 4);
  addCampo(VL_CRED_PIS_ACUM, 2);
  addCampo(VL_CRED_PIS_DESC_ANT, 2);
  addCampo(VL_CRED_PIS_DESC, 2);
  addCampo(VL_CRED_PIS_DESC_FUT, 2);
  addCampo(CST_COFINS, 2);
  addCampo(ALIQ_COFINS, 8, 4);
  addCampo(VL_CRED_COFINS_ACUM, 2);
  addCampo(VL_CRED_COFINS_DESC_ANT, 2);
  addCampo(VL_CRED_COFINS_DESC, 2);
  addCampo(VL_CRED_COFINS_DESC_FUT, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
