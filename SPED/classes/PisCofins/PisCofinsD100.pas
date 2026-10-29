unit PisCofinsD100;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsD100 = class(TRegistro)
  private
  public
    IND_OPER: string; //C(1)
    IND_EMIT: string; //C(1)
    COD_PART: string; //C(60)
    COD_MOD: string; //C(2)
    COD_SIT: Integer; //N(2)
    SER: string; //C(4)
    SUB: Integer; //N(3)
    NUM_DOC: Integer; //N(9)
    CHV_CTE: string; //N(44)
    DT_DOC: TDate; //N(8)
    DT_A_P: TDate; //N(8)
    TP_CT_e: Integer; //N(1)
    CHV_CTE_REF: string; //N(44)
    VL_DOC: Double; //N(X,2)
    VL_DESC: Double; //N(X,2)
    IND_FRT: string; //C(1)
    VL_SERV: Double; //N(X,2)
    VL_BC_ICMS: Double; //N(X,2)
    VL_ICMS: Double; //N(X,2)
    VL_NT: Double; //N(X,2)
    COD_INF: string; //C(6)
    COD_CTA: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsD100 }

procedure TPisCofinsD100.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_OPER, 1);
  addCampo(IND_EMIT, 1);
  addCampo(COD_PART, 60);
  addCampo(COD_MOD, 2);
  addCampo(COD_SIT, 2);
  addCampo(SER, 4);
  addCampo(SUB, 3);
  addCampo(NUM_DOC, 9);
  addCampo(CHV_CTE, 44);
  addCampo(DT_DOC, 'D');
  addCampo(DT_A_P, 'D');
  addCampo(TP_CT_e, 0);
  addCampo(CHV_CTE_REF, 44);
  addCampo(VL_DOC, 2);
  addCampo(VL_DESC, 2);
  addCampo(IND_FRT, 1);
  addCampo(VL_SERV, 2);
  addCampo(VL_BC_ICMS, 2);
  addCampo(VL_ICMS, 2);
  addCampo(VL_NT, 2);
  addCampo(COD_INF, 6);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
