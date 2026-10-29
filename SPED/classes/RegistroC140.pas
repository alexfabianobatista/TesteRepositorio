unit RegistroC140;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC140 = Class (TRegistro)
    private
    public
      IND_EMIT: String; //C(1)
      IND_TIT: String; //C(2)
      DESC_TIT: String; //C
      NUM_TIT: String; //C
      QTD_PARC: Integer; //N
      VL_TIT: DOUBLE; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC140 }

procedure TRegistroC140.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_EMIT, 1);
  addCampo(IND_TIT, 2);
  addCampo(DESC_TIT);
  addCampo(NUM_TIT);
  addCampo(QTD_PARC, 0);
  addCampo(VL_TIT, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
