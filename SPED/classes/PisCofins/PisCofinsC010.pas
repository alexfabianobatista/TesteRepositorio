unit PisCofinsC010;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC010 = class(TRegistro)
  private
  public
    CNPJ: string; //N(14)
    IND_ESCRI: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC010 }

procedure TPisCofinsC010.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(IND_ESCRI, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
