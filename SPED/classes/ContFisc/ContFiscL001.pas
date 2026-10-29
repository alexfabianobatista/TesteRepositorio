unit ContFiscL001;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscL001 = class(TRegistro)
  private

  public
    IND_DAD: Integer; //N(1)
    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscL001.grava;
begin
  inherited
  
  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;

end;

end.
