unit ContFiscX410;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX410 = class(TRegistro)
  private

  public
    PAIS: integer; //N(3)
    IND_HOME_DISP: string; //C(1)
    IND_SERV_DISP: string; //C(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX410.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(PAIS, 3);
  addCampo(IND_HOME_DISP);
  addCampo(IND_SERV_DISP);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
