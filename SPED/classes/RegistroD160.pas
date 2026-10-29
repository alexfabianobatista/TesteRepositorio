unit RegistroD160;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD160 = Class (TRegistro)
    private
    public
      CNPJ_CPF_REM: String; //C(14)
      UF_REM: String; //C(2)
      IE_REM: String; //C
      CNPJ_CPF_DEST: String; //C(14)
      UF_DEST: String; //C(2)
      IE_DEST: String; //C
      COD_MOD: String; //C(2)
      SER: String; //C
      NUM_DOC: Integer; //N(9)
      DT_DOC: TDate; //N(8)
      CHV_NFE: String; //C(44)
      VL_DOC: Double; //N(X,2)
      VL_MERC: Double; //N(X,2)
      QTD_VOL: Integer; //N
      PESO_BRT: Double; //N(X,2)
      PESO_LIQ: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD160 }

procedure TRegistroD160.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(CNPJ_CPF_REM, 14);
  addCampo(UF_REM, 2);
  addCampo(IE_REM);
  addCampo(CNPJ_CPF_DEST, 14);
  addCampo(UF_DEST, 2);
  addCampo(IE_DEST);
  addCampo(COD_MOD, 2);
  addCampo(SER);
  addCampo(NUM_DOC, 9);
  addCampo(DT_DOC, 'D');
  addCampo(CHV_NFE, 44);
  addCampo(VL_DOC, 2);
  addCampo(VL_MERC, 2);
  addCampo(QTD_VOL, 0);
  addCampo(PESO_BRT, 2);
  addCampo(PESO_LIQ, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
