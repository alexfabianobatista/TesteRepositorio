unit RegistroH990;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroH990 = Class (TRegistro)
    private
    public
      QTD_LIN_H: Double; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroH990 }

procedure TRegistroH990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_H, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
