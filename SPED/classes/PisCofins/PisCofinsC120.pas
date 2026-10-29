unit PisCofinsC120;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC120 = class(TRegistro)
  private
  public
    COD_DOC_IMP: string; //C(1)
    NUM_DOC_IMP: string; //C(10)
    VL_PIS_IMP: Double; //N(X,2)
    VL_COFINS_IMP: Double; //N(X,2)
    NUM_ACDR_AW: string;
    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsC120.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_DOC_IMP, 1);
  addCampo(NUM_DOC_IMP, 10);
  addCampo(VL_PIS_IMP, 2);
  addCampo(VL_COFINS_IMP, 2);
  addCampo(NUM_ACDR_AW);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
