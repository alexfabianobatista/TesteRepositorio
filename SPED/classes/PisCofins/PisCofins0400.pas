unit PisCofins0400;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins0400 = class(TRegistro)
  private
  public
    COD_NAT: string; //C(10)
    DESCR_NAT: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins0400 }

procedure TPisCofins0400.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_NAT, 10);
  addCampo(DESCR_NAT);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

