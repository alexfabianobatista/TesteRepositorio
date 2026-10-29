unit RegistroK200;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroK200 = Class (TRegistro)
    private
    public
      DT_EST: TDate;
      COD_ITEM: String;
      QTD: Integer;
      IND_EST: String;
      COD_PART: String;

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroK200 }

procedure TRegistroK200.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_EST,'D');
  addCampo(COD_ITEM);
  addCampo(QTD,13,3);
  addCampo(IND_EST,1);
  if (COD_PART <> '0') and (COD_PART <> '') then
    addCampo(COD_PART)
  else
    addCampo('');

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
