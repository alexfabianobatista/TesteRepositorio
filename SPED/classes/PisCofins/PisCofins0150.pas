unit PisCofins0150;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins0150 = class(TRegistro)
  private
  public
    COD_PART: string; //C(60)
    NOME: string; //C(100)
    COD_PAIS: Integer; //N(5)
    CNPJ: string; //N(14)
    CPF: string; //N(11)
    IE: string; //C(14)
    COD_MUN: string; //N(7)
    SUFRAMA: string; //C(9)
    END_: string; //C(60)
    NUM: Integer; //C
    COMPL: string; //C(60)
    BAIRRO: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins0150 }

procedure TPisCofins0150.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_PART, 60);
  addCampo(NOME, 100);
  addCampo(COD_PAIS, 5);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(SomenteNumeros(CPF), 11);
  addCampo(SomenteNumeros(IE), 14);
  addCampo(COD_MUN, 7);
  addCampo(SUFRAMA, 9);
  addCampo(END_, 60);
  addCampo(NUM, 0);
  addCampo(COMPL, 60);
  addCampo(BAIRRO, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
