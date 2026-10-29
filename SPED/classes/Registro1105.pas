unit Registro1105;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro1105 = Class (TRegistro)
    private
    public
      COD_MOD: String; //C(2)
      SERIE: String; //C(3)
      NUM_DOC: Integer; //N(9)
      CHV_NFE: String; //N(44)
      DT_DOC: TDate; //N(8)
      COD_ITEM: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro1105 }

procedure TRegistro1105.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(SERIE, 3);
  addCampo(NUM_DOC, 9);
  addCampo(CHV_NFE, 44);
  addCampo(DT_DOC, 'D');
  addCampo(COD_ITEM);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
