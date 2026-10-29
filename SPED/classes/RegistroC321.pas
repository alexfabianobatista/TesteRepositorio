unit RegistroC321;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC321 = Class (TRegistro)
    private
    public
      COD_ITEM: String; //C
      QTD: Double; //N(X,3)
      UNID: String; //C
      VL_ITEM: Double; //N(X,2)
      VL_DESC: Double; //N(X,2)
      VL_BC_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)
      VL_PIS: Double; //N(X,2)
      VL_COFINS: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC321 }

procedure TRegistroC321.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_ITEM);
  addCampo(QTD, 3);
  addCampo(UNID);
  addCampo(VL_ITEM, 2);
  addCampo(VL_DESC, 2);
  addCampo(VL_BC_ICMS, 2);
  addCampo(VL_ICMS, 2);
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
