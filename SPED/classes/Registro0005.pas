unit Registro0005;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TRegistro0005 = Class (TRegistro)
    private
    public
      FANTASIA: String; //C
      CEP: String; //N(8)
      END_: String; //C
      NUM: Integer; //C
      COMPL: String; //C
      BAIRRO: String; //C
      FONE: String; //C(10)
      FAX: String; //C(10)
      EMAIL: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes, UBiblioteca;

{ TRegistro0005 }

procedure TRegistro0005.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(FANTASIA);
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
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
