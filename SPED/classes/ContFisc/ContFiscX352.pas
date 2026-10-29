unit ContFiscX352;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX352 = class(TRegistro)
  private

  public
    RES_PER: double; //N(19,2)
    RES_PER_REAL: double; //N(19,2)
    LUC_DISP: double; //N(19,2)
    LUC_DISP_REAL: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX352.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(RES_PER, 2);
  addCampo(RES_PER_REAL, 2);
  addCampo(LUC_DISP, 2);
  addCampo(LUC_DISP_REAL, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
