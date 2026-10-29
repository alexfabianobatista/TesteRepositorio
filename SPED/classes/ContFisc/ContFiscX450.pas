unit ContFiscX450;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX450 = class(TRegistro)
  private

  public
    PAIS: integer; //N(3)
    VL_SERV_ASSIST: double; //N(19,2)
    VL_SERV_SEM_ASSIST: double; //N(19,2)
    VL_SERV_SEM_ASSIST_EXT: double; //N(19,2)
    VL_JURO_PF: double; //N(19,2)
    VL_JURO_PJ: double; //N(19,2)
    VL_DEMAIS_JUROS: double; //N(19,2)
    VL_DIVID_PF: double; //N(19,2)
    VL_DIVID_PJ: double; //N(19,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX450.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(PAIS, 3);
  addCampo(VL_SERV_ASSIST, 2);
  addCampo(VL_SERV_SEM_ASSIST, 2);
  addCampo(VL_SERV_SEM_ASSIST_EXT, 2);
  addCampo(VL_JURO_PF, 2);
  addCampo(VL_JURO_PJ, 2);
  addCampo(VL_DEMAIS_JUROS, 2);
  addCampo(VL_DIVID_PJ, 2);
  addCampo(VL_DIVID_PJ, 2);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
