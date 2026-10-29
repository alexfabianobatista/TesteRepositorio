unit PisCofinsP990;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsP990 = class(TRegistro)
  private
  public
    QTD_LIN_M: Double; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsP990 }

procedure TPisCofinsP990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_M, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
