unit RegistroE113;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE113 = Class (TRegistro)
    private
    public
      COD_PART: String; //C
      COD_MOD: String; //C(2)
      SER: String; //C
      SUB: Integer; //N
      NUM_DOC: Integer; //N(9)
      DT_DOC: TDate; //N(8)
      CHV_NFE: String; //N(44)
      COD_ITEM: String; //C
      VL_AJ_ITEM: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroE113 }

procedure TRegistroE113.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_PART);
  addCampo(COD_MOD, 2);
  addCampo(SER);
  addCampo(SUB, 0);
  addCampo(NUM_DOC, 9);
  addCampo(DT_DOC, 'D');
  addCampo(CHV_NFE, 44);
  addCampo(COD_ITEM);
  addCampo(VL_AJ_ITEM, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
