unit ContFiscU182;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscU182 = class(TRegistro)
  private

  public
    CODIGO: string; //C
    DESCRICAO: string; //C
    VALOR: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscU182.grava;
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
