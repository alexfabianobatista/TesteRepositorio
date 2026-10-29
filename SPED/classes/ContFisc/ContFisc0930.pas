unit ContFisc0930;

interface

uses Arquivo, Controls, Registro;

type
  TContFisc0930 = Class(TRegistro)
  private

  public
    IDENT_NOM: String;
    IDENT_CPF_CNPJ: String;
    IDENT_QUALIF: String; //C(3)
    IND_CRC: String;
    EMAIL: String; //C(60)
    FONE: String; //C(14)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFisc0930.grava;
begin

  inherited

  addCampo(bloco + registro);
  addCampo(IDENT_NOM);
  addCampo(SomenteNumeros(IDENT_CPF_CNPJ));
  addCampo(IDENT_QUALIF);
  addCampo(SomenteNumeros(IND_CRC));
  addCampo(EMAIL);
  addCampo(FONE);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;

end;

end.
