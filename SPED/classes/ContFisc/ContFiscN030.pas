unit ContFiscN030;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscN030 = class(TRegistro)
  private

  public
    DT_INI: tdate; //N(8)
    DT_FIN: tdate; //N(8)
    PER_APUR: string; //C(30)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscN030.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIN, 'D');
  addCampo(PER_APUR);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
