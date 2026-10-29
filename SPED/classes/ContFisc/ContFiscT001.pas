unit ContFiscT001;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscT001 = class(TRegistro)
  private

  public
    IND_DAD: integer; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscT001.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);
  
  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
