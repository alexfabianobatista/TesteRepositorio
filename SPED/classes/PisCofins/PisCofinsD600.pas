unit PisCofinsD600;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsD600 = class(TRegistro)
  private
  public
    COD_MOD: string; //C(2)
    COD_MUN: Integer; //N(7)
    SER: string; //C(4)
    SUB: Integer; //N(3)
    IND_REC: Integer; //N(1)
    QTD_CONS: Integer; //N
    DT_DOC_INI: TDate; //N(8)
    DT_DOC_FIN: TDate; //N(8)
    VL_DOC: Double; //N(X,2)
    VL_DESC: Double; //N(X,2)
    VL_SERV: Double; //N(X,2)
    VL_SERV_NT: Double; //N(X,2)
    VL_TERC: Double; //N(X,2)
    VL_DA: Double; //N(X,2)
    VL_BC_ICMS: Double; //N(X,2)
    VL_ICMS: Double; //N(X,2)
    VL_PIS: Double; //N(X,2)
    VL_COFINS: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsD600 }

procedure TPisCofinsD600.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(COD_MUN, 7);
  addCampo(SER, 4);
  addCampo(SUB, 3);
  addCampo(IND_REC, 1);
  addCampo(QTD_CONS, 0);
  addCampo(DT_DOC_INI, 'D');
  addCampo(DT_DOC_FIN, 'D');
  addCampo(VL_DOC, 2);
  addCampo(VL_DESC, 2);
  addCampo(VL_SERV, 2);
  addCampo(VL_SERV_NT, 2);
  addCampo(VL_TERC, 2);
  addCampo(VL_DA, 2);
  addCampo(VL_BC_ICMS, 2);
  addCampo(VL_ICMS, 2);
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
