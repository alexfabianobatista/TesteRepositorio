unit ContFiscU180;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscU180 = class(TRegistro)
  private

  public
    CODIGO: string; //C
    DESCRICAO: string; //C
    VALOR: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscU180.grava;
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
