unit PisCofinsM110;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsM110 = class(TRegistro)
  private
  public
    IND_AJ: string; //C(1)
    VAL_AJ: Double; //N(X,2)
    COD_AJ: Integer; //N(2)
    NUM_DOC: string; //C
    DESCR_AJ: string; //C
    DT_REF: TDate; //N(8)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsM110.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_AJ, 1);
  addCampo(VAL_AJ, 2);
  addCampo(COD_AJ, 2);
  addCampo(NUM_DOC);
  addCampo(DESCR_AJ);
  addCampo(DT_REF, 'D');

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
