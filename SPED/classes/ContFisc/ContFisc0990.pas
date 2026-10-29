unit ContFisc0990;

interface

uses Arquivo, Controls, Registro;

type
  TContFisc0990 = Class(TRegistro)
  private

  public
    QTD_LIN: Integer; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFisc0990.grava;
begin

  inherited

  addCampo(bloco + registro);
  addCampo(QTD_LIN, 0);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;
  
end;

end.
