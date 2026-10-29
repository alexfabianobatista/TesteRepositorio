unit PisCofinsC485;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC485 = class(TRegistro)
  private
  public
    CST_COFINS: Integer; //N(2)
    VL_ITEM: Double; //N(X,2)
    VL_BC_COFINS: Double; //N(X,2)
    ALIQ_COFINS: Double; //N(8,4)
    QUANT_BC_COFINS: Double; //N(X,3)
    ALIQ_COFINS_QUANT: Double; //N(X,4)
    VL_COFINS: Double; //N(X,2)
    COD_ITEM: string; //C(60)
    COD_CTA: string; //C(60)


    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC485 }

procedure TPisCofinsC485.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(CST_COFINS, 2);
  addCampo(VL_ITEM, 2);
  addCampo(VL_BC_COFINS, 2);
  addCampo(ALIQ_COFINS, 8, 4);
  addCampo(QUANT_BC_COFINS, 3);
  addCampo(ALIQ_COFINS_QUANT, 4);
  addCampo(VL_COFINS, 2);
  addCampo(COD_ITEM, 60);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
