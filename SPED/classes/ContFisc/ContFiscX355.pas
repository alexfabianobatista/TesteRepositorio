unit ContFiscX355;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX355 = class(TRegistro)
  private

  public
    REND_PASS_PROP: double; //N(19,2)
    REND_PASS_PROP_REAL: double; //N(19,2)
    REND_TOTAL: double; //N(19,2)
    REND_TOTAL_REAL: double; //N(19,2)
    REND_ATIV_PROP: double; //N(19,2)
    REND_ATIV_PROP_REAL: double; //N(19,2)
    PERCENTUAL: double; //N(7,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX355.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(REND_PASS_PROP, 2);
  addCampo(REND_PASS_PROP_REAL, 2);
  addCampo(REND_TOTAL, 2);
  addCampo(REND_TOTAL_REAL, 2);
  addCampo(REND_ATIV_PROP, 2);
  addCampo(REND_ATIV_PROP_REAL, 2);
  addCampo(PERCENTUAL, 4, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
