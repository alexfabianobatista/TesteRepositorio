unit PisCofins9990;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins9990 = class(TRegistro)
  private
  public
    QTD_LIN_9: Double; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins9990 }

procedure TPisCofins9990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_9, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
