unit ContFisc9900;

interface

uses Arquivo, Controls, Registro;

type
  TContFisc9900 = class(TRegistro)
  private

  public
    REG_BLC: string; //C(4)
    QTD_REG_BLC: integer; //C
    VERSAO: string; //C(4)
    ID_TAB_DIN: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFisc9900.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(REG_BLC);
  addCampo(QTD_REG_BLC, 1);
  addCampo(VERSAO);
  addCampo(ID_TAB_DIN);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
