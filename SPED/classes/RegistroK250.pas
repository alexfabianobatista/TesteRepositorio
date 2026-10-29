unit RegistroK250;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroK250 = Class (TRegistro)
    private
    public
      DT_PROD: TDate;
      COD_ITEM: String;
      QTD: Double;

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroK250 }

procedure TRegistroK250.grava;
begin
  inherited;         
  addCampo(bloco + registro);
  addCampo(DT_PROD,'D');
  addCampo(COD_ITEM);
  addCampo(QTD,13,4);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
