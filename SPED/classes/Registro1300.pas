unit Registro1300;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro1300 = Class (TRegistro)
    private
    public
      COD_ITEM: String; //N(8)
      DT_FECH: TDate; //N(8)
      NR_INTERV: Integer; //N
      ESTQ_ABERT: Double; //N(X,3)
      VOL_ENTR: Double; //N(X,3)
      VOL_DISP: Double; //N(X,3)
      VOL_SAIDAS: Double; //N(X,3)
      VAL_SAIDAS: Double; //N(X,3)
      ESTQ_ESCR: Double; //N(X,3)
      VAL_AJ_PERDA: Double; //N(X,3)
      VAL_AJ_GANHO: Double; //N(X,3)
      ESTQ_FECHA: Double; //N(X,3)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro1300 }

procedure TRegistro1300.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_ITEM);
  addCampo(DT_FECH, 'D');
  addCampo(NR_INTERV, 0);
  addCampo(ESTQ_ABERT, 3);
  addCampo(VOL_ENTR, 3);
  addCampo(VOL_DISP, 3);
  addCampo(VOL_SAIDAS, 3);
  addCampo(VAL_SAIDAS, 3);
  addCampo(ESTQ_ESCR, 3);
  addCampo(VAL_AJ_PERDA, 3);
  addCampo(VAL_AJ_GANHO, 3);
  addCampo(ESTQ_FECHA, 3);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
