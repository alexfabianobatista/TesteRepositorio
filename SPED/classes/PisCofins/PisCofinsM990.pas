unit PisCofinsM990;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsM990 = class(TRegistro)
  private
  public
    QTD_LIN_M: Double; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsM990 }

procedure TPisCofinsM990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_M, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

