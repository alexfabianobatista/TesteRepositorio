unit RegistroI355;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI355 = Class (TRegistro)
    private
    public
      COD_CTA: String; //C
      COD_CCUS: String; //C
      VAL_CTA: Double; //N(X,2)
      IND_DC: String; //C(1)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI355 }

procedure TRegistroI355.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CTA);
  addCampo(COD_CCUS);
  addCampo(VAL_CTA, 2);
  addCampo(IND_DC, 1);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
