unit RegistroB990;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroB990 = Class (TRegistro)
    private
    public
      QTD_LIN_C: Double; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroB990 }

procedure TRegistroB990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_C, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
