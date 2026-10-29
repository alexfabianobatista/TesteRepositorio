unit RegistroC113;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC113 = Class (TRegistro)
    private
    public
      IND_OPER: String; //C(1)
      IND_EMIT: String; //C(1)
      COD_PART: String; //C
      COD_MOD: String; //C(2)
      SER: String; //C
      SUB: Integer; //N
      NUM_DOC: Integer; //N(9)
      DT_DOC: TDate; //N(8)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC113 }

procedure TRegistroC113.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_OPER, 1);
  addCampo(IND_EMIT, 1);
  addCampo(COD_PART);
  addCampo(COD_MOD, 2);
  addCampo(SER);
  addCampo(SUB, 0);
  addCampo(NUM_DOC, 9);
  addCampo(DT_DOC, 'D');
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
