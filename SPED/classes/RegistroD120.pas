unit RegistroD120;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD120 = Class (TRegistro)
    private
    public
      COD_MUN_ORIG: Integer; //N(7)
      COD_MUN_DEST: Integer; //N(7)
      VEIC_ID: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD120 }

procedure TRegistroD120.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MUN_ORIG, 7);
  addCampo(COD_MUN_DEST, 7);
  addCampo(VEIC_ID);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
