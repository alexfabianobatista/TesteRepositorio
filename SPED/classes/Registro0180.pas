unit Registro0180;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro0180 = Class (TRegistro)
    private
    public
      COD_REL: Integer; //N(2)
      DT_INI_REL: TDate; //N(8)
      DT_FIN_REL: TDate; //N(8)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0180 }

procedure TRegistro0180.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_REL, 2);
  addCampo(DT_INI_REL, 'D');
  addCampo(DT_FIN_REL, 'D');

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
