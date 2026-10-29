unit ContFiscX353;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX353 = class(TRegistro)
  private

  public
    RES_NEG_UTIL: double; //N(19,2)
    RES_NEG_UTIL_REAL: double; //N(19,2)
    SALDO_RES_NEG_NAO_UTIL: double; //N(19,2)
    SALDO_RES_NEG_NAO_UTIL_REAL: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX353.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(RES_NEG_UTIL, 2);
  addCampo(RES_NEG_UTIL_REAL, 2);
  addCampo(SALDO_RES_NEG_NAO_UTIL, 2);
  addCampo(SALDO_RES_NEG_NAO_UTIL_REAL, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
