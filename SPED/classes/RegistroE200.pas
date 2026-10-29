unit RegistroE200;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE200 = Class (TRegistro)
    private
    public
      UF: String; //C(2)
      DT_INI: TDate; //N(8)
      DT_FIN: TDate; //N(8)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroE200 }

procedure TRegistroE200.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(UF, 2);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIN, 'D');
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
