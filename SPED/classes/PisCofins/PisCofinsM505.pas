unit PisCofinsM505;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsM505 = class(TRegistro)
  private
  public
    NAT_BC_CRED: string; //C(2)
    CST_COFINS: Integer; //N(2)
    VL_BC_COFINS_TOT: Double; //N(X,2)
    VL_BC_COFINS_CUM: Double; //N(X,2)
    VL_BC_COFINS_NC: Double; //N(X,2)
    VL_BC_COFINS: Double; //N(X,2)
    QUANT_BC_COFINS_TOT: Double; //N(X,3)
    QUANT_BC_COFINS: Double; //N(X,3)
    DESC_CRED: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsM505.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NAT_BC_CRED, 2);
  addCampo(CST_COFINS, 2);
  addCampo(VL_BC_COFINS_TOT, 2);
  addCampo(VL_BC_COFINS_CUM, 2);
  addCampo(VL_BC_COFINS_NC, 2);
  addCampo(VL_BC_COFINS, 2);
  if QUANT_BC_COFINS_TOT > 0 then
    addCampo(QUANT_BC_COFINS_TOT, 3)
  else
    addCampo('');
  if QUANT_BC_COFINS > 0 then
    addCampo(QUANT_BC_COFINS, 3)
  else
    addCampo('');
  addCampo(DESC_CRED, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
