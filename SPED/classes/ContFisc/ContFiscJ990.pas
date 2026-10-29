unit ContFiscJ990;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscJ990 = Class(TRegistro)
  private

  public
    QTD_LIN: Integer;

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscJ990.grava;
begin
  inherited

  addCampo(bloco + registro);
  addCampo(QTD_LIN, 0);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;
end;

end.
