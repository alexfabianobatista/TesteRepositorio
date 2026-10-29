unit PisCofinsM611;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsM611 = class(TRegistro)
  private
  public
    IND_TIP_COOP: Integer; //N(2)
    VL_BC_CONT_ANT_EXC_COOP: Double; //N(X,2)
    VL_EXC_COOP_GER: Double; //N(X,2)
    VL_EXC_ESP_COOP: Double; //N(X,2)
    VL_BC_CONT: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsM611.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_TIP_COOP, 2);
  addCampo(VL_BC_CONT_ANT_EXC_COOP, 2);
  addCampo(VL_EXC_COOP_GER, 2);
  addCampo(VL_EXC_ESP_COOP, 2);
  addCampo(VL_BC_CONT, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
