unit RegistroI200;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI200 = Class (TRegistro)
    private
    public
      NUM_LCTO: String; //C
      DT_LCTO: TDate; //N(8)
      VL_LCTO: Double; //N(X,2)
      IND_LCTO: String; //C(1)
      DT_LCTO_EXT: String; //C(8)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI200 }

procedure TRegistroI200.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_LCTO);
  addCampo(DT_LCTO, 'D');
  addCampo(VL_LCTO, 2);
  addCampo(IND_LCTO, 1);
  addCampo(''); //DT_LCTO_EXT
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
