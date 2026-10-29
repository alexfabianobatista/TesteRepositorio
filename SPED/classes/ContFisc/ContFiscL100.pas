unit ContFiscL100;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscL100 = class(TRegistro)
  private

  public
    CODIGO: String; //C(50)
    DESCRICAO: String; //C
    TIPO: String; //C(1)
    NIVEL: Integer; //N(3)
    COD_NAT: String; //C(4)
    COD_CTA_SUP: String; //C
    VAL_CTA_REF_INI: String; //C(19)
    IND_VAL_CTA_REF_INI: String; //C(1)
    VAL_CTA_REF_DEB: String; //N(19,2)
    VAL_CTA_REF_CRED: String; //N(19,2)
    VAL_CTA_REF_FIN: String; //C(19)
    IND_VAL_CTA_REF_FIN: String; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscL100.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CODIGO);
  addCampo(DESCRICAO);
  addCampo(TIPO, 1);
  addCampo(NIVEL, 3);
  addCampo(COD_NAT, 4);
  addCampo(COD_CTA_SUP);
  addCampo(VAL_CTA_REF_INI);
  addCampo(IND_VAL_CTA_REF_INI);
  addCampo(VAL_CTA_REF_DEB);
  addCampo(VAL_CTA_REF_CRED);
  addCampo(VAL_CTA_REF_FIN);
  addCampo(IND_VAL_CTA_REF_FIN);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;
end;

end.
