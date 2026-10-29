unit ContFiscX280;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX280 = class(TRegistro)
  private

  public
    IND_ATIV: string; //C(2)
    IND_PROJ: string; //C(2)
    ATO_CONC: string; //C(30)
    VIG_INI: tdate; //C(8)
    VIG_FIM: tdate; //C(8)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX280.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(IND_ATIV);
  addCampo(IND_PROJ);
  addCampo(ATO_CONC);
  addCampo(VIG_INI, 'D');
  addCampo(VIG_FIM, 'D');

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
