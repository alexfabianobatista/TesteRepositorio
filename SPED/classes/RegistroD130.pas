unit RegistroD130;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD130 = class(TRegistro)
  private
  public
    COD_PART_CONSG: string; //C
    COD_PART_RED: string; //C
    IND_FRT_RED: string; //C(1)
    COD_MUN_ORIG: Integer; //C(7)
    COD_MUN_DEST: Integer; //C(7)
    VEIC_ID: string; //C
    VL_LIQ_FRT: Double; //N(X,2)
    VL_SEC_CAT: Double; //N(X,2)
    VL_DESP: Double; //N(X,2)
    VL_PEDG: Double; //N(X,2)
    VL_OUT: Double; //N(X,2)
    VL_FRT: Double; //N(X,2)
    UF_ID: string; //C(2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistroD130 }

procedure TRegistroD130.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_PART_CONSG);
  addCampo(COD_PART_RED);
  addCampo(IND_FRT_RED, 1);
  addCampo(COD_MUN_ORIG, 7);
  addCampo(COD_MUN_DEST, 7);
  addCampo(SomenteNumerosELetras(VEIC_ID));
  addCampo(VL_LIQ_FRT, 2);
  addCampo(VL_SEC_CAT, 2);
  addCampo(VL_DESP, 2);
  addCampo(VL_PEDG, 2);
  addCampo(VL_OUT, 2);
  addCampo(VL_FRT, 2);
  addCampo(UF_ID, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
