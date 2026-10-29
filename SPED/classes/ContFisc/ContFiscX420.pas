unit ContFiscX420;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX420 = class(TRegistro)
  private

  public
    TIP_ROY: string; //C(1)
    PAIS: integer; //N(3)
    VL_EXPL_DIR_SW: double; //N(19,2)
    VL_EXPL_DIR_AUT: double; //N(19,2)
    VL_EXPL_MARCA: double; //N(19,2)
    VL_EXPL_PAT: double; //N(19,2)
    VL_EXPL_KNOW: double; //N(19,2)
    VL_EXPL_FRANQ: double; //N(19,2)
    VL_EXPL_INT: double; //N(19,2)


    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX420.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(TIP_ROY);
  addCampo(PAIS, 3);
  addCampo(VL_EXPL_DIR_SW, 2);
  addCampo(VL_EXPL_DIR_AUT, 2);
  addCampo(VL_EXPL_MARCA, 2);
  addCampo(VL_EXPL_PAT, 2);
  addCampo(VL_EXPL_KNOW, 2);
  addCampo(VL_EXPL_FRANQ, 2);
  addCampo(VL_EXPL_INT, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
