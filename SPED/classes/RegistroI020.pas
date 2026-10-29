unit RegistroI020;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI020 = Class (TRegistro)
    private
    public
      REG_COD: String; //C(4)
      NUM_AD: Integer; //N
      CAMPO: String; //C
      DESCRICAO: String; //C
      TIPO: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI020 }

procedure TRegistroI020.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(REG_COD, 4);
  addCampo(NUM_AD, 0);
  addCampo(CAMPO);
  addCampo(DESCRICAO);
  addCampo(TIPO);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
