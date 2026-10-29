unit RegistroK280;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroK280 = Class (TRegistro)
    private
    public
      DT_EST: TDate;
      COD_ITEM: String;
      QTD_COR_POS: Double;
      QTD_COR_NEG: Double;
      IND_EST: String;
      COD_PART: String;

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroK280 }

procedure TRegistroK280.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_EST,'D');
  addCampo(COD_ITEM);
  if QTD_COR_POS > 0 then
    addCampo(QTD_COR_POS, 13, 3)
  else
    addCampo('');
  if QTD_COR_NEG > 0 then
    addCampo(QTD_COR_NEG, 13, 3)
  else
    addCampo('');
  addCampo(IND_EST);
  if (COD_PART <> '0') and (COD_PART <> '') then
    addCampo(COD_PART)
  else
    addCampo('');
  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
