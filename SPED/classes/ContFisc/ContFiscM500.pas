unit ContFiscM500;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscM500 = class(TRegistro)
  private

  public
    COD_CTA_B: string; //C
    COD_TRIBUTO: string; //C(1)
    SD_INI_LAL: double; //N(19,2)
    IND_SD_INI_LAL: string; //C(1)
    VL_LCTO_PARTE_A: double; //N(19,2)
    IND_VL_LCTO_PARTE_A: string; //C(1)
    VL_LCTO_PARTE_B: double; //N(19,2)
    IND_VL_LCTO_PARTE_B: string; //C(1)
    SD_FIN_LAL: double; //N(19,2)
    IND_SD_FIN_LAL: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscM500.grava;
begin
  inherited;
  addCampo(bloco + registro);

  addCampo(COD_CTA_B);
  addCampo(COD_TRIBUTO);
  addCampo(SD_INI_LAL, 2);
  addCampo(IND_SD_INI_LAL);
  addCampo(VL_LCTO_PARTE_A, 2);
  addCampo(IND_VL_LCTO_PARTE_A);
  addCampo(VL_LCTO_PARTE_B, 2);
  addCampo(IND_VL_LCTO_PARTE_B);
  addCampo(SD_FIN_LAL, 2);
  addCampo(IND_SD_FIN_LAL);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
