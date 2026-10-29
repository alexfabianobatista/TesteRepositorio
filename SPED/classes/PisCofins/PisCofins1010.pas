unit PisCofins1010;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins1010 = class(TRegistro)
  private
  public
    NUM_PROC: String; //C(20)
    ID_SEC_JUD: String; //C
    ID_VARA: String; //C(2)
    ID_NAT_ACAO: String; //C(2)
    DESC_DEC_JUD: String; //C(100)
    DT_SENT_JUD: TDate; //N(8)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins1010 }

procedure TPisCofins1010.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_PROC, 20);
  addCampo(ID_SEC_JUD);
  addCampo(ID_VARA, 2);
  addCampo(ID_NAT_ACAO, 2);
  addCampo(DESC_DEC_JUD, 100);
  addCampo(DT_SENT_JUD, 'D');

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

