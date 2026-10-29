unit PisCofins1700;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins1700 = class(TRegistro)
  private
  public
    IND_NAT_RET: Integer; //N(2)
    PR_REC_RET: Integer; //N(6)
    VL_RET_APU: Double; //N(X,2)
    VL_RET_DED: Double; //N(X,2)
    VL_RET_PER: Double; //N(X,2)
    VL_RET_DCOMP: Double; //N(X,2)
    SLD_RET: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins1700 }

procedure TPisCofins1700.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_NAT_RET, 2);
  addCampo(PR_REC_RET, 6);
  addCampo(VL_RET_APU, 2);
  addCampo(VL_RET_DED, 2);
  addCampo(VL_RET_PER, 2);
  addCampo(VL_RET_DCOMP, 2);
  addCampo(SLD_RET, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
