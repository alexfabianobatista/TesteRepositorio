unit RegistroC178;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC178 = Class (TRegistro)
    private
    public
      CL_ENQ: String; //C(5)
      VL_UNID: Double; //N(X,2)
      QUANT_PAD: Double; //N(X,3)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC178 }

procedure TRegistroC178.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(CL_ENQ, 5);
  addCampo(VL_UNID, 2);
  addCampo(QUANT_PAD, 3);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
