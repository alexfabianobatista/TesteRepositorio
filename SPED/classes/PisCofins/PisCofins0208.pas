unit PisCofins0208;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins0208 = class(TRegistro)
  private
  public
    COD_TAB: string; //C(2)
    COD_GRU: string; //C(2)
    MARCA_COM: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins0208 }

procedure TPisCofins0208.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_TAB, 2);
  addCampo(COD_GRU, 2);
  addCampo(MARCA_COM, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
