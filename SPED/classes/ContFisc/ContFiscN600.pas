unit ContFiscN600;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscN600 = class(TRegistro)
  private

  public
    CODIGO: string; //C
    DESCRICAO: string; //C
    VALOR: double; //N(18,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscN600.grava;
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
