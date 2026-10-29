unit ContFiscX330;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX330 = class(TRegistro)
  private

  public
    NOME: string; //C
    PAIS: integer; //N(3)
    VL_OPER: double; //N(19,2)
    COD_PES: integer; //N(2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX330.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(NOME);
  addCampo(PAIS, 3);
  addCampo(VL_OPER, 2);
  addCampo(COD_PES, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
