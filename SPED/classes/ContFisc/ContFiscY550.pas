unit ContFiscY550;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY550 = class(TRegistro)
  private

  public
    CNPJ_EXP: string; //C(14)
    COD_NCM: integer; //N(8)
    VL_VENDA: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY550.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CNPJ_EXP);
  addCampo(COD_NCM, 8);
  addCampo(VL_VENDA, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
