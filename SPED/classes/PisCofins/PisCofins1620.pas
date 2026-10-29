unit PisCofins1620;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins1620 = class(TRegistro)
  private
  public
    PER_APU_CRED: Integer; //N(6)
    ORIG_CRED: Integer; //N(2)
    COD_CRED: Integer; //N(3)
    VL_CRED: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins1620 }

procedure TPisCofins1620.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(PER_APU_CRED, 6);
  addCampo(ORIG_CRED, 2);
  addCampo(COD_CRED, 3);
  addCampo(VL_CRED, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
