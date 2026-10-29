unit FContI050;

interface

uses Arquivo, Registro, Controls;

type
  TFContI050 = class(TRegistro)
  private
  public
    DT_ALT: TDate; //N(8)
    COD_NAT: string; //C(2)
    IND_CTA: string; //C(1)
    NIVEL: Integer; //N
    COD_CTA: string; //C
    COD_CTA_SUP: string; //C
    CTA: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContI050 }

procedure TFContI050.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_ALT, 'D');
  addCampo(COD_NAT, 2);
  addCampo(IND_CTA, 1);
  addCampo(NIVEL, 0);
  addCampo(COD_CTA);
  addCampo(COD_CTA_SUP);
  addCampo(CTA);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

