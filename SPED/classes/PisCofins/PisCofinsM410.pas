unit PisCofinsM410;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsM410 = class(TRegistro)
  private
  public
    NAT_REC: integer; //C(3)
    VL_REC: Double; //N(X,2)
    COD_CTA: string; //C(60)
    DESC_COMPL: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsM410.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NAT_REC, 3);
  addCampo(VL_REC, 2);
  addCampo(COD_CTA, 60);
  addCampo(DESC_COMPL);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
