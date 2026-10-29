unit RegistroD510;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD510 = Class (TRegistro)
    private
    public
      NUM_ITEM: Integer; //N
      COD_ITEM: String; //C
      COD_CLASS: Integer; //N(4)
      QTD: Double; //N(X,3)
      UNID: String; //C
      VL_ITEM: Double; //N(X,2)
      VL_DESC: Double; //N(X,2)
      CST_ICMS: Integer; //N(3)
      CFOP: Integer; //N(4)
      VL_BC_ICMS: Double; //N(X,2)
      ALIQ_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)
      VL_BC_ICMS_ST: Double; //N(X,2)
      VL_ICMS_ST: Double; //N(X,2)
      IND_REC: String; //C(1)
      COD_PART: Integer; //N
      VL_PIS: Double; //N(X,2)
      VL_COFINS: Double; //N(X,2)
      COD_CTA: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD510 }

procedure TRegistroD510.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_ITEM, 0);
  addCampo(COD_ITEM);
  addCampo(COD_CLASS, 4);
  addCampo(QTD, 3);
  addCampo(UNID);
  addCampo(VL_ITEM, 2);
  addCampo(VL_DESC, 2);
  addCampo(CST_ICMS, 3);
  addCampo(CFOP, 4);
  addCampo(VL_BC_ICMS, 2);
  addCampo(ALIQ_ICMS, 2);
  addCampo(VL_ICMS, 2);
  addCampo(VL_BC_ICMS_ST, 2);
  addCampo(VL_ICMS_ST, 2);
  addCampo(IND_REC, 1);
  addCampo(COD_PART, 0);
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
