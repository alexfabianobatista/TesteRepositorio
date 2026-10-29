unit ContFiscY800;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY800 = class(TRegistro)
  private

  public
    ARQ_RTF: string; //C
    IND_FIM_RTF: string; //C(7)


    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY800.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(ARQ_RTF);
  addCampo(IND_FIM_RTF);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
