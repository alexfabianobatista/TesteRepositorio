unit Registro1990;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro1990 = Class (TRegistro)
    private
    public
      QTD_LIN_1: Double; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro1990 }

procedure TRegistro1990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_1, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
