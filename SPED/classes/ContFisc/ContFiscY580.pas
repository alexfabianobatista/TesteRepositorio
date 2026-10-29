unit ContFiscY580;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY580 = class(TRegistro)
  private

  public
    CNPJ: string; //C(14)
    TIP_BENEF: integer; //N(2)
    FORM_DOA: integer; //N(2)
    VL_DOA: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY580.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CNPJ);
  addCampo(TIP_BENEF, 2);
  addCampo(FORM_DOA, 2);
  addCampo(VL_DOA, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
