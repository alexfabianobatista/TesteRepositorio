unit PisCofins1500;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins1500 = class(TRegistro)
  private
  public
    PER_APU_CRED: Integer; //N(6)
    ORIG_CRED: Integer; //N(2)
    CNPJ_SUC: string; //N(14)
    COD_CRED: Double; //N(13)
    VL_CRED_APU: Double; //N(X,2)
    VL_CRED_EXT_APU: Double; //N(X,2)
    VL_TOT_CRED_APU: Double; //N(X,2)
    VL_CRED_DESC_PA_ANT: Double; //N(X,2)
    VL_CRED_PER_PA_ANT: Double; //N(X,2)
    VL_CRED_DCOMP_PA_ANT: Double; //N(X,2)
    SD_CRED_DISP_EFD: Double; //N(X,2)
    VL_CRED_DESC_EFD: Double; //N(X,2)
    VL_CRED_PER_EFD: Double; //N(X,2)
    VL_CRED_DCOMP_EFD: Double; //N(X,2)
    VL_CRED_TRANS: Double; //N(X,2)
    VL_CRED_OUT: Double; //N(X,2)
    SLD_CRED_FIM: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins1500 }

procedure TPisCofins1500.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(PER_APU_CRED, 6);
  addCampo(ORIG_CRED, 2);
  addCampo(SomenteNumeros(CNPJ_SUC), 14);
  addCampo(COD_CRED, 13, 0);
  addCampo(VL_CRED_APU, 2);
  addCampo(VL_CRED_EXT_APU, 2);
  addCampo(VL_TOT_CRED_APU, 2);
  addCampo(VL_CRED_DESC_PA_ANT, 2);
  addCampo(VL_CRED_PER_PA_ANT, 2);
  addCampo(VL_CRED_DCOMP_PA_ANT, 2);
  addCampo(SD_CRED_DISP_EFD, 2);
  addCampo(VL_CRED_DESC_EFD, 2);
  addCampo(VL_CRED_PER_EFD, 2);
  addCampo(VL_CRED_DCOMP_EFD, 2);
  addCampo(VL_CRED_TRANS, 2);
  addCampo(VL_CRED_OUT, 2);
  addCampo(SLD_CRED_FIM, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

