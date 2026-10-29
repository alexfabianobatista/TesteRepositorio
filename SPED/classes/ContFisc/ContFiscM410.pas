unit ContFiscM410;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscM410 = class(TRegistro)
  private

  public
    COD_CTA_B: string; //C
    COD_TRIBUTO: string; //C(1)
    VAL_LAN_LALB_PB: double; //N(19,2)
    IND_VAL_LAN_LALB_PB: string; //C
    COD_CTA_B_CTP: string; //C
    HIST_LAN_LALB: string; //C
    IND_LAN_ANT: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscM410.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(COD_CTA_B);
  addCampo(COD_TRIBUTO);
  addCampo(VAL_LAN_LALB_PB, 2);
  addCampo(IND_VAL_LAN_LALB_PB);
  addCampo(COD_CTA_B_CTP);
  addCampo(HIST_LAN_LALB);
  addCampo(IND_LAN_ANT);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
