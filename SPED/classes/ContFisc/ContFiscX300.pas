unit ContFiscX300;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX300 = class(TRegistro)
  private

  public
    NUM_ORDEM: string; //C
    TIP_EXP: integer; //N(2)
    DESC_EXP: string; //C
    TOT_OPER: double; //N(19,2)
    COD_NCM: integer; //N(8)
    QTDE: double; //N(19,2)
    UNI_MED: string; //C(2)
    IND_OPER: string; //C(1)
    TIP_MET: string; //C(5)
    VL_PAR: double; //N(19,2)
    VL_PRAT: double; //N(19,2)
    VL_AJ: double; //N(19,2)
    VL_JUR: double; //N(19,2)
    VL_JUR_MIN: double; //N(7,4)
    VL_JUR_MAX: double; //N(7,4)
    COD_CNC: integer; //N(5)
    TIP_MOEDA: string; //C(3)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX300.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(NUM_ORDEM);
  addCampo(TIP_EXP, 2);
  addCampo(DESC_EXP);
  addCampo(TOT_OPER, 2);
  addCampo(COD_NCM, 8);
  addCampo(QTDE, 2);
  addCampo(UNI_MED);
  addCampo(IND_OPER);
  addCampo(TIP_MET);
  addCampo(VL_PAR, 2);
  addCampo(VL_PRAT, 2);
  addCampo(VL_AJ, 2);
  addCampo(VL_JUR, 2);
  addCampo(VL_JUR_MIN, 3, 4);
  addCampo(VL_JUR_MAX, 3, 4);
  addCampo(COD_CNC, 5);
  addCampo(TIP_MOEDA);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
