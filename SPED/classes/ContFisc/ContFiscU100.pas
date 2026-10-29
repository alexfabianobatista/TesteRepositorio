unit ContFiscU100;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscU100 = class(TRegistro)
  private

  public
    CODIGO: string; //C(50)
    DESCRICAO: string; //C
    TIPO: string; //C(1)
    NIVEL: integer; //N(3)
    COD_NAT: string; //C(4)
    COD_CTA_SUP: string; //C
    VAL_CTA_REF_INI: double; //N(19,2)
    IND_VAL_CTA_REF_INI: string; //C(1)
    VAL_CTA_REF_FIN: double; //N(19,2)
    IND_VAL_CTA_REF_FIN: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscU100.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CODIGO);
  addCampo(DESCRICAO);
  addCampo(TIPO);
  addCampo(NIVEL, 3);
  addCampo(COD_NAT);
  addCampo(COD_CTA_SUP);
  addCampo(VAL_CTA_REF_INI, 2);
  addCampo(IND_VAL_CTA_REF_INI);
  addCampo(VAL_CTA_REF_FIN, 2);
  addCampo(IND_VAL_CTA_REF_FIN);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
