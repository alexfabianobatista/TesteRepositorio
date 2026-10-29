unit PisCofinsF700;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsF700 = class(TRegistro)
  private
  public
    IND_ORI_DED: Integer; //N(2)
    IND_NAT_DED: Integer; //N(1)
    VL_DED_PIS: Double; //N(X,2)
    VL_DED_COFINS: Double; //N(X,2)
    VL_BC_OPER: Double; //N(X,2)
    CNPJ: string; //N(14)
    INF_COMP: string; //C(90)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsF700.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_ORI_DED, 2);
  addCampo(IND_NAT_DED, 1);
  addCampo(VL_DED_PIS, 2);
  addCampo(VL_DED_COFINS, 2);
  addCampo(VL_BC_OPER, 2);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(INF_COMP, 90);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
