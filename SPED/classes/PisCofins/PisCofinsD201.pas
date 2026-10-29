unit PisCofinsD201;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsD201 = class(TRegistro)
  private
  public
    CST_PIS: string; //C(2)
    VL_ITEM: Double; //N(X,2)
    VL_BC_PIS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(3,4)
    VL_PIS: Double; //N(X,2)
    COD_CTA: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsD201.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(CST_PIS, 2);
  addCampo(VL_ITEM, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS, 3, 4);
  addCampo(VL_PIS, 2);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
