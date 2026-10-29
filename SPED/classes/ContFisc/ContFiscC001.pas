unit ContFiscC001;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscC001 = Class(TRegistro)
  private

  public
    IND_DAD: Integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscC001.grava;
begin

  inherited

  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;
  
end;

end.
