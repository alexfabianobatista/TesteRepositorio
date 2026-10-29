unit RegistroK010;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroK010 = Class (TRegistro)
    private
    public
      IND_TP_LEIAUTE: String; //(C, 1);

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroK010 }

procedure TRegistroK010.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_TP_LEIAUTE);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
