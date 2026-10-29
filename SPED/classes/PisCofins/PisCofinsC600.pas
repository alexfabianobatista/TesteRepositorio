unit PisCofinsC600;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC600 = class(TRegistro)
  private
  public
    COD_MOD: string; //C(2)
    COD_MUN: Integer; //C(7)
    SER: string; //C(4)
    SUB: Integer; //N(3)
    COD_CONS: Integer; //N(2)
    QTD_CONS: Integer; //N
    QTD_CANC: Integer; //N
    DT_DOC: TDate; //N(8)
    VL_DOC: Double; //N(X,2)
    VL_DESC: Double; //N(X,2)
    CONS: Integer; //N
    VL_FORN: Double; //N(X,2)
    VL_SERV_NT: Double; //N(X,2)
    VL_TERC: Double; //N(X,2)
    VL_DA: Double; //N(X,2)
    VL_BC_ICMS: Double; //N(X,2)
    VL_ICMS: Double; //N(X,2)
    VL_BC_ICMS_ST: Double; //N(X,2)
    VL_ICMS_ST: Double; //N(X,2)
    VL_PIS: Double; //N(X,2)
    VL_COFINS: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC600 }

procedure TPisCofinsC600.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(COD_MUN, 7);
  addCampo(SER, 4);
  addCampo(SUB, 3);
  addCampo(COD_CONS, 2);
  addCampo(QTD_CONS, 0);
  addCampo(QTD_CANC, 0);
  addCampo(DT_DOC, 'D');
  addCampo(VL_DOC, 2);
  addCampo(VL_DESC, 2);
  addCampo(CONS, 2);
  addCampo(VL_FORN, 2);
  addCampo(VL_SERV_NT, 2);
  addCampo(VL_TERC, 2);
  addCampo(VL_DA, 2);
  addCampo(VL_BC_ICMS, 2);
  addCampo(VL_ICMS, 2);
  addCampo(VL_BC_ICMS_ST, 2);
  addCampo(VL_ICMS_ST, 2);
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
