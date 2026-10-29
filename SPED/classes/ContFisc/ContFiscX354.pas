unit ContFiscX354;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX354 = class(TRegistro)
  private

  public
    RES_NEG: double; //N(19,2)
    RES_NEG_REAL: double; //N(19,2)
    SALDO_RES_NEG: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX354.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(RES_NEG, 2);
  addCampo(RES_NEG_REAL, 2);
  addCampo(SALDO_RES_NEG, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
