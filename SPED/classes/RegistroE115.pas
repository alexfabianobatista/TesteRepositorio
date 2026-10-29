unit RegistroE115;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE115 = Class (TRegistro)
    private
    public
      COD_INF_ADIC: String; //C(8)
      VL_INF_ADIC: Double; //N(X,2)
      DESC_COMPL_AJ: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroE115 }

procedure TRegistroE115.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_INF_ADIC);
  addCampo(VL_INF_ADIC, 2);
  addCampo(DESC_COMPL_AJ);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
