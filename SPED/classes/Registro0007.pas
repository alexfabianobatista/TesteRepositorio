unit Registro0007;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro0007 = Class (TRegistro)
    private
    public
      COD_ENT_REF: String; //C
      COD_INSCR: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0007 }

procedure TRegistro0007.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_ENT_REF);
  addCampo(COD_INSCR);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
