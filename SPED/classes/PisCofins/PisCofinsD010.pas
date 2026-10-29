unit PisCofinsD010;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsD010 = class(TRegistro)
  private
  public
    CNPJ: string; //N(14)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsD010 }

procedure TPisCofinsD010.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(SomenteNumeros(CNPJ), 14);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
