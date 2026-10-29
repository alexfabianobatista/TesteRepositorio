unit FContI356;

interface

uses Arquivo, Registro, Controls;

type
  TFContI356 = class(TRegistro)
  private
  public
    COD_CTA_REF: string; //C
    VL_CTA: Double; //N(16,2)
    IND_DC: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContI356 }

procedure TFContI356.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CTA_REF);
  addCampo(VL_CTA, 16, 2);
  addCampo(IND_DC, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
