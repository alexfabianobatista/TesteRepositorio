unit PisCofinsD601;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsD601 = class(TRegistro)
  private
  public
    COD_CLASS: Integer; //N(4)
    VL_ITEM: Double; //N(X,2)
    VL_DESC: Double; //N(X,2)
    CST_PIS: Integer; //N(2)
    VL_BC_PIS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(8,4)
    VL_PIS: Double; //N(X,2)
    COD_CTA: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsD601 }

procedure TPisCofinsD601.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CLASS, 4);
  addCampo(VL_ITEM, 2);
  addCampo(VL_DESC, 2);
  addCampo(CST_PIS, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS, 8, 4);
  addCampo(VL_PIS, 2);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
