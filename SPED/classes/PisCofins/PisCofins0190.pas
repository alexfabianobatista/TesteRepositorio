unit PisCofins0190;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins0190 = class(TRegistro)
  private
  public
    UNID: string; //C(6)
    DESCR: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins0190 }

procedure TPisCofins0190.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(UNID, 6);
  addCampo(DESCR);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
