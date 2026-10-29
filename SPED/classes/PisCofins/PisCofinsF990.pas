unit PisCofinsF990;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsF990 = class(TRegistro)
  private
  public
    QTD_LIN_F: Double; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsF990 }

procedure TPisCofinsF990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_F, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
