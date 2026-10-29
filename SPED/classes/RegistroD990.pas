unit RegistroD990;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD990 = Class (TRegistro)
    private
    public
      QTD_LIN_D: Double; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD990 }

procedure TRegistroD990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_D, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end. 
