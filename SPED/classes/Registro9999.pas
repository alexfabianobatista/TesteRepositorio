unit Registro9999;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro9999 = Class (TRegistro)
    private
    public
      QTD_LIN: Double; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro9999 }

procedure TRegistro9999.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
