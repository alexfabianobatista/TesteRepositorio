unit PisCofins1020;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins1020 = class(TRegistro)
  private
  public
    NUM_PROC: string; //C(20)
    ID_NAT_ACAO: string; //C(2)
    DT_DEC_ADM: TDate; //N(8)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins1020 }

procedure TPisCofins1020.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_PROC, 20);
  addCampo(ID_NAT_ACAO, 2);
  addCampo(DT_DEC_ADM, 'D');

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
