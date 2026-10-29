unit ContFiscL990;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscL990 = class(TRegistro)
  private

  public
    QTD_LIN: Integer; //N
    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscL990.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(QTD_LIN, 0);

  gravaLinha(ArquivoPadrao, TRegistro(self));
  afterGravacao;
end;
end.
