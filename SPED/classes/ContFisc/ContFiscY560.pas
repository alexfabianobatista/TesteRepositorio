unit ContFiscY560;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY560 = class(TRegistro)
  private

  public
    CNPJ: string; //C(14)
    COD_NCM: integer; //N(8)
    VL_COMPRA: double; //N(19,2)
    VL_EXP: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY560.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CNPJ);
  addCampo(COD_NCM, 8);
  addCampo(VL_COMPRA, 2);
  addCampo(VL_EXP, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
