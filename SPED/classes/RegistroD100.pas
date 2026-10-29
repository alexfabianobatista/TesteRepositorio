unit RegistroD100;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD100 = Class (TRegistro)
    private
    public
      IND_OPER: String; //C(1)
      IND_EMIT: String; //C(1)
      COD_PART: String; //C
      COD_MOD: String; //C(2)
      COD_SIT: Integer; //N(2)
      SER: String; //C
      SUB: String; //N
      NUM_DOC: Integer; //N
      CHV_CTE: String; //N(44)
      DT_DOC: TDate; //N(8)
      DT_A_P: TDate; //N(8)
      TP_CT_e: String; //N(1)
      CHV_CTE_REF: String; //N(44)
      VL_DOC: Double; //N(X,2)
      VL_DESC: Double; //N(X,2)
      IND_FRT: String; //C(1)
      VL_SERV: Double; //N(X,2)
      VL_BC_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)
      VL_NT: Double; //N(X,2)
      COD_INF: String; //C
      VL_PIS: Double; //N(X,2)
      VL_COFINS: Double; //N(X,2)
      COD_CTA: String; //C
      COD_MUN_ORIG: String; //C
      COD_MUN_DEST: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD100 }

procedure TRegistroD100.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_OPER, 1);
  addCampo(IND_EMIT, 1);
  addCampo(COD_PART);
  addCampo(COD_MOD, 2);
  addCampo(COD_SIT, 2);
  addCampo(SER);
  addCampo('');
  addCampo(NUM_DOC, 0);
  addCampo(CHV_CTE, 44);
  addCampo(DT_DOC, 'D');
  addCampo(DT_A_P, 'D');
  if TP_CT_e <> '' then
    addCampo(TP_CT_e, 1)
  else
    addCampo(TP_CT_e, 0);
  addCampo(CHV_CTE_REF, 44);
  if VL_DOC = 0 then
    addCampo(VL_DOC, '')
  else
    addCampo(VL_DOC, 2);
  if VL_DESC = 0 then
    addCampo(VL_DESC, '')
  else
    addCampo(VL_DESC, 2);
  addCampo(IND_FRT, 1);
  if VL_SERV = 0 then
    addCampo(VL_SERV, '')
  else
    addCampo(VL_SERV, 2);
  if VL_BC_ICMS = 0 then
    addCampo(VL_BC_ICMS, '')
  else
    addCampo(VL_BC_ICMS, 2);
  if VL_ICMS = 0 then
    addCampo(VL_ICMS, '')
  else
    addCampo(VL_ICMS, 2);
  if VL_NT = 0 then
    addCampo(VL_NT, '')
  else
    addCampo(VL_NT, 2);
  addCampo(COD_INF);
  addCampo(COD_CTA);
  if COD_MUN_ORIG <> '' then
    addCampo(COD_MUN_ORIG, 7)
  else
    addCampo('');
  if COD_MUN_DEST <> '' then
    addCampo(COD_MUN_DEST, 7)
  else
    addCampo('');

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
