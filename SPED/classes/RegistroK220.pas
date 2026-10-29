unit RegistroK220;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroK220 = Class (TRegistro)
    private
    public
      DT_MOV: TDate;
      COD_ITEM_ORI: String;
      COD_ITEM_DEST: String;
      QTD: Double;

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroK220 }

procedure TRegistroK220.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_MOV,'D');
  addCampo(COD_ITEM_ORI);
  addCampo(COD_ITEM_DEST);
  addCampo(QTD,13,3);
  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
