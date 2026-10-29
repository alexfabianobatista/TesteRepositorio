unit PisCofinsD101;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TPisCofinsD101 = class(TRegistro)
  private
  public
    IND_NAT_FRT: string; //C(1)
    VL_ITEM: Double; //N(X,2)
    CST_PIS: String; //N(2)
    NAT_BC_CRED: string; //C(2)
    VL_BC_PIS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(3,4)
    VL_PIS: Double; //N(X,2)
    COD_CTA: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes, UBiblioteca;

{ TPisCofinsD101 }

procedure TPisCofinsD101.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_NAT_FRT, 1);
  addCampo(VL_ITEM, 2);
  addCampo(CST_PIS, 2);
  addCampo(StrToInt(NAT_BC_CRED), 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS, 3, 4);
  addCampo(VL_PIS, 2);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
