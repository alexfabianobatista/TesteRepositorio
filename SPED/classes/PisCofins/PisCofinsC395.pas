unit PisCofinsC395;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC395 = class(TRegistro)
  private
  public
    COD_MOD: string; //C(2)
    COD_PART: string; //C(60)
    SER: string; //C(3)
    SUB_SER: string; //C(3)
    NUM_DOC: string; //C(6)
    DT_DOC: TDate; //N(8)
    VL_DOC: Double; //N(X,2)


    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC395 }

procedure TPisCofinsC395.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(COD_PART, 60);
  addCampo(SER, 3);
  addCampo(SUB_SER, 3);
  addCampo(NUM_DOC, 6);
  addCampo(DT_DOC, 'D');
  addCampo(VL_DOC, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
