unit PisCofins0200;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TPisCofins0200 = Class (TRegistro)
    private
    public
      COD_ITEM: String; //C(60)
      DESCR_ITEM: String; //C
      COD_BARRA: String; //C
      COD_ANT_ITEM: String; //C(60)
      UNID_INV: String; //C(6)
      TIPO_ITEM: String; //N(2)
      COD_NCM: String; //C(8)
      EX_IPI: String; //C(3)
      COD_GEN: Integer; //N(2)
      COD_LST: Integer; //N(4)
      ALIQ_ICMS: Double; //N(6,2)
      IND_TIPO_PRODUTO: String;

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TPisCofins0200 }

procedure TPisCofins0200.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_ITEM, 60);
  addCampo(DESCR_ITEM);
  addCampo(COD_BARRA);
  addCampo(COD_ANT_ITEM, 60);
  addCampo(UNID_INV, 6);
  addCampo(TIPO_ITEM, 2);
  if IND_TIPO_PRODUTO = 'SERVIÇO' then
    addCampo(COD_NCM, 2)
  else
    addCampo(COD_NCM, 8);
  addCampo(EX_IPI, 3);
  addCampo(COD_GEN, 2);
  if COD_LST > 0 then
    addCampo(COD_LST, Length(IntToStr(COD_LST)))
  else
    addCampo('');
  addCampo(ALIQ_ICMS, 3, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
