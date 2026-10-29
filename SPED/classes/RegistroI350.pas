unit RegistroI350;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI350 = Class (TRegistro)
    private
    public
      DT_RES: TDate; //N(8)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI350 }

procedure TRegistroI350.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_RES, 'D');
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
