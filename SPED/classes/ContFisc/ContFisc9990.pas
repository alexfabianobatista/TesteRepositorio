unit ContFisc9990;

interface

uses Arquivo, Controls, Registro;

type
  TContFisc9990 = class(TRegistro)
  private

  public
    QTD_LIN: integer; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFisc9990.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(QTD_LIN, 0);
  
  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
