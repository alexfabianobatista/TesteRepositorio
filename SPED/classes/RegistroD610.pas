unit RegistroD610;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD610 = Class (TRegistro)
    private
    public
      COD_CLASS: Integer; //N(4)
      COD_ITEM: String; //C
      QTD: Double; //N(X,3)
      UNID: String; //C
      VL_ITEM: Double; //N(X,2)
      VL_DESC: Double; //N(X,2)
      CST_ICMS: Integer; //N(3)
      CFOP: Integer; //N(4)
      ALIQ_ICMS: Double; //N(X,2)
      VL_BC_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)
      VL_BC_ICMS_ST: Double; //N(X,2)
      VL_ICMS_ST: Double; //N(X,2)
      VL_RED_BC: Double; //N(X,2)
      VL_PIS: Double; //N(X,2)
      VL_COFINS: Double; //N(X,2)
      COD_CTA: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD610 }

procedure TRegistroD610.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CLASS, 4);
  addCampo(COD_ITEM);
  addCampo(QTD, 3);
  addCampo(UNID);
  addCampo(VL_ITEM, 2);
  addCampo(VL_DESC, 2);
  addCampo(CST_ICMS, 3);
  addCampo(CFOP, 4);
  addCampo(ALIQ_ICMS, 2);
  addCampo(VL_BC_ICMS, 2);
  addCampo(VL_ICMS, 2);
  addCampo(VL_BC_ICMS_ST, 2);
  addCampo(VL_ICMS_ST, 2);
  addCampo(VL_RED_BC, 2);
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
