unit PisCofins1501;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins1501 = class(TRegistro)
  private
  public
    COD_PART: string; //C(60)
    COD_ITEM: string; //C(60)
    COD_MOD: string; //C(2)
    SER: string; //C(4)
    SUB_SER: string; //C(3)
    NUM_DOC: Integer; //N(9)
    DT_OPER: TDate; //N(8)
    CHV_NFE: string; //N(44)
    VL_OPER: Double; //N(X,2)
    CFOP: Integer; //N(4)
    NAT_BC_CRED: string; //C(2)
    IND_ORIG_CRED: string; //C(1)
    CST_COFINS: Integer; //N(2)
    VL_BC_COFINS: Double; //N(X,3)
    ALIQ_COFINS: Double; //N(X,4)
    VL_COFINS: Double; //N(X,2)
    COD_CTA: string; //C(60)
    COD_CCUS: string; //C(60)
    DESC_COMPL: string; //C
    PER_ESCRIT: Integer; //N(6)
    CNPJ: string; //N(14)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins1501 }

procedure TPisCofins1501.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_PART, 60);
  addCampo(COD_ITEM, 60);
  addCampo(COD_MOD, 2);
  addCampo(SER, 4);
  addCampo(SUB_SER, 3);
  addCampo(NUM_DOC, 9);
  addCampo(DT_OPER, 'D');
  addCampo(CHV_NFE, 44);
  addCampo(VL_OPER, 2);
  addCampo(CFOP, 4);
  addCampo(NAT_BC_CRED, 2);
  addCampo(IND_ORIG_CRED, 1);
  addCampo(CST_COFINS, 2);
  addCampo(VL_BC_COFINS, 3);
  addCampo(ALIQ_COFINS, 4);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA, 60);
  addCampo(COD_CCUS, 60);
  addCampo(DESC_COMPL);
  addCampo(PER_ESCRIT, 6);
  addCampo(SomenteNumeros(CNPJ), 14);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
