unit FContI156;

interface

uses Arquivo, Registro, Controls;

type
  TFContI156 = class(TRegistro)
  private
  public
    COD_CTA_REF: string; //C
    VL_DEB: Double; //N(19,2)
    VL_CRED: Double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContI156 }

procedure TFContI156.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CTA_REF);
  addCampo(VL_DEB, 19, 2);
  addCampo(VL_CRED, 19, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
