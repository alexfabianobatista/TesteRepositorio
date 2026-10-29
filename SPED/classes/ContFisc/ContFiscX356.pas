unit ContFiscX356;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX356 = class(TRegistro)
  private

  public
    PERC_PART: double; //N(4,2)
    ATIVO_TOTAL: double; //N(19,2)
    PAT_LIQUIDO: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX356.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(PERC_PART, 1, 2);
  addCampo(ATIVO_TOTAL, 2);
  addCampo(PAT_LIQUIDO, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;                   
end.
