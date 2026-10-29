unit PisCofins0100;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TPisCofins0100 = class(TRegistro)
  private
  public
    NOME: string; //C(100)
    CPF: string; //N(11)
    CRC: string; //C(11)
    CNPJ: string; //N(14)
    CEP: string; //N(8)
    END_: string; //C(60)
    NUM: Integer; //C
    COMPL: string; //C(60)
    BAIRRO: string; //C(60)
    FONE: string; //C(10)
    FAX: string; //C(10)
    EMAIL: string; //C
    COD_MUN: Integer; //N(7)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins0100 }

procedure TPisCofins0100.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NOME, 100);
  addCampo(SomenteNumeros(CPF), 11);
  addCampo(CRC, 11);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(SomenteNumeros(CEP), 8);
  addCampo(END_, 60);
  addCampo(NUM, 0);
  addCampo(COMPL, 60);
  addCampo(BAIRRO, 60);
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

