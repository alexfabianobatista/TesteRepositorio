unit FContI200;

interface

uses Arquivo, Registro, Controls;

type
  TFContI200 = class(TRegistro)
  private
  public
    NUM_LCTO: string; //C
    DT_LCTO: TDate; //N(8)
    VL_LCTO: Double; //N(19,2)
    IND_LCTO: string; //C(2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContI200 }

procedure TFContI200.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_LCTO);
  addCampo(DT_LCTO, 'D');
  addCampo(VL_LCTO, 16, 2);
  addCampo(IND_LCTO, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
