unit PisCofinsM610;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TPisCofinsM610 = class(TRegistro)
  private
    wDataIni: TDate;
  public
    COD_CONT: string; //C(2)
    VL_REC_BRT: Double; //N(X,2)
    VL_BC_CONT: Double; //N(X,2)
    VL_AJUS_ACRES_BC_COFINS: Double; //N(X,2)
    VL_AJUS_REDUC_BC_COFINS: Double; //N(X,2)
    VL_BC_CONT_AJUS: Double; //N(X,2)
    ALIQ_COFINS: Double; //N(8,4)
    QUANT_BC_COFINS: Double; //N(X,3)
    ALIQ_COFINS_QUANT: Double; //N(X,4)
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

procedure TPisCofinsM610.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CONT, 2);
  addCampo(VL_REC_BRT, 2);
  addCampo(VL_BC_CONT, 2);
  if DT_INI >= StrToDate('01/01/2019') then
  begin
    addCampo(VL_AJUS_ACRES_BC_COFINS, 2);
    addCampo(VL_AJUS_REDUC_BC_COFINS, 2);
    addCampo(VL_BC_CONT_AJUS, 2);
  end;
  addCampo(ALIQ_COFINS, 3, 4);
  addCampo(QUANT_BC_COFINS, 3);
  if ALIQ_COFINS_QUANT > 0 then
    addCampo(ALIQ_COFINS_QUANT, 4)
  else
    addCampo('');
  addCampo(VL_CONT_APUR, 2);
  addCampo(VL_AJUS_ACRES, 2);
  addCampo(VL_AJUS_REDUC, 2);
  addCampo(VL_CONT_DIFER, 2);
  addCampo(VL_CONT_DIFER_ANT, 2);
  addCampo(VL_CONT_PER, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
