unit FContI150;

interface

uses Arquivo, Registro, Controls;

type
  TFContI150 = class(TRegistro)
  private
  public
    DT_INI: TDate; //N(8)
    DT_FIN: TDate; //N(8)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContI150 }

procedure TFContI150.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIN, 'D');

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
