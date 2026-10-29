unit ContFiscM360;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscM360 = class(TRegistro)
  private

  public
    COD_CTA: string; //C
    COD_CCUS: string; //C
    VL_CTA: double; //N(19,2)
    IND_VL_CTA: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscM360.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(COD_CTA);
  addCampo(COD_CCUS);
  addCampo(VL_CTA, 2);
  addCampo(IND_VL_CTA);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
