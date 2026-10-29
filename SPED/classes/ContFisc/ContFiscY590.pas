unit ContFiscY590;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY590 = class(TRegistro)
  private

  public
    TIP_ATIVO: string; //C(14)
    PAIS: integer; //N(3)
    DISCRIMINACAO: string; //C
    VL_ANT: double; //N(19,2)
    VL_ATUAL: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY590.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(TIP_ATIVO);
  addCampo(PAIS, 3);
  addCampo(DISCRIMINACAO);
  addCampo(VL_ANT, 2);
  addCampo(VL_ATUAL, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
