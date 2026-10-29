unit Registro1200;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro1200 = Class (TRegistro)
    private
    public
      COD_AJ_APUR: String; //C(8)
      SLD_CRED: Double; //N(X,2)
      CRED_APR: Double; //N(X,2)
      CRED_RECEB: Double; //N(X,2)
      SLD_CRED_FIM: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro1200 }

procedure TRegistro1200.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_AJ_APUR, 8);
  addCampo(SLD_CRED, 2);
  addCampo(CRED_APR, 2);
  addCampo(CRED_RECEB, 2);
  addCampo(SLD_CRED_FIM, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
