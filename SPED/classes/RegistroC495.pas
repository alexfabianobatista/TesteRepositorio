unit RegistroC495;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC495 = Class (TRegistro)
    private
    public
      ALIQ_ICMS: Double; //N(X,2)
      COD_ITEM: String; //C
      QTD: Double; //N(X,3)
      QTD_CANC: Double; //N(X,3)
      UNID: String; //C
      VL_ITEM: Double; //N(X,2)
      VL_DESC: Double; //N(X,2)
      VL_CANC: Double; //N(X,2)
      VL_ACMO: Double; //N(X,2)
      VL_BC_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)
      VL_ISEN: Double; //N(X,2)
      VL_NT: Double; //N(X,2)
      VL_ICMS_NT: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC495 }

procedure TRegistroC495.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(ALIQ_ICMS, 2);
  addCampo(COD_ITEM);
  addCampo(QTD, 3);
  addCampo(QTD_CANC, 3);
  addCampo(UNID);
  addCampo(VL_ITEM, 2);
  addCampo(VL_DESC, 2);
  addCampo(VL_CANC, 2);
  addCampo(VL_ACMO, 2);
  addCampo(VL_BC_ICMS, 2);
  addCampo(VL_ICMS, 2);
  addCampo(VL_ISEN, 2);
  addCampo(VL_NT, 2);
  addCampo(VL_ICMS_NT, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
