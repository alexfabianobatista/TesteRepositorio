unit FContI256;

interface

uses Arquivo, Registro, Controls;

type
  TFContI256 = class(TRegistro)
  private
  public
    COD_CTA_REF: string; //C
    VL_DC: Double; //N(19,2)
    IND_DC: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContI256 }

procedure TFContI256.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CTA_REF);
  addCampo(VL_DC, 19, 2);
  addCampo(IND_DC, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
