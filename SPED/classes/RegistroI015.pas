unit RegistroI015;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI015 = Class (TRegistro)
    private
    public
      COD_CTA_RES: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI015 }

procedure TRegistroI015.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CTA_RES);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
