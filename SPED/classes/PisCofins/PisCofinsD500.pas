unit PisCofinsD500;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsD500 = Class (TRegistro)
    private
    public
      IND_OPER: String; //C(1)
      IND_EMIT: String; //C(1)
      COD_PART: String; //C(60)
      COD_MOD: String; //C(2)
      COD_SIT: Integer; //C(2)
      SER: String; //C(4)
      SUB: Integer; //N(3)
      NUM_DOC: Integer; //N(9)
      DT_DOC : TDate; //N(8)
      DT_A_P: TDate; //N(8)
      VL_DOC: Double; //N(X,2)
      VL_DESC: Double; //N(X,2)
      VL_SERV: Double; //N(X,2)
      VL_SERV_NT: Double; //N(X,2)
      VL_TERC: Double; //N(X,2)
      VL_DA: Double; //N(X,2)
      VL_BC_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)
      COD_INF: String; //C
      VL_PIS: Double; //N(X,2)
      VL_COFINS: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TPisCofinsD500 }

procedure TPisCofinsD500.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_OPER, 1);
  addCampo(IND_EMIT, 1);
  addCampo(COD_PART);
  addCampo(COD_MOD, 2);
  addCampo(COD_SIT, 2);
  addCampo(SER, 4);
  addCampo(SUB, 3);
  addCampo(NUM_DOC, 9);
  addCampo(DT_DOC, 'D');
  addCampo(DT_A_P, 'D');
  addCampo(VL_DOC, 2);
  addCampo(VL_DESC, 2);
  addCampo(VL_SERV, 2);
  addCampo(VL_SERV_NT, 2);
  addCampo(VL_TERC, 2);
  addCampo(VL_DA, 2);
  addCampo(VL_BC_ICMS, 2);
  addCampo(VL_ICMS, 2);
  if COD_INF <> '0' then
    addCampo(COD_INF)
  else
    addCampo('');
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
