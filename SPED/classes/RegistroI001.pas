unit RegistroI001;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI001 = Class (TRegistro)
    private
    public
      IND_DAD: Integer; //N(1)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI001 }

procedure TRegistroI001.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
