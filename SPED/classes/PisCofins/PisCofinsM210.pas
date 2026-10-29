unit PisCofinsM210;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TPisCofinsM210 = class(TRegistro)
  private
    wDataIni: TDate;
  public
    COD_CONT: string; //C(2)
    VL_REC_BRT: Double; //N(X,2)
    VL_BC_CONT: Double; //N(X,2)
    VL_AJUS_ACRES_BC_PIS: Double; //N(X,2)
    VL_AJUS_REDUC_BC_PIS: Double; //N(X,2)
    VL_BC_CONT_AJUS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(8,4)
    QUANT_BC_PIS: Double; //N(X,3)
    ALIQ_PIS_QUANT: Double; //N(X,4)
    VL_CONT_APUR: Double; //N(X,2)
    VL_AJUS_ACRES: Double; //N(X,2)
    VL_AJUS_REDUC: Double; //N(X,2)
    VL_CONT_DIFER: Double; //N(X,2)
    VL_CONT_DIFER_ANT: Double; //N(X,2)
    VL_CONT_PER: Double; //N(X,2)

    // Campo para gerenciamento
    DT_INI: TDate;

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }   

procedure TPisCofinsM210.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CONT, 2);
  addCampo(VL_REC_BRT, 2);
  addCampo(VL_BC_CONT, 2);
  if DT_INI >= StrToDate('01/01/2019') then
  begin
    addCampo(VL_AJUS_ACRES_BC_PIS, 2);
    addCampo(VL_AJUS_REDUC_BC_PIS, 2);
    addCampo(VL_BC_CONT_AJUS, 2);
  end;
  addCampo(ALIQ_PIS, 3, 4);
  addCampo(QUANT_BC_PIS, 0);
  addCampo(ALIQ_PIS_QUANT, '');
  addCampo(VL_CONT_APUR, 2);
  addCampo(VL_AJUS_ACRES, 2);
  addCampo(VL_AJUS_REDUC, 2);
  addCampo(VL_CONT_DIFER, 0);
  addCampo(VL_CONT_DIFER_ANT, 0);
  addCampo(VL_CONT_PER, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
