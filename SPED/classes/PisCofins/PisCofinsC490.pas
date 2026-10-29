unit PisCofinsC490;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC490 = class(TRegistro)
  private
  public
    DT_DOC_INI: TDate; //N(8)
    DT_DOC_FIN: TDate; //N(8)
    COD_MOD: string; //C(2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC490 }

procedure TPisCofinsC490.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_DOC_INI, 'D');
  addCampo(DT_DOC_FIN, 'D');
  addCampo(COD_MOD, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
