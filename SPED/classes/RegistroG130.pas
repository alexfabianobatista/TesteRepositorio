unit RegistroG130;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroG130 = Class (TRegistro)
    private
    public
      IND_EMIT: Integer; //N(1)
      COD_PART: String; //C(60)
      COD_MOD: String;  //N(2)
      SERIE: String; //N(3)
      NUM_DOC: Integer; //N(9)
      CHV_NFE_CTE: String; //N(44)
      DT_DOC: TDate; // N(8)
      NUM_DA: String; //Sem tamanho

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroG130 }

procedure TRegistroG130.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_EMIT, 1); //N(1)
  addCampo(COD_PART, 60); //C(60)
  addCampo(COD_MOD, 2);  //N(2)
  addCampo(SERIE, 3); //N(3)
  addCampo(NUM_DOC, 9); //N(9)
  addCampo(CHV_NFE_CTE, 44); //N(44)
  addCampo(DT_DOC, 'D');// N(8)
  addCampo(NUM_DA, 3); //Sem tamanho


  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
