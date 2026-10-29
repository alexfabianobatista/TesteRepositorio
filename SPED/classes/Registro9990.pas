unit Registro9990;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro9990 = Class (TRegistro)
    private
    public
      QTD_LIN_9: Double; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro9990 }

procedure TRegistro9990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_9, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
