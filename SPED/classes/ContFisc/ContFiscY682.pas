unit ContFiscY682;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY682 = class(TRegistro)
  private

  public
    MES: integer; //N(2)
    ACRES_PATR: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY682.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(MES, 2);  
  addCampo(ACRES_PATR, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
