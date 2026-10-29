unit ContFiscK356;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscK356 = class(TRegistro)
  private

  public
    COD_CTA_REF: String; //C
    VL_SLD_FIN: Double; //N(19,2)
    IND_VL_SLD_FIN: String; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscK356.grava;
begin

  inherited
  addCampo(bloco + registro);
  addCampo(COD_CTA_REF);
  addCampo(VL_SLD_FIN, 2);
  addCampo(IND_VL_SLD_FIN);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;

end;

end.
