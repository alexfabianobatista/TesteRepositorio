unit PisCofins0205;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins0205 = class(TRegistro)
  private
  public
    DESCR_ANT_ITEM: string; //C
    DT_INI: TDate; //N(8)
    DT_FIM: TDate; //N(8)
    COD_ANT_ITEM: string; //C(60)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins0205 }

procedure TPisCofins0205.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DESCR_ANT_ITEM);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIM, 'D');
  addCampo(COD_ANT_ITEM, 60);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
