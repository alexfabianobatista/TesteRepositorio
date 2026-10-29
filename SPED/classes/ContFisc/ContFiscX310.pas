unit ContFiscX310;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX310 = class(TRegistro)
  private

  public
    NOME: string; //C
    PAIS: string; //C
    VL_OPER: double; //N(19,2)
    COND_PES: integer; //N(2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX310.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(NOME);
  addCampo(PAIS);
  addCampo(VL_OPER, 2);
  addCampo(COND_PES, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
