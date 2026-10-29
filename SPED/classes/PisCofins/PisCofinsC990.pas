unit PisCofinsC990;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsC990 = class(TRegistro)
  private
  public
    QTD_LIN_C: Double; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsC990 }

procedure TPisCofinsC990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_C, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
