unit ContFiscY660;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY660 = class(TRegistro)
  private

  public
    CNPJ: string; //C(14)
    NOME_EMP: string; //C
    PERC_PAT_LIQ: double; //N(5,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY660.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CNPJ);
  addCampo(NOME_EMP);
  addCampo(PERC_PAT_LIQ, 2, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
