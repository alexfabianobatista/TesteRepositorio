unit PisCofins0600;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins0600 = class(TRegistro)
  private
  public
    DT_ALT: TDate; //N(8)
    COD_CCUS: string; //C(60)
    CCUS: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins0600 }

procedure TPisCofins0600.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_ALT, 'D');
  addCampo(COD_CCUS, 60);
  addCampo(CCUS, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
