unit PisCofinsC491;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC491 = class(TRegistro)
  private
  public
    COD_ITEM: String; //C(60)
    CST_PIS: String; //N(2)
    CFOP: Integer; //N(4)
    VL_ITEM: Double; //N(X,2)
    VL_BC_PIS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(8,4)
    QUANT_BC_PIS: Double; //N(X,3)
    ALIQ_PIS_QUANT: Double; //N(X,4)
    VL_PIS: Double; //N(X,2)
    COD_CTA: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC491 }

procedure TPisCofinsC491.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_ITEM, 60);
  addCampo(CST_PIS, 2);
  addCampo(CFOP, 4);
  addCampo(VL_ITEM, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS, 3, 4);
  if QUANT_BC_PIS > 0 then
    addCampo(QUANT_BC_PIS, 3)
  else
    addCampo(QUANT_BC_PIS, '');
  if ALIQ_PIS_QUANT > 0 then
    addCampo(ALIQ_PIS_QUANT, 4)
  else
    addCampo(ALIQ_PIS_QUANT, '');
  addCampo(VL_PIS, 2);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
