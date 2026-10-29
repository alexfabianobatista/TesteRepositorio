unit ContFiscK990;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscK990 = class(TRegistro)
  private

  public
    QTD_LIN: Integer; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscK990.grava;
begin
  inherited

  addCampo(bloco + registro);
  addCampo(QTD_LIN, 0);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;
end;

end.
