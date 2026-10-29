unit RegistroC114;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC114 = Class (TRegistro)
    private
    public
      COD_MOD: String; //C(2)
      ECF_FAB: String; //C
      ECF_CX: Integer; //N
      NUM_DOC: Integer; //N
      DT_DOC: TDate; //N(8)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC114 }

procedure TRegistroC114.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(ECF_FAB);
  addCampo(ECF_CX, 0);
  addCampo(NUM_DOC, 0);
  addCampo(DT_DOC, 'D');
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end. 
