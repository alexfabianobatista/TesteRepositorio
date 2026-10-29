unit RegistroK100;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TRegistroK100 = Class (TRegistro)
    private
    public
      DT_INI: TDate;
      DT_FIN: TDate;
      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroK100 }

procedure TRegistroK100.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_INI,'D');
  addCampo(DT_FIN,'D');
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
