unit PisCofins0140;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TPisCofins0140 = class(TRegistro)
  private
  public
    COD_EST: string; //C(60)
    NOME: string; //C(100)
    CNPJ: string; //N(14)
    UF: string; //C(2)
    IE: string; //C(14)
    COD_MUN: Integer; //N(7)
    IM: string; //C
    SUFRAMA: string; //C(9)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins0140 }

procedure TPisCofins0140.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_EST, 60);
  addCampo(NOME, 100);
  addCampo(SomenteNumeros(CNPJ), 14);
  addCampo(UF, 2);
  addCampo(SomenteNumeros(IE), 14);
  addCampo(COD_MUN, 7);
  addCampo(IM);
  addCampo(SUFRAMA, 9);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

