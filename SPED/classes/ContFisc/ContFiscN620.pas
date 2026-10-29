unit ContFiscN620;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscN620 = class(TRegistro)
  private

  public
    CODIGO: string; //C
    DESCRICAO: string; //C
    VALOR: double; //N(19, 2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscN620.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CODIGO);
  addCampo(DESCRICAO);
  addCampo(VALOR, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;

end.
