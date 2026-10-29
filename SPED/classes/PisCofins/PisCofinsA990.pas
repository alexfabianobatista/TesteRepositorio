unit PisCofinsA990;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsA990 = class(TRegistro)
  private
  public
    QTD_LIN_A: Double; //N

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofinsA990 }

procedure TPisCofinsA990.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(QTD_LIN_A, 0);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
