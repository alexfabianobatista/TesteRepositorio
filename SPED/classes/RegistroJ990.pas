unit RegistroJ990;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroJ990 = Class (TRegistro)
    private
    public
      QTD_LIN_J: Double; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroJ990 }

procedure TRegistroJ990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_J, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
