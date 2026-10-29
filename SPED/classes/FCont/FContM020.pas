unit FContM020;

interface

uses Arquivo, Registro, Controls;

type
  TFContM020 = class(TRegistro)
  private
  public
    QUALI_PJ: string; //C(2)
    TIPO_ESCRIT: Integer; //N(1)
    NRO_REC_ANTERIOR: string; //C(41)
    ID_ESCR_PER_ANT: string; //C(40)
    SIT_SLD_PER_ANT: string; //C(1)
    IND_LCTO_INI_SLD: Integer; //N(1)
    FORM_APUR: string; //C(1)
    FORM_TRIBUT: string; //N(1)
    TRIM_LUC_ARB: string; //C(4)
    FORM_TRIB_TRI: string; //C(4)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContM020 }

procedure TFContM020.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QUALI_PJ, 2);
  addCampo(TIPO_ESCRIT, 1);
  addCampo(NRO_REC_ANTERIOR, 41);
  addCampo(ID_ESCR_PER_ANT, 40);
  addCampo(SIT_SLD_PER_ANT, 1);
  addCampo(IND_LCTO_INI_SLD, 1);
  addCampo(FORM_APUR, 1);
  addCampo(FORM_TRIBUT, 1);
  addCampo(TRIM_LUC_ARB, 4);
  addCampo(FORM_TRIB_TRI, 4);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
