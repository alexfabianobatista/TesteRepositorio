unit Registro0100;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TRegistro0100 = Class (TRegistro)
    private
    public
      NOME: String; //C
      CPF: String; //N(11)
      CRC: String; //C(11)
      CNPJ: String; //N(14)
      CEP: String; //N(8)
      END_: String; //C
      NUM: Integer; //C
      COMPL: String; //C
      BAIRRO: String; //C
      FONE: String; //C(10)
      FAX: String; //C(10)
      EMAIL: String; //C
      COD_MUN: Integer; //N(7)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0100 }

procedure TRegistro0100.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NOME);
  addCampo(SomenteNumeros(CPF), 11);
  addCampo(CRC, 11);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(SomenteNumeros(CEP), 8);
  addCampo(END_);
  addCampo(NUM, 0);
  addCampo(COMPL);
  addCampo(BAIRRO);
  if SomenteNumeros(FONE) = '' then
    addCampo('')
  else
    addCampo(FormatFloat('0000000000', StrToInt64(SomenteNumeros(FONE))), 10);
  if SomenteNumeros(FAX) = '' then
    addCampo('')
  else
    addCampo(FormatFloat('0000000000', StrToInt64(SomenteNumeros(FAX))), 10);
  addCampo(EMAIL);
  addCampo(COD_MUN, 7);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
