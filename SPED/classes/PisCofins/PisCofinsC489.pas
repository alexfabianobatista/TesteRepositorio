unit PisCofinsC489;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC489 = class(TRegistro)
  private
  public
    NUM_PROC: string; //C(20)
    IND_PROC: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC489 }

procedure TPisCofinsC489.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_PROC, 20);
  addCampo(IND_PROC, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
