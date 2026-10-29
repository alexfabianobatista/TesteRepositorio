unit RegistroI300;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI300 = Class (TRegistro)
    private
    public
      DT_BCTE: TDate; //N(8)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI300 }

procedure TRegistroI300.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_BCTE, 'D');
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
