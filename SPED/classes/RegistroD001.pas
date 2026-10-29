unit RegistroD001;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD001 = Class (TRegistro)
    private
    public
      IND_MOV: Integer; //N(1)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD001 }

procedure TRegistroD001.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_MOV, 1);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end. 
