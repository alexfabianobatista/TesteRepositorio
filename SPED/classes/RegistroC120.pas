unit RegistroC120;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC120 = Class (TRegistro)
    private
    public
      COD_DOC_IMP: Integer; //C(1)
      NUM_DOC__IMP: String; //C
      PIS_IMP: Double; //N(X,2)
      COFINS_IMP: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC120 }

procedure TRegistroC120.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_DOC_IMP, 1);
  addCampo(NUM_DOC__IMP);
  addCampo(PIS_IMP, 2);
  addCampo(COFINS_IMP, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end. 
