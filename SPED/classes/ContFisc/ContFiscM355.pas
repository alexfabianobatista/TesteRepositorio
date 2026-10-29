unit ContFiscM355;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscM355 = class(TRegistro)
  private

  public
    COD_CTA_B: string; //C
    VL_CTA: double; //N(19,2)
    IND_VL_CTA: string; //C(1)

    procedure grava;  
  end;

implementation

uses UFuncoes;

procedure TContFiscM355.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(COD_CTA_B);
  addCampo(VL_CTA, 2);
  addCampo(IND_VL_CTA);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
 