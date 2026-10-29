unit RegistroJ001;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroJ001 = Class (TRegistro)
    private
    public
      IND_DAD: Integer; //N(1)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroJ001 }

procedure TRegistroJ001.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
