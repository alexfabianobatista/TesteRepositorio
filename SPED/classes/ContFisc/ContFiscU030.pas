unit ContFiscU030;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscU030 = class(TRegistro)
  private

  public
    DT_INI: tdate; //C(8)
    DT_FIN: tdate; //C(8)
    PER_APUR: string; //C(3)


    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscU030.grava;
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
