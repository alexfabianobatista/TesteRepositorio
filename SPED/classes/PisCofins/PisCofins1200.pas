unit PisCofins1200;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins1200 = class(TRegistro)
  private
  public
    PER_APUR_ANT: Integer; //N(6)
    NAT_CONT_REC: string; //C(2)
    VL_CONT_APUR: Double; //N(X,2)
    VL_CRED_PIS_DESC: Double; //N(X,2)
    VL_CONT_DEV: Double; //N(X,2)
    VL_OUT_DED: Double; //N(X,2)
    VL_CONT_EXT: Double; //N(X,2)
    VL_MUL: Double; //N(X,2)
    VL_RECOL: Double; //N(X,2)
    DT_RECOL: TDate; //N(8)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins1200 }

procedure TPisCofins1200.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(PER_APUR_ANT, 6);
  addCampo(NAT_CONT_REC, 2);
  addCampo(VL_CONT_APUR, 2);
  addCampo(VL_CRED_PIS_DESC, 2);
  addCampo(VL_CONT_DEV, 2);
  addCampo(VL_OUT_DED, 2);
  addCampo(VL_CONT_EXT, 2);
  addCampo(VL_MUL, 2);
  addCampo(VL_RECOL, 2);
  addCampo(DT_RECOL, 'D');

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
