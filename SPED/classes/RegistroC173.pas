unit RegistroC173;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC173 = Class (TRegistro)
    private
    public
      LOTE_MED: String; //C
      QTD_ITEM: Integer; //N
      DT_FAB: TDate; //N(8)
      DT_VAL: TDate; //N(8)
      IND_MED: String; //C(1)
      TP_PROD: String; //C(1)
      VL_TAB_MAX: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC173 }

procedure TRegistroC173.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(LOTE_MED);
  addCampo(QTD_ITEM, 1);
  addCampo(DT_FAB, 'D');
  addCampo(DT_VAL, 'D');
  addCampo(IND_MED, 1);
  addCampo(TP_PROD, 1);
  addCampo(VL_TAB_MAX, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
