unit ContFiscY620;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY620 = class(TRegistro)
  private

  public
    DT_EVENTO: tdate; //C(8)
    IND_RELAC: integer; //N(1)
    PAIS: integer; //N(3)
    CNPJ: string; //C(14)
    NOME_EMP: string; //C
    VALOR_REAIS: double; //N(19,2)
    VALOR_ESTR: double; //N(19,2)
    PERC_CAP_TOT: double; //N(4,2)
    PERC_CAP_VOT: double; //N(4,2)
    RES_EQ_PAT: double; //N(19,2)
    DATA_AQUIS: tdate; //C(8)
    IND_PROC_CART: string; //C(1)
    NUM_PROC_CART: string; //C
    NOME_CART: string; //C
    IND_PROC_RFB: string; //C(1)
    NUM_PROC_RFB: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY620.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(DT_EVENTO, 'D');
  addCampo(IND_RELAC, 1);
  addCampo(PAIS, 3);
  addCampo(CNPJ);
  addCampo(NOME_EMP);
  addCampo(VALOR_REAIS, 2);
  addCampo(VALOR_ESTR, 2);
  addCampo(PERC_CAP_TOT, 1, 2);
  addCampo(PERC_CAP_VOT, 1, 2);
  addCampo(RES_EQ_PAT, 2);
  addCampo(DATA_AQUIS, 'D');
  addCampo(IND_PROC_CART);
  addCampo(NUM_PROC_CART);
  addCampo(NOME_CART);
  addCampo(IND_PROC_RFB);
  addCampo(NUM_PROC_RFB);
  
  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
