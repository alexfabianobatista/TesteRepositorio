unit ContFiscJ001;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscJ001 = class(TRegistro)
  private

  public
    IND_DAD: Integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscJ001.grava;
begin

  inherited;

  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;
  
end;

end.
