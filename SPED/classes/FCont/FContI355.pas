unit FContI355;

interface

uses Arquivo, Registro, Controls;

type
  TFContI355 = class(TRegistro)
  private
  public
    COD_CTA: string; //C
    COD_CCUS: string;
    VL_CTA: Double; //N(16,2)
    IND_DC: string;

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContI355 }

procedure TFContI355.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CTA);
  addCampo(COD_CCUS);
  addCampo(VL_CTA, 16, 2);
  addCampo(IND_DC);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
