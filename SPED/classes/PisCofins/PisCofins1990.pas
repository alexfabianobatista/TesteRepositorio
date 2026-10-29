unit PisCofins1990;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins1990 = class(TRegistro)
  private
  public
    QTD_LIN_1: Double; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins1990 }

procedure TPisCofins1990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_1, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
