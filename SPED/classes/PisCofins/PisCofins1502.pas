unit PisCofins1502;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins1502 = class(TRegistro)
  private
  public
    VL_CRED_COFINS_TRIB_MI: Double; //N(X,2)
    VL_CRED_COFINS_NT_MI: Double; //N(X,2)
    VL_CRED_COFINS_EXP: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins1502 }

procedure TPisCofins1502.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(VL_CRED_COFINS_TRIB_MI, 2);
  addCampo(VL_CRED_COFINS_NT_MI, 2);
  addCampo(VL_CRED_COFINS_EXP, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
