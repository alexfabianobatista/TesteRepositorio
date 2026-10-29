unit PisCofinsD105;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TPisCofinsD105 = class(TRegistro)
  private
  public
    IND_NAT_FRT: string; //C(1)
    VL_ITEM: Double; //N(X,2)
    CST_COFINS: String; //N(2)
    NAT_BC_CRED: string; //C(2)
    VL_BC_COFINS: Double; //N(X,2)
    ALIQ_COFINS: Double; //N(3,4)
    VL_COFINS: Double; //N(X,2)
    COD_CTA: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsD105 }

procedure TPisCofinsD105.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_NAT_FRT, 1);
  addCampo(VL_ITEM, 2);
  addCampo(CST_COFINS, 2);
  addCampo(StrToInt(NAT_BC_CRED), 2);
  addCampo(VL_BC_COFINS, 2);
  addCampo(ALIQ_COFINS, 3, 4);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
