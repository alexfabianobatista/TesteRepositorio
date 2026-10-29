unit ContFiscX500;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX500 = class(TRegistro)
  private

  public
    CODIGO: string; //C(4)
    DESCRICAO: string; //C
    VALOR: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX500.grava;
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
