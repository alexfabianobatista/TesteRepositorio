unit PisCofins1102;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins1102 = class(TRegistro)
  private
  public
    VL_CRED_PIS_TRIB_MI: Double; //N(X,2)
    VL_CRED_PIS_NT_MI: Double; //N(X,2)
    VL_CRED_PIS_EXP: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins1102 }

procedure TPisCofins1102.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(VL_CRED_PIS_TRIB_MI, 2);
  addCampo(VL_CRED_PIS_NT_MI, 2);
  addCampo(VL_CRED_PIS_EXP, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
