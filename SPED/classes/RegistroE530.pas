unit RegistroE530;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE530 = Class (TRegistro)
    private
    public
      IND_AJ: String; //C(1)
      VL_AJ: Double; //N(X,2)
      COD_AJ: String; //C(3)
      IND_DOC: integer; //N(1)
      NUM_DOC: String; //C
      DESCR_AJ: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroE530 }

procedure TRegistroE530.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_AJ, 1);
  addCampo(VL_AJ, 2);
  addCampo(COD_AJ, 3);
  addCampo(IND_DOC, 1);
  addCampo(NUM_DOC);
  addCampo(DESCR_AJ);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
