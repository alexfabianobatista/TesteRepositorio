unit PisCofinsF200;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsF200 = class(TRegistro)
  private
  public
    IND_OPER: Integer; //N(2)
    UNID_IMOB: Integer; //N(2)
    IDENT_EMP: string; //C
    DESC_UNID_IMOB: string; //C(90)
    NUM_CONT: string; //C(90)
    CPF_CNPJ_ADQU: string; //C(14)
    DT_OPER: TDate; //N(8)
    VL_TOT_VEND: Double; //N(X,2)
    VL_REC_ACUM: Double; //N(X,2)
    VL_TOT_REC: Double; //N(X,2)
    CST_PIS: Integer; //N(2)
    VL_BC_PIS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(8,4)
    VL_PIS: Double; //N(X,2)
    CST_COFINS: Integer; //N(2)
    VL_BC_COFINS: Double; //N(X,2)
    ALIQ_COFINS: Double; //N(8,4)
    VL_COFINS: Double; //N(X,2)
    PERC_REC_RECEB: Double; //N(6,2)
    IND_NAT_EMP: Integer; //N(1)
    INF_COMP: string; //C(90)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsF200.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_OPER, 2);
  addCampo(UNID_IMOB, 2);
  addCampo(IDENT_EMP);
  addCampo(DESC_UNID_IMOB, 90);
  addCampo(NUM_CONT, 90);
  if Length(SomenteNumeros(CPF_CNPJ_ADQU)) > 11 then
    addCampo(SomenteNumeros(CPF_CNPJ_ADQU), 14)
  else
    addCampo(SomenteNumeros(CPF_CNPJ_ADQU), 11);
  addCampo(DT_OPER, 'D');
  addCampo(VL_TOT_VEND, 2);
  addCampo(VL_REC_ACUM, 2);
  addCampo(VL_TOT_REC, 2);
  addCampo(CST_PIS, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS, 8, 4);
  addCampo(VL_PIS, 2);
  addCampo(CST_COFINS, 2);
  addCampo(VL_BC_COFINS, 2);
  addCampo(ALIQ_COFINS, 8, 4);
  addCampo(VL_COFINS, 2);
  addCampo(PERC_REC_RECEB, 6, 2);
  addCampo(IND_NAT_EMP, 1);
  addCampo(INF_COMP, 90);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
