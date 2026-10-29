unit PisCofinsM400;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsM400 = class(TRegistro)
  private
  public
    CST_PIS: string; //C(2)
    VL_TOT_REC: Double; //N(X,2)
    COD_CTA: string; //C(60)
    DESC_COMPL: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsM400.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(CST_PIS, 2);
  addCampo(VL_TOT_REC, 2);
  addCampo(COD_CTA, 60);
  addCampo(DESC_COMPL);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
