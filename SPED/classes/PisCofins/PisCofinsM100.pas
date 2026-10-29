unit PisCofinsM100;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsM100 = class(TRegistro)
  private
  public
    COD_CRED: string; //C(3)
    IND_CRED_ORI: Integer; //N(1)
    VL_BC_PIS: Double; //N(X,2)
    ALIQ_PIS: Double; //N(8,4)
    QUANT_BC_PIS: Double; //N(X,3)
    ALIQ_PIS_QUANT: Double; //N(X,4)
    VL_CRED: Double; //N(X,2)
    VL_AJUS_ACRES: Double; //N(X,2)
    VL_AJUS_REDUC: Double; //N(X,2)
    VL_CRED_DIF: Double; //N(X,2)
    VL_CRED_DISP: Double; //N(X,2)
    IND_DESC_CRED: string; //C(1)
    VL_CRED_DESC: Double; //N(X,2)
    SLD_CRED: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsM100.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_CRED, 3);
  addCampo(IND_CRED_ORI, 1);
  if VL_BC_PIS > 0 then
    addCampo(VL_BC_PIS, 2)
  else
    addCampo('');
  addCampo(ALIQ_PIS, 3, 4);
  if QUANT_BC_PIS > 0 then
    addCampo(QUANT_BC_PIS, 3)
  else
    addCampo('');
  if ALIQ_PIS_QUANT > 0then
    addCampo(ALIQ_PIS_QUANT, 4)
  else
    addCampo('');
  addCampo(VL_CRED, 2);
  addCampo(VL_AJUS_ACRES, 2);
  addCampo(VL_AJUS_REDUC, 2);
  addCampo(VL_CRED_DIF, 2);
  addCampo(VL_CRED_DISP, 2);
  addCampo(IND_DESC_CRED, 1);
  if VL_CRED_DESC > 0 then
    addCampo(VL_CRED_DESC, 2)
  else
    addCampo('');
  addCampo(SLD_CRED, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
