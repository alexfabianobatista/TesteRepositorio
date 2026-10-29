unit ContfFiscY612;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY612 = class(TRegistro)
  private

  public
    CPF: string; //C(11)
    NOME: string; //C
    QUALIF: integer; //N(2)
    VL_REM_TRAB: double; //N(19,2)
    VL_DEM_REND: double; //N(19,2)
    VL_IR_RET: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY612.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CPF);
  addCampo(NOME);
  addCampo(QUALIF, 2);
  addCampo(VL_REM_TRAB, 2);
  addCampo(VL_DEM_REND, 2);
  addCampo(VL_IR_RET, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
