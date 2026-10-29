unit PisCofins1800;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins1800 = class(TRegistro)
  private
  public
    INC_IMOB: string; //C(90)
    REC_RECEB_RET: Double; //N(X,2)
    REC_FIN_RET: Double; //N(X,2)
    BC_RET: Double; //N(X,2)
    ALIQ_RET: Double; //N(6,2)
    VL_REC_UNI: Double; //N(X,2)
    DT_REC_UNI: TDate; //N(8)
    COD_REC: string; //C(4)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins1800 }

procedure TPisCofins1800.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(INC_IMOB, 90);
  addCampo(REC_RECEB_RET, 2);
  addCampo(REC_FIN_RET, 2);
  addCampo(BC_RET, 2);
  addCampo(ALIQ_RET, 6, 2);
  addCampo(VL_REC_UNI, 2);
  addCampo(DT_REC_UNI, 'D');
  addCampo(COD_REC, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
