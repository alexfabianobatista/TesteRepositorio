unit RegistroG001;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroG001 = Class (TRegistro)
    private
    public
      IND_MOV: Integer; //N(1)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroG001 }

procedure TRegistroG001.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_MOV, 1);
  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
