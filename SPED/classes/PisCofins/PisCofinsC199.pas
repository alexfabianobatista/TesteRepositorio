unit PisCofinsC199;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC199 = class(TRegistro)
  private
  public
    COD_DOC_IMP: string; //C(1)
    NUM_DOC_IMP: string; //C(10)
    VL_PIS_IMP: Double; //N(X,2)
    VL_COFINS_IMP: Double; //N(X,2)
    NUM_ACDRAW: string; //C(20)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC199 }

procedure TPisCofinsC199.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_DOC_IMP, 1);
  addCampo(NUM_DOC_IMP, 10);
  addCampo(VL_PIS_IMP, 2);
  addCampo(VL_COFINS_IMP, 2);
  addCampo(NUM_ACDRAW, 20);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
