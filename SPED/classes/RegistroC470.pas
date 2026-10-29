unit RegistroC470;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC470 = Class (TRegistro)
    private
    public
      COD_ITEM: String; //C
      QTD: Double; //N(X,3)
      QTD_CANC: Double; //N(X,3)
      UNID: String; //C
      VL_ITEM: Double; //N(X,2)
      CST_ICMS: Integer; //N(3)
      CFOP: Integer; //N(4)
      ALIQ_ICMS: Double; //N(X,2)
      VL_PIS: Double; //N(X,2)
      VL_COFINS: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC470 }

procedure TRegistroC470.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_ITEM);
  addCampo(QTD, 3);
  addCampo(QTD_CANC, 3);
  addCampo(UNID);
  addCampo(VL_ITEM, 2);
  addCampo(CST_ICMS, 3);
  addCampo(CFOP, 4);
  addCampo(ALIQ_ICMS, 2);
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
