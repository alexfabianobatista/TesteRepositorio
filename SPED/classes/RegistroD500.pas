unit RegistroD500;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD500 = Class (TRegistro)
    private
    public
      IND_OPER: String; //C(1)
      IND_EMIT: String; //C(1)
      COD_PART: Integer; //N
      COD_MOD: String; //C(2)
      COD_SIT: Integer; //C(2)
      SER: String; //C
      SUB: Integer; //N
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
      COD_CTA: String; //C
      TP_ASSINANTE :Integer; //N(1)
      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD500 }

procedure TRegistroD500.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_OPER, 1);
  addCampo(IND_EMIT, 1);
  addCampo(COD_PART, 0);
  addCampo(COD_MOD, 2);
  addCampo(COD_SIT, 2);
  addCampo(SER);
  addCampo(SUB, 0);
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
  addCampo(COD_INF);
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA);
  addCampo(TP_ASSINANTE, 1);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
