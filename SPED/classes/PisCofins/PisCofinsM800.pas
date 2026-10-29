unit PisCofinsM800;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsM800 = class(TRegistro)
  private
  public
    CST_COFINS: string; //C(2)
    VL_TOT_REC: Double; //N(X,2)
    COD_CTA: string; //C(60)
    DESC_COMPL: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsM800.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(CST_COFINS, 2);
  addCampo(VL_TOT_REC, 2);
  addCampo(COD_CTA, 60);
  addCampo(DESC_COMPL);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
