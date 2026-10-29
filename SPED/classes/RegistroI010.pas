unit RegistroI010;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI010 = Class (TRegistro)
    private
    public
      IND_ESC: String; //C(1)
      COD_VER_LC: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI010 }

procedure TRegistroI010.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_ESC, 1);
  addCampo(COD_VER_LC);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
