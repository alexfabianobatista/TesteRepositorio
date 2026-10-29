unit ContFiscL030;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscL030 = class(TRegistro)
  private

  public
    DT_INI: TDate; //N(8)
    DT_FIN: TDate; //N(8)
    PER_APUR: String; //C(3)
    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscL030.grava;
begin
  inherited
  addCampo(bloco + registro);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIN, 'D');
  addCampo(PER_APUR, 3);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;
end;

end.
