unit ContFiscM310;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscM310 = class(TRegistro)
  private

  public
    COD_CTA: string; //C
    COD_CCUS: string; //C
    VL_CTA: double; //(19,2)
    IND_VL_CTA: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscM310.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(COD_CTA);
  addCampo(COD_CCUS);
  addCampo(VL_CTA, 2);
  addCampo(IND_VL_CTA, 1);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
