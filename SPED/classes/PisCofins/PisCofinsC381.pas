unit PisCofinsC381;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC381 = class(TRegistro)
  private
  public
    CST_PIS: String; //N(2)
    COD_ITEM: string; //C(60)
    VL_ITEM: Double; //N(X,2)
    VL_BC_PIS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(3,4)
    QUANT_BC_PIS: Double; //N(X,3)
    ALIQ_PIS_QUANT: Double; //N(X,4)
    VL_PIS: Double; //N(X,2)
    COD_CTA: string; //C(60)


    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC381 }

procedure TPisCofinsC381.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(CST_PIS, 2);
  addCampo(COD_ITEM, 60);
  addCampo(VL_ITEM, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS, 3, 4);
  addCampo(QUANT_BC_PIS, 3);
  addCampo(ALIQ_PIS_QUANT, 4);
  addCampo(VL_PIS, 2);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
