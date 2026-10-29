unit ContFiscU001;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscU001 = class(TRegistro)
  private

  public
    IND_DAD: integer; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscU001.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);
  
  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
