unit PisCofinsF800;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsF800 = class(TRegistro)
  private
  public
    IND_NAT_EVEN: Integer; //N(2)
    DT_EVEN: TDate; //N(8)
    CNPJ_SUCED: string; //N(14)
    PA_CONT_CRED: Integer; //N(6)
    COD_CRED: Integer; //N(3)
    VL_CRED_PIS: Double; //N(X,2)
    VL_CRED_COFINS: Double; //N(X,2)
    PER_CRED_CIS: Double; //N(6,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsF800.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_NAT_EVEN, 2);
  addCampo(DT_EVEN, 'D');
  addCampo(SomenteNumeros(CNPJ_SUCED), 14);
  addCampo(PA_CONT_CRED, 6);
  addCampo(COD_CRED, 3);
  addCampo(VL_CRED_PIS, 2);
  addCampo(VL_CRED_COFINS, 2);
  addCampo(PER_CRED_CIS, 6, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
