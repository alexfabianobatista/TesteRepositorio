unit PisCofins9999;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins9999 = class(TRegistro)
  private
  public
    QTD_LIN: Double; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins9999 }

procedure TPisCofins9999.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
