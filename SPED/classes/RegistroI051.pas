unit RegistroI051;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI051 = Class (TRegistro)
    private
    public

//      COD_ENT_REF: String; //C(2)
      COD_CCUS: String; //C
      COD_PLAN_REF: String; //C(2)
//      COD_CTA_REF: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI051 }

procedure TRegistroI051.grava;
begin
  inherited;
  //addCampo(COD_ENT_REF);
  addCampo(bloco + registro);
  addCampo(COD_CCUS);
  addCampo(COD_PLAN_REF);
  //addCampo(COD_CTA_REF);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
