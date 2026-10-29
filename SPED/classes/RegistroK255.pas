unit RegistroK255;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroK255 = Class (TRegistro)
    private
    public
      DT_CONS: TDate;
      COD_ITEM: String;
      QTD: Double;
      COD_INS_SUBST: String;

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroK255 }

procedure TRegistroK255.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_CONS,'D');
  addCampo(COD_ITEM);
  addCampo(QTD,13,4);
  addCampo(COD_INS_SUBST);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
