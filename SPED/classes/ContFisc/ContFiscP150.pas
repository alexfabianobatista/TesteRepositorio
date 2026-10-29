unit ContFiscP150;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscP150 = class(TRegistro)
  private

  public
    CODIGO: string; //C(50)
    DESCRICAO: string; //C
    TIPO: string; //C(1)
    NIVEL: integer; //N(3)
    COD_NAT: string; //C(2)
    COD_CTA_SUP: string; //C
    VALOR: double; //N(19,2)
    IND_VALOR: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscP150.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CODIGO);
  addCampo(DESCRICAO);
  addCampo(TIPO);
  addCampo(NIVEL, 3);
  addCampo(COD_NAT);
  addCampo(COD_CTA_SUP);
  addCampo(VALOR, 2);
  addCampo(IND_VALOR);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
