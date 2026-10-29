unit PisCofinsM105;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsM105 = class(TRegistro)
  private
  public
    NAT_BC_CRED: string; //C(2)
    CST_PIS: Integer; //N(2)
    VL_BC_PIS_TOT: Double; //N(X,2)
    VL_BC_PIS_CUM: Double; //N(X,2)
    VL_BC_PIS_NC: Double; //N(X,2)
    VL_BC_PIS: Double; //N(X,2)
    QUANT_BC_PIS_TOT: Double; //N(X,3)
    QUANT_BC_PIS: Double; //N(X,3)
    DESC_CRED: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsM105.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NAT_BC_CRED, 2);
  addCampo(CST_PIS, 2);
  addCampo(VL_BC_PIS_TOT, 2);
  addCampo(VL_BC_PIS_CUM, 2);
  addCampo(VL_BC_PIS_NC, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(QUANT_BC_PIS_TOT, '');
  addCampo(QUANT_BC_PIS, 3);
  addCampo(DESC_CRED, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
