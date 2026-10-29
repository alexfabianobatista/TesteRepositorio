unit RegistroG140;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroG140 = Class (TRegistro)
    private
    public
      NUM_ITEM: Integer; //N(2)
      COD_ITEM: String;  //C(60)
      QTDE: Double;      //N(15,5)
      UNID: String;      //C(6)
      VL_ICMS_OP_APLICADO: Double; // N(15,2)
      VL_ICMS_ST_APLICADO: Double; // N(15,2)
      VL_ICMS_FRT_APLICADO: Double; // N(15,2)
      VL_ICMS_DIF_APLICADO: Double; // N(15,2)
      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroG140 }

procedure TRegistroG140.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_ITEM, 2);
  addCampo(COD_ITEM, 60);  //C(60)
  addCampo(QTDE, 15,5);      //N(15,5)
  addCampo(UNID, 6);      //C(6)
  addCampo(VL_ICMS_OP_APLICADO, 15,5); // N(15,2)
  addCampo(VL_ICMS_ST_APLICADO, 15,5); // N(15,2)
  addCampo(VL_ICMS_FRT_APLICADO, 15,5); // N(15,2)
  addCampo(VL_ICMS_DIF_APLICADO, 15,5); // N(15,2)

   gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
