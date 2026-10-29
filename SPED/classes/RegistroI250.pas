unit RegistroI250;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI250 = Class (TRegistro)
    private
    public
      COD_CTA: String; //C
      COD_CCUS: String; //C
      VL_DC: Double; //N(X,2)
      IND_DC: String; //C(1)
      NUM_ARQ: String; //C
      COD_HIST_PAD: String; //C
      HIST: String; //C(65535)
      COD_PART: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI250 }

procedure TRegistroI250.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CTA);
  addCampo(COD_CCUS);
  addCampo(VL_DC, 2);
  addCampo(IND_DC, 1);
  addCampo(NUM_ARQ);
  addCampo(COD_HIST_PAD);
  addCampo(HIST, 65535);
  addCampo(COD_PART);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
