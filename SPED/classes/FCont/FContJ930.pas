unit FContJ930;

interface

uses Arquivo, Registro, Controls;

type
  TFContJ930 = class(TRegistro)
  private
  public
    IDENT_NOM: string; //C
    IDENT_CPF_CNPJ: string; //N
    IDENT_QUALIF: string; //C
    COD_ASSIN: string; //C(3)
    IND_CRC: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContJ930 }

procedure TFContJ930.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IDENT_NOM);
  addCampo(SomenteNumeros(IDENT_CPF_CNPJ), 14);
  addCampo(IDENT_QUALIF);
  addCampo(COD_ASSIN, 3);
  addCampo(IND_CRC, 11);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
