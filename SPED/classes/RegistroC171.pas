unit RegistroC171;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC171 = Class (TRegistro)
    private
    public
      NUM_TANQUE: String; //C
      QTDE: Integer; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC171 }

procedure TRegistroC171.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_TANQUE);
  addCampo(QTDE, 1);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end. 
