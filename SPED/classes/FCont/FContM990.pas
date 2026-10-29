unit FContM990;

interface

uses Arquivo, Registro, Controls;

type
  TFContM990 = class(TRegistro)
  private
  public
    QTD_LIN_M: Double; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistroI990 }

procedure TFContM990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_M, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
