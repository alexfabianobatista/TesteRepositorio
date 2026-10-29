unit ContFiscM365;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscM365 = class(TRegistro)
  private

  public
    IND_PROC: string; //C(1)
    NUM_PROC: string; //C(20)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscM365.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(IND_PROC);
  addCampo(NUM_PROC);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
