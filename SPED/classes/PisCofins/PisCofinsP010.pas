unit PisCofinsP010;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsP010 = class(TRegistro)
  private
  public
    CNPJ: string; //C(14)
    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistroP010 }

procedure TPisCofinsP010.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(CNPJ);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;
end.
