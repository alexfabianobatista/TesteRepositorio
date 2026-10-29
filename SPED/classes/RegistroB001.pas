unit RegistroB001;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroB001 = Class (TRegistro)
    private
    public
      IND_MOV: Integer; //N(1)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroB001 }

procedure TRegistroB001.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_MOV, 1);
  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
