unit RegistroC510;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC510 = Class (TRegistro)
    private
    public
      NUM_ITEM: Integer; //N(3)
      COD_ITEM: String; //C(60)
      COD_CLASS: Integer; //N(4)
      QTD: Double; //N(X,3)
      UNID: String; //C(6)
      VL_ITEM: Double; //N(X,2)
      VL_DESC: Double; //N(X,2)
      CST_ICMS: Integer; //N(3)
      CFOP: Integer; //N(4)
      VL_BC_ICMS: Double; //N(X,2)
      ALIQ_ICMS: Double; //N(6,2)
      VL_ICMS: Double; //N(X,2)
      VL_BC_ICMS_ST: Double; //N(X,2)
      ALIQ_ST: Double; //N(6,2)
      VL_ICMS_ST: Double; //N(X,2)
      IND_REC: String; //C(1)
      COD_PART: String; //C(60)
      VL_PIS: Double; //N(X,2)
      VL_COFINS: Double; //N(X,2)
      COD_CTA: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC510 }

procedure TRegistroC510.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_ITEM, 3);
  addCampo(COD_ITEM, 60);
  addCampo(COD_CLASS, 4);
  addCampo(QTD, 3);
  addCampo(UNID, 6);
  addCampo(VL_ITEM, 2);
  addCampo(VL_DESC, 2);
  addCampo(CST_ICMS, 3);
  addCampo(CFOP, 4);
  addCampo(VL_BC_ICMS, 2);
  addCampo(ALIQ_ICMS, 6, 2);
  addCampo(VL_ICMS, 2);
  addCampo(VL_BC_ICMS_ST, 2);
  addCampo(ALIQ_ST, 6, 2);
  addCampo(VL_ICMS_ST, 2);
  addCampo(IND_REC, 1);
  addCampo(COD_PART, 60);
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
