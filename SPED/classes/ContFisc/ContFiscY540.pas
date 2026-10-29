unit ContFiscY540;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY540 = class(TRegistro)
  private

  public
    CNPJ_ESTAB: string; //C(14)
    VL_REC_ESTAB: double; //N(19,2)
    CNAE: integer; //N(7)
    

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY540.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CNPJ_ESTAB);
  addCampo(VL_REC_ESTAB, 2);
  addCampo(CNAE, 7);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
