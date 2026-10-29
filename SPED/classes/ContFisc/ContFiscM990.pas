unit ContFiscM990;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscM990 = class(TRegistro)
  private

  public
    QTD_LIN: integer;

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscM990.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(QTD_LIN, 0);
  
  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;

end.
