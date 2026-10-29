unit RegistroC425;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC425 = Class (TRegistro)
    private
    public
      COD_ITEM: String; //C
      QTD: Double; //N(X,3)
      UNID: String; //C
      VL_ITEM: Double; //N(X,2)
      VL_PIS: Double; //N(X,2)
      VL_COFINS: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC425 }

procedure TRegistroC425.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_ITEM);
  addCampo(QTD, 3);
  addCampo(UNID);
  addCampo(VL_ITEM, 2);
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
