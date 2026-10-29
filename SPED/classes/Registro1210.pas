unit Registro1210;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro1210 = Class (TRegistro)
    private
    public
      TIPO_UTIL: Integer; //N(1)
      NR_DOC: String; //C
      VL_CRED_UTIL: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro1210 }

procedure TRegistro1210.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(TIPO_UTIL, 1);
  addCampo(NR_DOC);
  addCampo(VL_CRED_UTIL, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
