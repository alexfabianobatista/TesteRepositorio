unit PisCofins0500;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofins0500 = class(TRegistro)
  private
  public
    DT_ALT: TDate; //N(8)
    COD_NAT_CC: string; //C(2)
    IND_CTA: string; //C(1)
    NIVEL: Integer; //N(5)
    COD_CTA: string; //C(60)
    NOME_CTA: string; //C(60)
    COD_CTA_REF: string; //C(60)
    CNPJ_EST: string; //N(14)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TPisCofins0500 }

procedure TPisCofins0500.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_ALT, 'D');
  addCampo(COD_NAT_CC, 2);
  addCampo(IND_CTA, 1);
  addCampo(NIVEL, 5);
  addCampo(COD_CTA, 60);
  addCampo(NOME_CTA, 60);
  addCampo(COD_CTA_REF, 60);
  addCampo(SomenteNumeros(CNPJ_EST), 14);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
