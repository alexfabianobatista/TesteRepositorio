unit PisCofins0110;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TPisCofins0110 = class(TRegistro)
  private
  public
    COD_INC_TRIB: Integer; //N(1)
    IND_APRO_CRED: Integer; //N(1)
    COD_TIPO_CONT: Integer; //N(1)
    IND_REG_CUM: Integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins0110 }

procedure TPisCofins0110.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_INC_TRIB, 1);
  if IND_APRO_CRED > 0 then
    addCampo(IND_APRO_CRED, 1)
  else
    addCampo('', 1);
  if COD_TIPO_CONT > 0 then
    addCampo(COD_TIPO_CONT, 1)
  else
    addCampo('', 1);
  if IND_REG_CUM > 0 then
    addCampo(IND_REG_CUM, 1)
  else
    addCampo('', 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

