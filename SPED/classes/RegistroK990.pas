unit RegistroK990;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroK990 = Class (TRegistro)
    private
    public
      QTD_LIN_K: Double;

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroK990 }

procedure TRegistroK990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_K, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
