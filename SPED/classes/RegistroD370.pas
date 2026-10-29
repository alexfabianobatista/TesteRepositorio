unit RegistroD370;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD370 = Class (TRegistro)
    private
    public
      COD_MUN_ORIG: Integer; //N(7)
      VL_SERV: Double; //N(X,2)
      QTD_BILH: Integer; //N
      VL_BC_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD370 }

procedure TRegistroD370.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MUN_ORIG, 7);
  addCampo(VL_SERV, 2);
  addCampo(QTD_BILH, 0);
  addCampo(VL_BC_ICMS, 2);
  addCampo(VL_ICMS, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
