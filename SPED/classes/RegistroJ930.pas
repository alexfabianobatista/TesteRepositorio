unit RegistroJ930;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroJ930 = Class (TRegistro)
    private
    public
      IDENT_NOM: String; //C
      IDENT_CPF: String; //N(11)
      IDENT_QUALIF: String; //C
      COD_ASSIM: String; //C(3)
      IND_CRC: String; //C(11)
      EMAIL: String; //C(60)
      FONE: String; //C(11)
      UF_CRC: String; //C(2)
      NUM_SEQ_CRC: String;
      DT_CRC: String; //C(8)
      IND_RESP_LEGAL: String; //C(1)


      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroJ930 }

procedure TRegistroJ930.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IDENT_NOM);
  addCampo(SomenteNumeros(IDENT_CPF), 11);
  addCampo(IDENT_QUALIF);
  addCampo(COD_ASSIM, 3);
  addCampo(IND_CRC, 11);
  addCampo(EMAIL);
  addCampo(FONE, 11);
  addCampo(UF_CRC, 2);
  addCampo(NUM_SEQ_CRC);
  addCampo(DT_CRC);
  addCampo(IND_RESP_LEGAL);

  gravaLinha(arquivoPadrao, TRegistro(Self));

  afterGravacao;
end;

end.
