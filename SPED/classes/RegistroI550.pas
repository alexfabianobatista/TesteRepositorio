unit RegistroI550;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI550 = Class (TRegistro)
    private
    public
      RZ_CONT: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI550 }

procedure TRegistroI550.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(RZ_CONT);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
