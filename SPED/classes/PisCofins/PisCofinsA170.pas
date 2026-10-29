unit PisCofinsA170;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsA170 = class(TRegistro)
  private
  public
    NUM_ITEM: Integer; //N(3)
    COD_ITEM: string; //C(60)
    DESCR_COMPL: string; //C
    VL_ITEM: Double; //N(X,2)
    VL_DESC: Double; //N(X,2)
    NAT_BC_CRED: string; //C(2)
    IND_ORIG_CRED: string; //C(1)
    CST_PIS: String; //C(2)
    VL_BC_PIS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(X,2)
    VL_PIS: Double; //N(X,2)
    CST_COFINS: string; //C(2)
    VL_BC_COFINS: Double; //N(X,2)
    ALIQ_COFINS: Double; //N(X,2)
    VL_COFINS: Double; //N(X,2)
    COD_CTA: string; //C(60)
    COD_CCUS: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsA170.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_ITEM, 3);
  addCampo(COD_ITEM, 60);
  addCampo(DESCR_COMPL);
  addCampo(VL_ITEM, 2);
  addCampo(VL_DESC, 2);
  addCampo(NAT_BC_CRED, 2);
  addCampo(IND_ORIG_CRED, 1);
  addCampo(CST_PIS, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS, 2);
  addCampo(VL_PIS, 2);
  addCampo(CST_COFINS, 2);
  addCampo(VL_BC_COFINS, 2);
  addCampo(ALIQ_COFINS, 2);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA, 60);
  addCampo(COD_CCUS, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
