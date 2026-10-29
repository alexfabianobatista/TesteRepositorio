unit PisCofinsM001;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsM001 = class(TRegistro)
  private
  public
    IND_MOV: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsM001.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_MOV, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
