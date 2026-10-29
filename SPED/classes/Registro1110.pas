unit Registro1110;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro1110 = Class (TRegistro)
    private
    public
      COD_PART: String; //C
      COD_MOD: String; //C(2)
      SER: String; //C
      NUM_DOC: Integer; //N(9)
      DT_DOC: TDate; //N(8)
      CHV_NFE: String; //N(44)
      NR_MEMO: Integer; //N
      QTD: Double; //N(X,3)
      UNID: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro1110 }

procedure TRegistro1110.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_PART);
  addCampo(COD_MOD, 2);
  addCampo(SER);
  addCampo(NUM_DOC, 9);
  addCampo(DT_DOC, 'D');
  addCampo(CHV_NFE, 44);
  addCampo(NR_MEMO, 0);
  addCampo(QTD, 3);
  addCampo(UNID);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
