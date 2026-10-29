unit PisCofinsD300;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsD300 = class(TRegistro)
  private
  public
    COD_MOD: string; //C(2)
    SER: string; //C(4)
    SUB: Integer; //N(3)
    NUM_DOC_INI: Integer; //N(3)
    NUM_DOC_FIN: Integer; //N(6)
    CFOP: Integer; //N(4)
    DT_REF: TDate; //N(8)
    VL_DOC: Double; //N(X,2)
    VL_DESC: Double; //N(X,2)
    CST_PIS: Integer; //N(2)
    VL_BC_PIS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(8,4)
    VL_PIS: Double; //N(X,2)
    CST_COFINS: Integer; //N(2)
    VL_BC_COFINS: Double; //N(X,2)
    ALIQ_COFINS: Double; //N(8,4)
    VL_COFINS: Double; //N(X,2)
    COD_CTA: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsD300 }

procedure TPisCofinsD300.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(SER, 4);
  addCampo(SUB, 3);
  addCampo(NUM_DOC_INI, 3);
  addCampo(NUM_DOC_FIN, 6);
  addCampo(CFOP, 4);
  addCampo(DT_REF, 'D');
  addCampo(VL_DOC, 2);
  addCampo(VL_DESC, 2);
  addCampo(CST_PIS, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(ALIQ_PIS, 8, 4);
  addCampo(VL_PIS, 2);
  addCampo(CST_COFINS, 2);
  addCampo(VL_BC_COFINS, 2);
  addCampo(ALIQ_COFINS, 8, 4);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
