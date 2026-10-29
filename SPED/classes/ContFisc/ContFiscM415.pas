unit ContFiscM415;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscM415 = class(TRegistro)
  private

  public
    IND_PROC: string; //C(1)
    NUM_PROC: string; //C(20)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscM415.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(IND_PROC);
  addCampo(NUM_PROC);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
