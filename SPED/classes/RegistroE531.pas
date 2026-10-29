unit RegistroE531;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE531 = Class (TRegistro)
    private
    public
      COD_PART: String; //C(6)
      COD_MOD: String; //C(2)
      SER: Integer; //N(4)
      SUB: String; //C(3)
      NUM_DOC: Integer; //C
      DT_DOC: TDate; //C
      COD_ITEM: String; //C
      VL_AJ_ITEM: Double; //N(X,2)
      CHV_NFE: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroE531 }

procedure TRegistroE531.grava;
begin
  inherited;  
  addCampo(bloco + registro);
  addCampo(COD_PART);
  addCampo(COD_MOD, 2);
  addCampo(SER, 3);
  addCampo(SUB);
  addCampo(NUM_DOC, 9);
  addCampo(DT_DOC, 'D');
  addCampo(COD_ITEM);
  addCampo(VL_AJ_ITEM, 2);
  addCampo(CHV_NFE, 44);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
