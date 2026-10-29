unit PisCofinsD990;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsD990 = class(TRegistro)
  private
  public
    QTD_LIN_D: Double; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsD990 }

procedure TPisCofinsD990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_D, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
