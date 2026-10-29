unit Registro0221;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro0221 = Class (TRegistro)
    private
    public
      COD_ITEM_ATOMICO: String; //N(60)
      QTD_CONTIDA: Double; //N(X,6)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0221 }

procedure TRegistro0221.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_ITEM_ATOMICO);
  addCampo(QTD_CONTIDA, 6);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
