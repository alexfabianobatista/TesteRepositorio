unit PisCofinsD605;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsD605 = class(TRegistro)
  private
  public
    COD_CLASS: Integer; //N(4)
    VL_ITEM: Double; //N(X,2)
    VL_DESC: Double; //N(X,2)
    CST_COFINS: Integer; //N(2)
    VL_BC_COFINS: Double; //N(X,2)
    ALIQ_COFINS: Double; //N(8,4)
    VL_COFINS: Double; //N(X,2)
    COD_CTA: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsD605 }

procedure TPisCofinsD605.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CLASS, 4);
  addCampo(VL_ITEM, 2);
  addCampo(VL_DESC, 2);
  addCampo(CST_COFINS, 2);
  addCampo(VL_BC_COFINS, 2);
  addCampo(ALIQ_COFINS, 8, 4);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
