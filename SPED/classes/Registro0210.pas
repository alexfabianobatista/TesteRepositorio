unit Registro0210;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro0210 = Class (TRegistro)
    private
    public
      COD_ITEM_COMP: String;
      QTD_COMP: Double;
      PERDA: Double;

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0210 }

procedure TRegistro0210.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_ITEM_COMP);
  addCampo(QTD_COMP,10,6);
  addCampo(PERDA, 2,2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
