unit ContFiscL300;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscL300 = class(TRegistro)
  private

  public
    CODIGO: String; //C(50)
    DESCRICAO: String; //C
    TIPO: String; //C(1)
    NIVEL: Integer; //N(3)
    COD_NAT: String; //C(2)
    COD_CTA_SUP: String; //C
    VALOR: Double; //N(19,2)
    IND_VALOR: String; //C(1)
    procedure grava;

  end;

implementation

uses UFuncoes;

procedure TContFiscL300.grava;
begin
  inherited
  addCampo(bloco + registro);
  addCampo(CODIGO);
  addCampo(DESCRICAO);
  addCampo(TIPO);
  addCampo(NIVEL, 3);
  addCampo(COD_NAT);
  addCampo(COD_CTA_SUP);
  addCampo(VALOR, 2);
  addCampo(IND_VALOR);

  gravaLinha(ArquivoPadrao, TRegistro(self));
  afterGravacao;
end;

end.
