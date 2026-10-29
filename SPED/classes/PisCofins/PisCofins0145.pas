unit PisCofins0145;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TPisCofins0145 = class(TRegistro)
  private
  public
    COD_INC_TRIB: Integer; //N(1)
    VL_REC_TOT: Double; //N(8,2)
    VL_REC_ATIV: Double; //N(8,2)
    VL_REC_DEMAIS_ATIV: Double; //N(8,2)
    INFO_COMPL: string; //C(n)
    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins0145 }

procedure TPisCofins0145.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_INC_TRIB,1);
  addCampo(VL_REC_TOT,9,2);
  addCampo(VL_REC_ATIV,9,2);
  addCampo(VL_REC_DEMAIS_ATIV,9,2);
  addCampo(INFO_COMPL);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
