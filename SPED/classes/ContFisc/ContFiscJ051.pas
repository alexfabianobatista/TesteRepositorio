unit ContFiscJ051;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscJ051 = Class(TRegistro)
  private

  public
    COD_CCUS: String;
    COD_CTA_REF: String;

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscJ051.grava;
begin

  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CCUS);
  addCampo(COD_CTA_REF);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;
end;

end.
