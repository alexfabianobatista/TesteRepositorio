unit ContFiscL200;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscL200 = class(TRegistro)
  private

  public
    IND_AVAL_ESTOQ: String; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscL200.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(IND_AVAL_ESTOQ, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;
end;

end.
