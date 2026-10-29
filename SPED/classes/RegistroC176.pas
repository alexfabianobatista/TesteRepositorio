unit RegistroC176;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC176 = Class (TRegistro)
    private
    public
      COD_MOD_ULT_E: String; //C(2)
      NUM_COD_ULT_E: Integer; //N
      SER_ULT_E: String; //C
      DT_ULT_E: TDate; //N(8)
      COD_PART_ULT_E: String; //C
      QUANT_ULT_E: Double; //N(X,3)
      VL_UNIT_ULT_E: Double; //N(X,3)
      VL_UNIT_BC_ST: Double; //N(X,3)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC176 }

procedure TRegistroC176.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD_ULT_E, 2);
  addCampo(NUM_COD_ULT_E, 1);
  addCampo(SER_ULT_E);
  addCampo(DT_ULT_E, 'D');
  addCampo(COD_PART_ULT_E);
  addCampo(QUANT_ULT_E, 3);
  addCampo(VL_UNIT_ULT_E, 3);
  addCampo(VL_UNIT_BC_ST, 3);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end. 
