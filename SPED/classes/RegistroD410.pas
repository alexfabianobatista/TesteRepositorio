unit RegistroD410;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD410 = Class (TRegistro)
    private
    public
      COD_MOD: String; //C(2)
      SER: String; //C
      SUB: Integer; //N
      NUM_DOC_INI: Integer; //N
      NUM_DOC_FIN: Integer; //N
      DT_DOC: TDate; //N(8)
      CST_ICMS: Integer; //N(3)
      CFOP: Integer; //N(4)
      ALIQ_ICMS: Double; //N(X,2)
      VL_OPR: Double; //N(X,2)
      VL_DESC: Double; //N(X,2)
      VL_SERV: Double; //N(X,2)
      VL_BC_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD410 }

procedure TRegistroD410.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(SER);
  addCampo(SUB, 0);
  addCampo(NUM_DOC_INI, 0);
  addCampo(NUM_DOC_FIN, 0);
  addCampo(DT_DOC, 'D');
  addCampo(CST_ICMS, 3);
  addCampo(CFOP, 4);
  addCampo(ALIQ_ICMS, 2);
  addCampo(VL_OPR, 2);
  addCampo(Vl_DESC, 2);
  addCampo(Vl_SERV, 2);
  addCampo(Vl_BC_ICMS, 2);
  addCampo(Vl_ICMS, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
