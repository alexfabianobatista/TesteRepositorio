unit ContFiscX430;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX430 = class(TRegistro)
  private

  public
    PAIS: integer; //N(3)
    VL_SERV_ASSIST: double; //N(x,2)
    VL_SERV_SEM_ASSIST: double; //N(19,2)
    VL_SERV_SEM_ASSIST_EXT: double; //N(19,2)
    VL_JURO: double; //N(19,2)
    VL_DEMAIS_JUROS: double; //N(19,2)
    VL_DIVID: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX430.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(PAIS, 3);
  addCampo(VL_SERV_ASSIST, 2);
  addCampo(VL_SERV_SEM_ASSIST, 2);
  addCampo(VL_SERV_SEM_ASSIST_EXT, 2);
  addCampo(VL_JURO, 2);
  addCampo(VL_DEMAIS_JUROS, 2);
  addCampo(VL_DIVID, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
