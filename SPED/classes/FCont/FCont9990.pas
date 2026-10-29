unit FCont9990;

interface

uses Arquivo, Registro, Controls;

type
  TFCont9990 = class(TRegistro)
  private
  public
    QTD_LIN_9: Double; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFCont9990 }

procedure TFCont9990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_9, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
