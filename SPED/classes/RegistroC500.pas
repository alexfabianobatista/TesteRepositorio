unit RegistroC500;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC500 = class(TRegistro)
  private
  public
    IND_OPER: string; //C(1)              02
    IND_EMIT: string; //C(1)              03
    COD_PART: string; //C                 04
    COD_MOD: string; //C(2)               05
    COD_SIT: Integer; //N(2)              06
    SER: string; //C                      07
    SUB: Integer; //N                     08
    COD_CONS: String; //C(2)              09
    NUM_DOC: Integer; //C(9)              10
    DT_DOC: TDate; //N(8)                 11
    DT_E_S: TDate; //N(8)                 12
    VL_DOC: Double; //N(X,2)              13
    VL_DESC: Double; //N(X,2)             14
    VL_FORN: Double; //N(X,2)             15
    VL_SERV_NT: Double; //N(X,2)          16
    VL_TERC: Double; //N(X,2)             17
    VL_DA: Double; //N(X,2)               18
    VL_BC_ICMS: Double; //N(X,2)          19
    VL_ICMS: Double; //N(X,2)             20
    VL_BC_ICMS_ST: Double; //N(X,2)       21
    VL_ICMS_ST: Double; //N(X,2)          22
    COD_INF: string; //C                  23
    VL_PIS: Double; //N(X,2)              24
    VL_COFINS: Double; //N(X,2)           25
    TP_LIGACAO: string; //N(1)            26
    COD_GRUPO_TENSAO: string; //C(2)      27
    CHV_DOCe: string; //C(44)             28
    FIN_DOCe: string; //N(3)              29
    CHV_DOCe_REF: string; //C(44)         30
    IND_DEST: string; //C(3)              31
    COD_MUN_DEST: string; //N(7)          32
    COD_CTA: string; //C                  33
    COD_MOD_DOC_REF: string; //N(2)       34
    HASH_DOC_REF: string; //C(32)         35
    SER_DOC_REF: string; //N(4)           36
    NUM_DOC_REF: string; //N(9)           37
    MES_DOC_REF: string; //N(6)           38
    ENERJ_INJET: Double; //N(X,2)         39
    OUTRAS_DED: Double; //N(X,2)          40


    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistroC500 }

procedure TRegistroC500.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_OPER, 1);
  addCampo(IND_EMIT, 1);
  addCampo(COD_PART);
  addCampo(COD_MOD, 2);
  addCampo(COD_SIT, 2);
  addCampo(SER);
  addCampo(SUB, 0);
  addCampo(COD_CONS, 2);
  addCampo(NUM_DOC, 9);
  addCampo(DT_DOC, 'D');
  addCampo(DT_E_S, 'D');
  addCampo(VL_DOC, 2);
  addCampo(VL_DESC, 2);
  addCampo(VL_FORN, 2);
  addCampo(VL_SERV_NT, 2);
  addCampo(VL_TERC, 2);
  addCampo(VL_DA, 2);
  addCampo(VL_BC_ICMS, 2);
  addCampo(VL_ICMS, 2);
  addCampo(VL_BC_ICMS_ST, 2);
  addCampo(VL_ICMS_ST, 2);
  addCampo(COD_INF);
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);
  addCampo(TP_LIGACAO, 1  );
  addCampo(COD_GRUPO_TENSAO, 2);
  addCampo(CHV_DOCe, 44);
  addCampo(FIN_DOCe, 3);
  addCampo(CHV_DOCe_REF, 44);
  addCampo(IND_DEST, 3);
  addCampo(COD_MUN_DEST, 7);     
  addCampo(COD_CTA, Length(COD_CTA));
  addCampo(COD_MOD_DOC_REF, 33);
  addCampo(HASH_DOC_REF, Length(HASH_DOC_REF));
  addCampo(SER_DOC_REF, 4);
  addCampo(NUM_DOC_REF, 9);
  addCampo(MES_DOC_REF, 6);
  addCampo(ENERJ_INJET, 2);
  addCampo(OUTRAS_DED, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
