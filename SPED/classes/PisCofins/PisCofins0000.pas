unit PisCofins0000;

interface

uses Arquivo, Controls, Registro;

type
  TPisCofins0000 = class(TRegistro)
  private
  public
    COD_VER: Integer; //N(3)
    TIPO_ESCRIT: Integer; //N(1)
    IND_SIT_ESP: Integer; //N(1)
    NUM_REC_ANTERIOR: string; //C(41)
    DT_INI: TDate; //N(8)
    DT_FIN: TDate; //N(8)
    NOME: string; //C(100)
    CNPJ: string; //N(14)
    UF: string; //C(2)
    COD_MUN: Integer; //N(7)
    SUFRAMA: string; //C(9)
    IND_NAT_PJ: Integer; //N(2)
    IND_ATIV: Integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0000 }

procedure TPisCofins0000.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_VER, 3);
  addCampo(TIPO_ESCRIT, 1);
  addCampo(IND_SIT_ESP, 1);
  addCampo(NUM_REC_ANTERIOR, 41);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIN, 'D');
  addCampo(NOME);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(UF, 2);
  addCampo(COD_MUN, 7);
  addCampo(SUFRAMA, 9);
  addCampo(IND_NAT_PJ, 2);
  addCampo(IND_ATIV, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

