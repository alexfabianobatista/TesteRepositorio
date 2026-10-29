unit RegistroI310;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI310 = Class (TRegistro)
    private
    public
      COD_CTA: String; //C
      COD_CCUS: String; //C
      VAL_DEBD: Double; //N(X,2)
      VAL_CRED: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI310 }

procedure TRegistroI310.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CTA);
  addCampo(COD_CCUS);
  addCampo(VAL_DEBD, 2);
  addCampo(VAL_CRED, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
