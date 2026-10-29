unit RegistroI990;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI990 = Class (TRegistro)
    private
    public
      QTD_LIN_I: Double; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI990 }

procedure TRegistroI990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_I, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
