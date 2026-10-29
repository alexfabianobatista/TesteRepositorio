unit ContFiscY690;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY690 = class(TRegistro)
  private

  public
    MES: integer; //N(2)
    VL_REC_BRU: double; //N(19,2)
    
    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY690.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(MES, 2);
  addCampo(VL_REC_BRU, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
