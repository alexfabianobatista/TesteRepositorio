unit ContFiscY570;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY570 = class(TRegistro)
  private

  public
    CNPJ_FON: string; //C(14)
    NOME_EMP: string; //C
    IND_ORG_PUB: string; //C
    COD_REC:  integer; //N(4)
    VL_REND: double; //N(19,2)
    IR_RET: double; //N(19,2)
    CSLL_RET: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY570.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CNPJ_FON);
  addCampo(NOME_EMP);
  addCampo(IND_ORG_PUB);
  addCampo(COD_REC, 4);
  addCampo(VL_REND, 2);
  addCampo(IR_RET, 2);
  addCampo(CSLL_RET, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
