unit Registro0150;

interface

uses Arquivo, Registro, Controls;

type
  TFiscal0150 = Class (TRegistro)
    private
    public
      COD_PART: String; //C
      NOME: String; //C
      COD_PAIS: Integer; //N(5)
      CNPJ: String; //N(14)
      CPF: String; //N(11)
      IE: String; //C
      COD_MUN: Integer; //N(7)
      SUFRAMA: String; //C(9)
      END_: String; //C
      NUM: Integer; //C
      COMPL: String; //C
      BAIRRO: String; //C

      procedure grava;
    end;

  TContabil0150 = Class (TRegistro)
    private
    public
      COD_PART: String; //C
      NOME: String; //C
      COD_PAIS: Integer; //N(5)
      CNPJ: String; //N(14)
      CPF: String; //N(11)
      NIT: String; //N(11)
      UF: String; //C(2)
      IE: String; //C
      IE_ST: String; //C
      COD_MUN: Integer; //N(7)
      IM: String; //C
      SUFRAMA: String; //C(9)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TFiscal0150 }

procedure TFiscal0150.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_PART);
  addCampo(NOME);
  addCampo(COD_PAIS, 5);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(SomenteNumeros(CPF), 11);
  addCampo(SomenteNumeros(IE));
  addCampo(COD_MUN, 0);
  addCampo(SUFRAMA, 9);
  addCampo(END_);
  addCampo(NUM, 0);
  addCampo(COMPL);
  addCampo(BAIRRO);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

procedure TContabil0150.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_PART);
  addCampo(NOME);
  addCampo(COD_PAIS, 5);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(SomenteNumeros(CPF), 11);
  addCampo(SomenteNumeros(NIT), 11);
  addCampo(UF, 2);
  addCampo(SomenteNumeros(IE));
  addCampo(IE_ST);
  addCampo(COD_MUN, 0);
  addCampo(IM);
  addCampo(SUFRAMA, 9);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
