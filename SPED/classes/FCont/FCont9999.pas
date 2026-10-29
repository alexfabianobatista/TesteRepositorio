unit FCont9999;

interface

uses Arquivo, Registro, Controls;

type
  TFCont9999 = class(TRegistro)
  private
  public
    QTD_LIN: Double; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFCont9999 }

procedure TFCont9999.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
