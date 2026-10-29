unit ContFiscP001;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscP001 = class(TRegistro)
  private

  public
    IND_DAD: integer;

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscP001.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
