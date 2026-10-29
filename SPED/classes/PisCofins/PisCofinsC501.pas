unit PisCofinsC501;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC501 = class(TRegistro)
  private
  public
    CST_PIS: String; //N(2)
    VL_ITEM: Double; //N(X,2)
    NAT_BC_CRED: string; //C(2)
    VL_BC_PIS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(3,4)
    VL_PIS: Double; //N(X,2)
    COD_CTA: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC501 }

procedure TPisCofinsC501.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(CST_PIS, 2);
  addCampo(VL_ITEM, 2);
  addCampo(NAT_BC_CRED, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS, 3, 4);
  addCampo(VL_PIS, 2);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
