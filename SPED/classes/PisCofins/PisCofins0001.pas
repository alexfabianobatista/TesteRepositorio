unit PisCofins0001;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins0001 = class(TRegistro)
  private
  public
    IND_MOV: Integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofins0001.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_MOV, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;


end.

