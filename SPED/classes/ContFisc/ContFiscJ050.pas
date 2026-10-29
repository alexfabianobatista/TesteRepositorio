unit ContFiscJ050;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscJ050 = Class(TRegistro)
  private

  public
    DT_ALT: TDate; //N(8)
    COD_NAT: String; //C(2)
    IND_CTA: String; //C(1)
    NIVEL: Integer;
    COD_CTA: String;
    COD_CTA_SUP: String;
    CTA: String;

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscJ050.grava;
begin

  inherited;

  addCampo(bloco + registro);
  addCampo(DT_ALT, 'D');
  addCampo(COD_NAT, 2);
  addCampo(IND_CTA, 1);
  addCampo(NIVEL, 1);
  addCampo(COD_CTA);
  addCampo(COD_CTA_SUP);
  addCampo(CTA);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;
end;

end.
