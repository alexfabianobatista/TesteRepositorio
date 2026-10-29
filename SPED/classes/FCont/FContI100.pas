unit FContI100;

interface

uses Arquivo, Registro, Controls;

type
  TFContI100 = class(TRegistro)
  private
  public
    DT_ALT: TDate; //N(8)
    COD_CCUS: string; //C
    CCUS: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContI100 }

procedure TFContI100.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_ALT, 'D');
  addCampo(COD_CCUS);
  addCampo(CCUS);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
