unit PisCofins0450;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins0450 = class(TRegistro)
  private
  public
    COD_INF: string; //C(6)
    TXT: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins0450 }

procedure TPisCofins0450.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_INF, 6);
  addCampo(TXT);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
