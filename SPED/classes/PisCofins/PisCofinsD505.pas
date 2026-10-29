unit PisCofinsD505;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsD505 = class(TRegistro)
  private
  public
    CST_COFINS: String; //N(2)
    VL_ITEM: Double; //N(X,2)
    NAT_BC_CRED: string; //C(20)
    VL_BC_COFINS: Double; //N(X,2)
    ALIQ_COFINS: Double; //N(3,4)
    VL_COFINS: Double; //N(X,2)
    COD_CTA: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsD505 }

procedure TPisCofinsD505.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(CST_COFINS);
  addCampo(VL_ITEM, 2);
  addCampo(NAT_BC_CRED, 20);
  addCampo(VL_BC_COFINS, 2);
  addCampo(ALIQ_COFINS, 3, 4);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
