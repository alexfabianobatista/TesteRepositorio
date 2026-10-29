unit FCont9900;

interface

uses Arquivo, Registro, Controls;

type
  TFCont9900 = Class (TRegistro)
    private
    public
      REG_BLC: String; //C(4)
      QTD_REG_BLC: Double; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TFCont9900 }

procedure TFCont9900.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(REG_BLC, 4);
  addCampo(QTD_REG_BLC, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
