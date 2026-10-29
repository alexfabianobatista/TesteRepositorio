unit PisCofinsP200;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsP200 = class(TRegistro)
  private
  public
    PERC_REF: string; //C(6)
    VL_TOT_CONT_APU: Double; //N(2)
    VL_TOT_AJ_REDUC: Double; //N(2)
    VL_TOT_AJ_ACRES: Double; //N(2)
    VL_TOT_CONT_DEV: Double; //N(2)
    COD_REC: string; //C(6)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistroP100 }

procedure TPisCofinsP200.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(PERC_REF);
  addCampo(VL_TOT_CONT_APU,2);
  addCampo(VL_TOT_AJ_REDUC,2);
  addCampo(VL_TOT_AJ_ACRES,2);
  addCampo(VL_TOT_CONT_DEV,2);
  addCampo(COD_REC,6);
  
  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
