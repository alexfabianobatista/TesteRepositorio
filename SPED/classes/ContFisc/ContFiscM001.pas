unit ContFiscM001;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscM001 = class(TRegistro)
  private

  public
    IND_DAD: Integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscM001.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
