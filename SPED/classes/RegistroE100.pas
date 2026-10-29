unit RegistroE100;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE100 = Class (TRegistro)
    private
    public
      DT_INI: TDate; //N(8)
      DT_FIN: TDate; //N(8)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroE100 }

procedure TRegistroE100.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIN, 'D');
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
