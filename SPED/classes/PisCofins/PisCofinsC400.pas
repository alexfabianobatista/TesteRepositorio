unit PisCofinsC400;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC400 = class(TRegistro)
  private
  public
    COD_MOD: string; //C(20)
    ECF_MOD: string; //C(02)
    ECF_FAB: string; //C(20)
    ECF_CX: string; //C(03)


    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC400 }

procedure TPisCofinsC400.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 20);
  addCampo(ECF_MOD, 2);
  addCampo(ECF_FAB, 20);
  addCampo(ECF_CX, 3);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
