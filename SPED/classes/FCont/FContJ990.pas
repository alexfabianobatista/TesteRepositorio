unit FContJ990;

interface

uses Arquivo, Registro, Controls;

type
  TFContJ990 = class(TRegistro)
  private
  public
    QTD_LIN_J: Double; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContJ990 }

procedure TFContJ990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_J, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
