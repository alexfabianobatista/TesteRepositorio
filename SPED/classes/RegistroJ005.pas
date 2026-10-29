unit RegistroJ005;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroJ005 = Class (TRegistro)
    private
    public
      DT_INI: TDate; //N(8)
      DT_FIN: TDate; //N(8)
      ID_DEM: Integer; //N(1)
      CAB_DEM: String; //N(65535)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroJ005 }

procedure TRegistroJ005.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIN, 'D');
  addCampo(ID_DEM, 1);
  addCampo(CAB_DEM, 65535);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
