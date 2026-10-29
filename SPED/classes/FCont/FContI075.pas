unit FContI075;

interface

uses Arquivo, Registro, Controls;

type
  TFContI075 = class(TRegistro)
  private
  public
    COD_HIST: string; //C
    DESCR_HIST: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContI075 }

procedure TFContI075.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_HIST);
  addCampo(DESCR_HIST);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
