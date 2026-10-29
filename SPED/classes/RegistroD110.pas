unit RegistroD110;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD110 = Class (TRegistro)
    private
    public
      NUM_ITEM: Integer; //N
      COD_ITEM: String; //C
      VL_SERV: Double; //N(X,2)
      VL_OUT: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD110 }

procedure TRegistroD110.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_ITEM, 0);
  addCampo(COD_ITEM);
  addCampo(VL_SERV, 2);
  addCampo(VL_OUT, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
