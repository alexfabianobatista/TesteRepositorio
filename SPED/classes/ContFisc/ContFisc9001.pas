unit ContFisc9001;

interface

uses Arquivo, Controls, Registro;

type
  TContFisc9001 = class(TRegistro)
  private

  public
    IND_DAD: integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFisc9001.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);
  
  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
