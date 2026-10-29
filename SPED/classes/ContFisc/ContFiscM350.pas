unit ContFiscM350;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscM350 = class(TRegistro)
  private

  public
    CODIGO: string; //C
    DESCRICAO: string; //C
    TIPO_LANCAMENTO: string; //C(1)
    IND_RELACAO: integer; //N(1)
    VALOR: double; //N(19,2)
    HIST_LAN_LAL: string; //C(500)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscM350.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CODIGO);
  addCampo(DESCRICAO);
  addCampo(TIPO_LANCAMENTO, 1);
  addCampo(IND_RELACAO, 1);
  addCampo(VALOR, 2);
  addCampo(HIST_LAN_LAL);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;

end.
