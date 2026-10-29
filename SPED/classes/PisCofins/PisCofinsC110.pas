unit PisCofinsC110;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC110 = class(TRegistro)
  private
  public
    COD_INF: string; //C(6)
    TXT_COMPL: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsC110.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_INF, 6);
  addCampo(TXT_COMPL);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
