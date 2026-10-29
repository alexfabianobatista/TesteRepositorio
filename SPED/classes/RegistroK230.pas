unit RegistroK230;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroK230 = Class (TRegistro)
    private
    public
      DT_INI_OP: TDate;
      DT_FIN_OP: TDate;
      COD_DOC_OP: String;
      COD_ITEM: String;
      QTD_ENC: Double;

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroK230 }

procedure TRegistroK230.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_INI_OP,'D');
  addCampo(DT_FIN_OP,'D');
  addCampo(COD_DOC_OP);
  addCampo(COD_ITEM);
  addCampo(QTD_ENC,7,3);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
