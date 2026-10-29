unit RegistroI052;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI052 = Class (TRegistro)
    private
    public
      COD_CCUS: String; //C
      COD_AGL: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI052 }

procedure TRegistroI052.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CCUS);
  addCampo(COD_AGL);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
