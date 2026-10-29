unit RegistroD180;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD180 = Class (TRegistro)
    private
    public
      NUM_SEQ: Integer; //N
      IND_EMIT: String; //C(1)
      CNPJ_EMIT: String; //N(14)
      UF_EMIT: String; //C(2)
      IE_EMIT: String; //C
      COD_MUN_ORIG: Integer; //N(7)
      CNPJ_CPF_TOM: String; //N(14)
      UF_TOM: String; //C(2)
      IE_TOM: String; //C
      COD_MUN_DEST: Integer; //N(7)
      COD_MOD: String; //C(2)
      SER: String; //C
      SUB: Integer; //N
      NUM_DOC: Integer; //N(9)
      DT_DOC: TDate; //N(8)
      VL_DOC: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD180 }

procedure TRegistroD180.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_SEQ, 0);
  addCampo(IND_EMIT, 1);
  addCampo(CNPJ_EMIT, 14);
  addCampo(UF_EMIT, 2);
  addCampo(IE_EMIT);
  addCampo(COD_MUN_ORIG, 7);
  addCampo(CNPJ_CPF_TOM, 14);
  addCampo(UF_TOM, 2);
  addCampo(IE_TOM);
  addCampo(COD_MUN_DEST, 7);
  addCampo(COD_MOD, 2);
  addCampo(SER);
  addCampo(SUB, 0);
  addCampo(NUM_DOC, 9);
  addCampo(DT_DOC, 'D');
  addCampo(VL_DOC, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
