unit RegistroD300;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD300 = Class (TRegistro)
    private
    public
      COD_MOD: String; //C(2)
      SER: String; //C
      SUB: Integer; //N
      NUM_DOC_INI: Integer; //N
      NUM_DOC_FIN: Integer; //N
      CST_ICMS: Integer; //N(3)
      CFOP: Integer; //N(4)
      ALIQ_ICMS: Double; //N(X,2)
      DT_DOC: TDate; //N(8)
      VL_OPR: Double; //N(X,2)
      VL_DESC: Double; //N(X,2)
      VL_SERV: Double; //N(X,2)
      VL_SEG: Double; //N(X,2)
      VL_OUT_DESP: Double; //N(X,2)
      VL_BC_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)
      VL_RED_BC: Double; //N(X,2)
      COD_OBS: String; //C
      COD_CTA: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD300 }

procedure TRegistroD300.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(SER);
  addCampo(SUB, 0);
  addCampo(NUM_DOC_INI, 0);
  addCampo(NUM_DOC_FIN, 0);
  addCampo(CST_ICMS, 3);
  addCampo(CFOP, 4);
  addCampo(ALIQ_ICMS, 2);
  addCampo(DT_DOC, 'D');
  addCampo(VL_OPR, 2);
  addCampo(VL_DESC, 2);
  addCampo(VL_SERV, 2);
  addCampo(VL_SEG, 2);
  addCampo(VL_OUT_DESP, 2);
  addCampo(VL_BC_ICMS, 2);
  addCampo(VL_ICMS, 2);
  addCampo(VL_RED_BC, 2);
  addCampo(COD_OBS);
  addCampo(COD_CTA);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
