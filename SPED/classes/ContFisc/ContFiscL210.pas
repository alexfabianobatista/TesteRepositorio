unit ContFiscL210;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscL210 = class(TRegistro)
  private

  public
    CODIGO: String; //C
    DESCRICAO: String; //C
    VALOR: Double; //N(19,2)
    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscL210.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CODIGO);
  addCampo(DESCRICAO);
  addCampo(VALOR, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
