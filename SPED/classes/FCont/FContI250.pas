unit FContI250;

interface

uses Arquivo, Registro, Controls;

type
  TFContI250 = class(TRegistro)
  private
  public
    COD_CTA: string; //C
    COD_CCUS: string; //C
    VL_DC: Double; //N(19,2)
    IND_DC: string; //C(1)
    NUM_ARQ: string; //C
    COD_HIST_PAD: string; //C
    HIST: string; //C(65535)
    COD_PART: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContI250 }

procedure TFContI250.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CTA);
  addCampo(COD_CCUS);
  addCampo(VL_DC, 16, 2);
  addCampo(IND_DC, 1);
  addCampo(NUM_ARQ);
  addCampo(COD_HIST_PAD);
  addCampo(HIST, 65535);
  addCampo(COD_PART);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
