unit PisCofins0990;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins0990 = class(TRegistro)
  private
  public
    QTD_LIN_0: Double; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins0990 }

procedure TPisCofins0990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_0, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
