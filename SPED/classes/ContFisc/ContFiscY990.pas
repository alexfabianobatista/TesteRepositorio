unit ContFiscY990;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY990 = class(TRegistro)
  private

  public
    QTD_LIN: integer; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY990.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(QTD_LIN, 0);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
