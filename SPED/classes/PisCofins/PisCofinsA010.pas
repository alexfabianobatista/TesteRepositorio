unit PisCofinsA010;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsA010 = class(TRegistro)
  private
  public
    CNPJ: String; //N(14)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsA010.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(SomenteNumeros(CNPJ), 14);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;


end.

