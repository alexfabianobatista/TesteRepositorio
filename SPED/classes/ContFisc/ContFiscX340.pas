unit ContFiscX340;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscX340 = class(TRegistro)
  private

  public
    RAZ_SOCIAL: string; //C
    NIF: string; //C
    IND_CONTROLE: integer; //N(1)
    PAIS: integer; //(3)
    IND_ISEN_PETR: string; //C
    IND_CONSOL: string; //C(1)
    MOT_NAO_CONSOL: integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscX340.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(RAZ_SOCIAL);
  addCampo(NIF);
  addCampo(IND_CONTROLE, 1);
  addCampo(PAIS, 3);
  addCampo(IND_ISEN_PETR);
  addCampo(IND_CONSOL);
  addCampo(MOT_NAO_CONSOL, 1);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
