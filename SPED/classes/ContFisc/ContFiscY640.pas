unit ContFiscY640;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY640 = class(TRegistro)
  private

  public
    CNPJ: string; //C(14)
    COND_DECL: integer; //N(1)
    VL_CONS: double; //N(18,2)
    CNPJ_LID: string; //C(14)
    VL_DECL: double; //N(18,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY640.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CNPJ);
  addCampo(COND_DECL, 1);
  addCampo(VL_CONS, 2);
  addCampo(CNPJ_LID);
  addCampo(VL_DECL, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
