unit PisCofinsC100;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC100 = Class (TRegistro)
    private
    public
      IND_OPER: Integer; //C(1)
      IND_EMIT: Integer; //C(1)
      COD_PART: String; //C(60)
      COD_MOD: String; //C(2)
      COD_SIT: String; //N(2)
      SER: String; //C(3)
      NUM_DOC: Integer; //N(9)
      CHV_NFE: String; //N(44)
      DT_DOC: TDate; //N(8)
      DT_E_S: TDate; //N(8)
      VL_DOC: Double; //N(X,2)
      IND_PGTO: Integer; //C(1)
      VL_DESC: Double; //N(X,2)
      VL_ABAT_NT: Double; //N(X,2)
      VL_MERC: Double; //N(X,2)
      IND_FRT: Integer; //C(1)
      VL_FRT: Double; //N(X,2)
      VL_SEG: Double; //N(X,2)
      VL_OUT_DA: Double; //N(X,2)
      VL_BC_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)
      VL_BC_ICMS_ST: Double; //N(X,2)
      VL_ICMS_ST: Double; //N(X,2)
      VL_IPI: Double; //N(X,2)
      VL_PIS: Double; //N(X,2)
      VL_COFINS: Double; //N(X,2)
      VL_PIS_ST: Double; //N(X,2)
      VL_COFINS_ST: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes, Dialogs;

{ TPisCofinsC100 }

procedure TPisCofinsC100.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_OPER, 1);
  addCampo(IND_EMIT, 1);
  if (COD_SIT <> '02') then
    addCampo(COD_PART, 60)
  else
    addCampo('');
  addCampo(COD_MOD, 2);
  addCampo(COD_SIT, 2);
  addCampo(SER, 3);
  addCampo(NUM_DOC, 9);
  addCampo(CHV_NFE, 44);
  if (COD_SIT <> '02') then
  Begin
    addCampo(DT_DOC, 'D');
    addCampo(DT_E_S, 'D');
    addCampo(VL_DOC, 2);
    addCampo(IND_PGTO, 1);
    addCampo(VL_DESC, 2);
    addCampo(VL_ABAT_NT, 2);
    addCampo(VL_MERC, 2);
    addCampo(IND_FRT, 1);
    addCampo(VL_FRT, 2);
    addCampo(VL_SEG, 2);
    addCampo(VL_OUT_DA, 2);
    addCampo(VL_BC_ICMS, 2);
    addCampo(VL_ICMS, 2);
    addCampo(VL_BC_ICMS_ST, 2);
    addCampo(VL_ICMS_ST, 2);
    addCampo(VL_IPI, 2);
    addCampo(VL_PIS, 2);
    addCampo(VL_COFINS, 2);
    addCampo(VL_PIS_ST, 2);
    addCampo(VL_COFINS_ST, 2);
  End
  Else
  Begin
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
    addCampo('');
  End;
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end. 
