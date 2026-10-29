unit ContFiscK355;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscK355 = class(TRegistro)
  private

  public
    COD_CTA: String; //C
    COD_CCUS: String; //C
    VL_SLD_FIN: Double; //N(18,2)
    IND_VL_SLD_FIN: String; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscK355.grava;
begin

  inherited

  addCampo(bloco + registro);
  addCampo(COD_CTA);
  addCampo(COD_CCUS);
  addCampo(VL_SLD_FIN, 2);
  addCampo(IND_VL_SLD_FIN);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;
end;

end.
