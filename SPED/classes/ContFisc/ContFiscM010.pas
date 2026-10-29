unit ContFiscM010;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscM010 = class(TRegistro)
  private

  public
    COD_CTA_B: String; //C
    DESC_CTA_LAL: String; //C
    DT_AP_LAL: TDate; //C(8)
    COD_LAN_ORIG: Integer; //N(6)
    DESC_LAN_ORIG: String; //C
    DT_LIM_LAL: TDate; //C(8)
    COD_TRIBUTO: String; //C(1)
    VL_SALDO_INI: Double; //N(19,2)
    IND_VL_SALDO_INI: String; //C(1)
    CNPJ_SIT_ESP: String; //N(14)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscM010.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(DESC_CTA_LAL);
  addCampo(DT_AP_LAL, 'D');
  addCampo(COD_LAN_ORIG, 6);
  addCampo(DESC_LAN_ORIG);
  addCampo(DT_LIM_LAL, 'D');
  addCampo(COD_TRIBUTO);
  addCampo(VL_SALDO_INI, 2);
  addCampo(IND_VL_SALDO_INI);
  addCampo(CNPJ_SIT_ESP);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
