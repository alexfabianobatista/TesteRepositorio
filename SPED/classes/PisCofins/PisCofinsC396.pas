unit PisCofinsC396;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC396 = class(TRegistro)
  private
  public
    COD_ITEM: string; //C(60)
    VL_ITEM: Double; //N(X,2)
    VL_DESC: Double; //N(X,2)
    NAT_BC_CRED: string; //C(2)
    CST_PIS: Integer; //N(2)
    VL_BC_PIS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(8,4)
    VL_PIS: Double; //N(X,2)
    CST_COFINS: Integer; //N(2)
    VL_BC_COFINS: Double; //N(X,2)
    ALIQ_COFINS: Double; //N(8,4)
    VL_COFINS: Double; //N(X,2)
    COD_CTA: string; //C(60)


    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC396 }

procedure TPisCofinsC396.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_ITEM, 60);
  addCampo(VL_ITEM, 2);
  addCampo(VL_DESC, 2);
  addCampo(NAT_BC_CRED, 2);
  addCampo(CST_PIS, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS, 8, 4);
  addCampo(VL_PIS, 2);
  addCampo(CST_COFINS, 2);
  addCampo(VL_BC_COFINS, 2);
  addCampo(ALIQ_COFINS, 8, 4);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
