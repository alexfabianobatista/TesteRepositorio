unit RegistroE250;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE250 = class(TRegistro)
  private
  public
    COD_OR: string; //C(3)
    VL_OR: Double; //N(X,2)
    DT_VCTO: TDate; //N(8)
    COD_REC: string; //C
    NUM_PROC: string; //C(60)
    IND_PROC: string; //C(1)
    PROC: string; //C
    TEXT_COMPL: string; //C
    MES_REF: Integer; //N(6)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistroE250 }

procedure TRegistroE250.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_OR, 3);
  addCampo(VL_OR, 2);
  addCampo(DT_VCTO, 'D');
  addCampo(COD_REC);
  addCampo(NUM_PROC, 60);
  addCampo(IND_PROC, 1);
  addCampo(PROC);
  addCampo(TEXT_COMPL);
  addCampo(MES_REF, 6);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

