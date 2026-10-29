unit PisCofinsD200;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsD200 = class(TRegistro)
  private
  public
    COD_MOD: string; //C(2)
    COD_SIT: Integer; //N(2)
    SER: string; //C(4)
    SUB: string; //C(3)
    NUM_DOC_INI: Integer; //N(9)
    NUM_DOC_FIN: Integer; //N(9)
    CFOP: Integer; //N(4)
    DT_REF: TDate; //N(8)
    VL_DOC: Double; //N(X,2)
    VL_DESC: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsD200.grava;
var pipoca: Integer;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(COD_SIT, 2);
  addCampo(SER, 4);
  addCampo(SUB, 3);
  addCampo(NUM_DOC_INI, 9);
  addCampo(NUM_DOC_FIN, 9);
  addCampo(CFOP, 4);
  addCampo(DT_REF, 'D');
  addCampo(VL_DOC, 2);
  addCampo(VL_DESC, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
