unit PisCofinsC380;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC380 = class(TRegistro)
  private
  public
    COD_MOD: string; //C(2)
    DT_DOC_INI: TDate; //N(8)
    DT_DOC_FIN: TDate; //N(8)
    NUM_DOC_INI: Integer; //N(6)
    NUM_DOC_FIN: Integer; //N(6)
    VL_DOC: Double; //N(X,2)
    VL_DOC_CANC: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC380 }

procedure TPisCofinsC380.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(DT_DOC_INI, 'D');
  addCampo(DT_DOC_FIN, 'D');
  addCampo(NUM_DOC_INI, 6);
  addCampo(NUM_DOC_FIN, 6);
  addCampo(VL_DOC, 2);
  addCampo(VL_DOC_CANC, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
