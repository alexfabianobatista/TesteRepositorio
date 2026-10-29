unit PisCofinsM350;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsM350 = class(TRegistro)
  private
  public
    VL_TOT_FOL: Double; //N(X,2)
    VL_EXC_BC: Double; //N(X,2)
    VL_TOT_BC: Double; //N(X,2)
    ALIQ_PIS_FOL: Double; //N(X,2)
    VL_TOT_CONT_FOL: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsM350.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(VL_TOT_FOL, 2);
  addCampo(VL_EXC_BC, 2);
  addCampo(VL_TOT_BC, 2);
  addCampo(ALIQ_PIS_FOL, 2);
  addCampo(VL_TOT_CONT_FOL, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
