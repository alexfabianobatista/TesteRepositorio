unit RegistroE500;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE500 = Class (TRegistro)
    private
    public
      IND_APUR: String; //C(1)
      DT_INI: TDate; //N(8)
      DT_FIN: TDate; //N(8)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroE500 }

procedure TRegistroE500.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_APUR, 1);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIN, 'D');
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
