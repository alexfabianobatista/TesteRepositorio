unit RegistroC177;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC177 = Class (TRegistro)
    private
    public
      COD_SELO_IPI: String; //C(6)
      QT_SELO_IPI: Integer; //N(12)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC177 }

procedure TRegistroC177.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_SELO_IPI, 6);
  addCampo(QT_SELO_IPI, 12);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
