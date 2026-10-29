unit Registro0990;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro0990 = Class (TRegistro)
    private
    public
      QTD_LIN_0: Double; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0990 }

procedure TRegistro0990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_0, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
