unit PisCofinsP100;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsP100 = class(TRegistro)
  private
  public
    DT_INI: TDate;
    DT_FIN: TDate;
    VL_REC_TOT_EST: Double;
    COD_ATIV_ECON: Integer;
    VL_REC_ATIV_ESTAB: Double;
    VL_EXC: Double;
    VL_BC_CONT: Double;
    ALIQ_CONT: Double;
    VL_CONT_APU: Double;
    COD_CTA: String; //C(50)
    INFO_COMPL: string; //C(200)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistroP100 }

procedure TPisCofinsP100.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_INI,'D');
  addCampo(DT_FIN,'D');
  addCampo(VL_REC_TOT_EST,2);
  addCampo(COD_ATIV_ECON,8);
  addCampo(VL_REC_ATIV_ESTAB,2);
  addCampo(VL_EXC,2);
  addCampo(VL_BC_CONT,2);
  addCampo(ALIQ_CONT,2);
  addCampo(VL_CONT_APU,2);
  addCampo(COD_CTA,50);
  addCampo(INFO_COMPL,200);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;
end.
