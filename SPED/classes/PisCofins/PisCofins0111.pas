unit PisCofins0111;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TPisCofins0111 = class(TRegistro)
  private
  public
    REC_BRU_NCUM_TRIB_MI: Double; //N(X,2)
    REC_BRU_NCUM_NT_MI: Double; //N(X,2)
    REC_BRU_NCUM_EXP: Double; //N(X,2)
    REC_BRU_CUM: Double; //N(X,2)
    REC_BRU_TOTAL: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins0111 }

procedure TPisCofins0111.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(REC_BRU_NCUM_TRIB_MI, 2);
  addCampo(REC_BRU_NCUM_NT_MI, 2);
  addCampo(REC_BRU_NCUM_EXP, 2);
  addCampo(REC_BRU_CUM, 2);
  addCampo(REC_BRU_TOTAL, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

