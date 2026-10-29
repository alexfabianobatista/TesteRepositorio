unit ContFiscY520;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY520 = class(TRegistro)
  private

  public
    TIP_EXT: string; //C(1)
    PAIS: integer; //N(3)
    FORMA: integer; //N(1)
    NAT_OPER: integer; //N(5)
    VL_PERIODO: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY520.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(TIP_EXT);
  addCampo(PAIS, 3);
  addCampo(FORMA, 1);
  addCampo(NAT_OPER, 5);
  addCampo(VL_PERIODO, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
