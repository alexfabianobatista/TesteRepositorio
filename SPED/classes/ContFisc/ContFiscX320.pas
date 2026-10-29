unit ContFiscX320;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX320 = class(TRegistro)
  private

  public
    NUM_ORD: string; //C
    TIP_IMP: integer; //N(2)
    DESC_IMP: string; //C
    TOT_OPER: double; //N(19,2)
    COD_NCM: integer; //N(8)
    QTDE: double; //N(19,2)
    UNI_MED: string; //N(2)
    TIP_MET: string; //C(5)
    VL_PAR: double; //N(19,2)
    VL_PRAT: double; //N(19,2)
    VL_AJ: double; //N(19,2)
    VL_JUR: double; //N(19,2)
    VL_JUR_MIN: double; //N(7,4)
    VL_JUR_MAX: double; //N(7,4)
    COD_CNC: string; //C(5)
    TIP_MOEDA: string; //C(3)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX320.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(NUM_ORD);
  addCampo(TIP_IMP, 2);
  addCampo(DESC_IMP);
  addCampo(TOT_OPER, 2);
  addCampo(COD_NCM, 8);
  addCampo(QTDE, 2);
  addCampo(UNI_MED);
  addCampo(TIP_MET);
  addCampo(VL_PAR, 2);
  addCampo(VL_PRAT, 2);
  addCampo(VL_AJ, 2);
  addCampo(VL_JUR, 2);
  addCampo(VL_JUR_MIN, 3, 4);
  addCampo(VL_JUR_MAX, 3, 4);
  addCampo(COD_CNC);
  addCampo(TIP_MOEDA);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
