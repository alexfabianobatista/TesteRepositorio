unit RegistroI150;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI150 = Class (TRegistro)
    private
    public
      DT_INI: TDate; //N(8)
      DT_FIN: TDate; //N(8)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI150 }

procedure TRegistroI150.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIN, 'D');
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
