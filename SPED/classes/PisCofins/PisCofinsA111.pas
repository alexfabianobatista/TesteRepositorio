unit PisCofinsA111;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsA111 = class(TRegistro)
  private
  public
    NUM_PROC: string; //C(15)
    IND_PROC: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsA111.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_PROC, 15);
  addCampo(IND_PROC, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
