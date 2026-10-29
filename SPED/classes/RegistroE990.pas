unit RegistroE990;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE990 = Class (TRegistro)
    private
    public
      QTD_LIN_E: Double; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroE990 }

procedure TRegistroE990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_E, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
