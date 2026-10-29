unit FContI051;

interface

uses Arquivo, Registro, Controls;

type
  TFContI051 = class(TRegistro)
  private
  public
    COD_ENT_REF: string; //C(2)
    COD_CCUS: string; //C
    COD_CTA_REF: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContI051 }

procedure TFContI051.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_ENT_REF);
  addCampo(COD_CCUS);
  addCampo(COD_CTA_REF);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
