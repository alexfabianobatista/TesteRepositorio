unit PisCofinsC495;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC495 = class(TRegistro)
  private
  public
    COD_ITEM: string; //C(60)
    CST_COFINS: string; //N(2)
    CFOP: Integer; //N(4)
    VL_ITEM: Double; //N(X,2)
    VL_BC_COFINS: Double; //N(X,2)
    ALIQ_COFINS: Double; //N(8,4)
    QUANT_BC_COFINS: Double; //N(X,3)
    ALIQ_COFINS_QUANT: Double; //N(X,4)
    VL_COFINS: Double; //N(X,2)
    COD_CTA: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC495 }

procedure TPisCofinsC495.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_ITEM, 60);
  addCampo(CST_COFINS, 2);
  addCampo(CFOP, 4);
  addCampo(VL_ITEM, 2);
  addCampo(VL_BC_COFINS, 2);
  addCampo(ALIQ_COFINS, 3, 4);
  if QUANT_BC_COFINS > 0 then
    addCampo(QUANT_BC_COFINS, 3)
  else
    addCampo(QUANT_BC_COFINS, '');
  if ALIQ_COFINS_QUANT > 0 then
    addCampo(ALIQ_COFINS_QUANT, 4)
  else
    addCampo(ALIQ_COFINS_QUANT, '');
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
