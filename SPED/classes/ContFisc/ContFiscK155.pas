unit ContFiscK155;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscK155 = class(TRegistro)
  private

  public
    COD_CTA: String;
    COD_CCUS: String;
    VL_SLD_INI: Double; //N(19,2)
    IND_VL_SLD_INI: String; //C(1)
    VL_DEB: Double; //N(19,2)
    VL_CRED: Double; //N(19,2)
    VL_SLD_FIN: Double; //N(19,2)
    IND_VL_SLD_FIN: String; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscK155.grava;
begin
  inherited;

  addCampo(bloco + registro);

  addCampo(COD_CTA);
  addCampo(COD_CCUS);
  addCampo(VL_SLD_INI, 2);
  addCampo(IND_VL_SLD_INI);
  addCampo(VL_DEB, 2);
  addCampo(VL_CRED, 2);
  addCampo(VL_SLD_FIN, 2);
  addCampo(IND_VL_SLD_FIN);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;

end;

end.
