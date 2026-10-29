unit FContM030;

interface

uses Arquivo, Registro, Controls;

type
  TFContM030 = class(TRegistro)
  private
  public
    IND_PER: string; //C(3)
    VL_LUC_LIQ: Double; //(19,2)
    IND_LUC_LIQ: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContM030 }

procedure TFContM030.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_PER);
  addCampo(VL_LUC_LIQ, 16, 2);
  addCampo(IND_LUC_LIQ, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
