unit PisCofinsF100;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsF100 = class(TRegistro)
  private
  public
    IND_OPER: string; //C(1)
    COD_PART: string; //C(60)
    COD_ITEM: string; //C(60)
    DT_OPER: TDate; //N(8)
    VL_OPER: Double; //N(X,2)
    CST_PIS: Integer; //N(2)
    VL_BC_PIS: Double; //N(X,4)
    ALIQ_PIS: Double; //N(8,4)
    VL_PIS: Double; //N(X,2)
    CST_COFINS: Integer; //N(2)
    VL_BC_COFINS: Double; //N(X,4)
    ALIQ_COFINS: Double; //N(8,4)
    VL_COFINS: Double; //N(X,2)
    NAT_BC_CRED: string; //C(2)
    IND_ORIG_CRED: string; //C(1)
    COD_CTA: string; //C(60)
    COD_CCUS: string; //C(60)
    DESC_DOC_OPER: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsF100 }

procedure TPisCofinsF100.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_OPER, 1);
  addCampo(COD_PART, 60);
  addCampo(COD_ITEM, 60);
  addCampo(DT_OPER, 'D');
  addCampo(VL_OPER, 2);
  addCampo(CST_PIS, 2);
  addCampo(VL_BC_PIS, 4);
  addCampo(ALIQ_PIS, 8, 4);
  addCampo(VL_PIS, 2);
  addCampo(CST_COFINS, 2);
  addCampo(VL_BC_COFINS, 4);
  addCampo(ALIQ_COFINS, 8, 4);
  addCampo(VL_COFINS, 2);
  addCampo(NAT_BC_CRED, 2);
  addCampo(IND_ORIG_CRED, 1);
  addCampo(COD_CTA, 60);
  addCampo(COD_CCUS, 60);
  addCampo(DESC_DOC_OPER);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
