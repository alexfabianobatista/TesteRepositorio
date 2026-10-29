unit ContFisc0001;

interface

uses Arquivo, Controls, Registro;

type
  TContFisc0001 = class(TRegistro)
  private

  public
    IND_DAD: Integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFisc0001.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;

end.
