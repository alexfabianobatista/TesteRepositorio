unit ContFiscY650;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY650 = class(TRegistro)
  private

  public
    CNPJ: string; //C(14)
    VL_PART: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY650.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CNPJ);
  addCampo(VL_PART, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
