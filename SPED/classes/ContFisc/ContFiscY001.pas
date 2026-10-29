unit ContFiscY001;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY001 = class(TRegistro)
  private

  public
    IND_DAD: integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY001.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);
  
  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
