unit PisCofinsA120;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsA120 = class(TRegistro)
  private
  public
    VL_TOT_SERV: Double; //N(X,2)
    VL_BC_PIS: Double; //N(X,2)
    VL_PIS_IMP: Double; //N(X,2)
    DT_PAG_PIS: TDate; //N(8)
    VL_BC_COFINS: Double; //N(X,2)
    VL_COFINS_IMP: Double; //N(X,2)
    DT_PAG_COFINS: TDate; //N(8)
    LOC_EXE_SERV: string; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsA120.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(VL_TOT_SERV, 2);
  addCampo(VL_BC_PIS, 2);
  addCampo(VL_PIS_IMP, 2);
  addCampo(DT_PAG_PIS, 'D');
  addCampo(VL_BC_COFINS, 2);
  addCampo(VL_COFINS_IMP, 2);
  addCampo(DT_PAG_COFINS, 'D');
  addCampo(LOC_EXE_SERV, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
