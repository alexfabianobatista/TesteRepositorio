unit RegistroK235;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroK235 = Class (TRegistro)
    private
    public
      DT_SAIDA: TDate;
      COD_ITEM: String;
      QTD: Double;
      COD_INS_SUBST: String;

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroK235 }

procedure TRegistroK235.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_SAIDA,'D');
  addCampo(COD_ITEM);
  addCampo(QTD,7,3);
  addCampo(COD_INS_SUBST);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
