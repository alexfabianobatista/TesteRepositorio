unit PisCofinsC500;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC500 = class(TRegistro)
  private
  public
    COD_PART: string; //C(60)
    COD_MOD: string; //C(2)
    COD_SIT: Integer; //N(2)
    SER: string; //C(4)
    SUB: Integer; //N(3)
    NUM_DOC: Integer; //C(9)
    DT_DOC: TDate; //N(8)
    DT_ENT: TDate; //N(8)
    VL_DOC: Double; //N(X,2)
    VL_ICMS: Double; //N(X,2)
    COD_INF: Integer; //C(6)
    VL_PIS: Double; //N(X,2)
    VL_COFINS: Double; //N(X,2)
    CHV_DOCe: string;

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC500 }

procedure TPisCofinsC500.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_PART, 60);
  addCampo(COD_MOD, 2);
  addCampo(COD_SIT, 2);
  addCampo(SER, 4);
  addCampo(SUB, 3);
  addCampo(NUM_DOC, 9);
  addCampo(DT_DOC, 'D');
  addCampo(DT_ENT, 'D');
  addCampo(VL_DOC, 2);
  addCampo(VL_ICMS, 2);
  if COD_INF > 0 then
    addCampo(COD_INF, 6)
  else
    addCampo(COD_INF, '');
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);
  addCampo(CHV_DOCe, 44);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
