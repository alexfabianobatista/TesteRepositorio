unit FContI990;

interface

uses Arquivo, Registro, Controls;

type
  TFContI990 = class(TRegistro)
  private
  public
    QTD_LIN_I: Double; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistroI990 }

procedure TFContI990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_I, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
