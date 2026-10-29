unit FContI155;

interface

uses Arquivo, Registro, Controls;

type
  TFContI155 = class(TRegistro)
  private
  public
    COD_CTA: string; //C
    COD_CCUS: string; //C
    VL_SLD_INI: Double; //N(16,2)
    IND_DC_INI: string; //C(1)
    VL_DEB: Double; //N(16,2)
    VL_CRED: Double; //N(16,2)
    VL_SLD_FIN: Double; //N(16,2)
    IND_DC_FIN: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContI155 }

procedure TFContI155.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CTA);
  addCampo(COD_CCUS);
  addCampo(VL_SLD_INI, 16, 2);
  addCampo(IND_DC_INI, 1);
  addCampo(VL_DEB, 16, 2);
  addCampo(VL_CRED, 16, 2);
  addCampo(VL_SLD_FIN, 16, 2);
  addCampo(IND_DC_FIN, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

