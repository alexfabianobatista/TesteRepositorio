unit FCont0000;

interface

uses Arquivo, Controls, Registro;

type

  TFCont0000 = class(TRegistro)
  private
  public
    ID_ARQ: string; //C(4)
    DT_INI: TDate; //N(8)
    DT_FIN: TDate; //N(8)
    NOME: string; //C
    CNPJ: string; //N(14)
    UF: string; //C(2)
    IE: string; //C
    COD_MUN: Integer; //N(7)
    IM: string; //C
    IND_SIT_ESP: Integer; //N(1)
    IND_SIT_INI_PER: Integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFCont0000 }

procedure TFCont0000.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(ID_ARQ, 4);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIN, 'D');
  addCampo(NOME);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(UF, 2);
  addCampo(SomenteNumeros(IE));
  addCampo(COD_MUN, 7);
  addCampo(IM);
  addCampo(IND_SIT_ESP, 0);
  addCampo(IND_SIT_INI_PER, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

