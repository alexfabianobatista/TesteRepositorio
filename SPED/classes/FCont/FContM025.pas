unit FContM025;

interface

uses Arquivo, Registro, Controls;

type
  TFContM025 = class(TRegistro)
  private
  public
    COD_CTA: string; //C
    COD_CCUS: string; //C
    COD_CTA_REF: string; //C
    VL_SLD_FIN_FC: Double; //N(19,2)
    IND_DC_FIN_FC: string; //C(1)
    VL_SLD_FIN_SOC: Double; //(19,2)
    IND_DC_FIN_SOC: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContM025 }

procedure TFContM025.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CTA);
  addCampo(COD_CCUS);
  addCampo(COD_CTA_REF);
  addCampo(VL_SLD_FIN_FC, 16, 2);
  addCampo(IND_DC_FIN_FC, 1);
  addCampo(VL_SLD_FIN_SOC, 16, 2);
  addCampo(IND_DC_FIN_SOC, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
