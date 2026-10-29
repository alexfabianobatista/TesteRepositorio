unit RegistroD140;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD140 = class(TRegistro)
  private
  public
    COD_PART_CONSG: string; //C
    COD_MUN_ORIG: Integer; //C(7)
    COD_MUN_DEST: Integer; //C(7)
    IND_VEIC: string; //C(1)
    VEIC_ID: string; //C
    IND_NAV: string; //C(1)
    VIAGEM: Integer; //N
    VL_FRT_LIQ: Double; //N(X,2)
    VL_DESP_PORT: Double; //N(X,2)
    VL_DESP_CAR_DESC: Double; //N(X,2)
    VL_OUT: Double; //N(X,2)
    VL_FRT_BRT: Double; //N(X,2)
    VL_FRT_MM: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistroD140 }

procedure TRegistroD140.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_PART_CONSG);
  addCampo(COD_MUN_ORIG, 7);
  addCampo(COD_MUN_DEST, 7);
  addCampo(IND_VEIC, 1);
  addCampo(VEIC_ID);
  addCampo(IND_NAV, 1);
  addCampo(VIAGEM, 0);
  addCampo(VL_FRT_LIQ, 2);
  addCampo(VL_DESP_PORT, 2);
  addCampo(VL_DESP_PORT, 2);
  addCampo(VL_DESP_CAR_DESC, 2);
  addCampo(VL_OUT, 2);
  addCampo(VL_FRT_BRT, 2);
  addCampo(VL_FRT_MM, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

