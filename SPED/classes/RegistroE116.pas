unit RegistroE116;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroE116 = class(TRegistro)
  private
  public
    COD_OR: string; //C(3)
    VL_OR: Double; //N(X,2)
    DT_VCTO: TDate; //N(8)
    COD_REC: string; //C
    NUM_PROC: string; //C(60)
    IND_PROC: string; //C(1)
    PROC: string; //C
    TXT_COMPL: string; //C
    MES_REF: Integer; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistroE116 }

procedure TRegistroE116.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_OR, 3);
  addCampo(VL_OR, 2);
  addCampo(DT_VCTO, 'D');
  addCampo(COD_REC);
  addCampo(NUM_PROC);
  addCampo(IND_PROC, 1);
  addCampo(PROC);
  addCampo(TXT_COMPL);
  addCampo(MES_REF, 6);
  
  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

