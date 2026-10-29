unit RegistroG990;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroG990 = Class (TRegistro)
    private
    public
      QTD_LIN_G: Double; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroG990 }

procedure TRegistroG990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_G, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
