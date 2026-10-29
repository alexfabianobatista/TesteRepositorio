unit RegistroI050;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI050 = Class (TRegistro)
    private
    public
      DT_ALT: TDate; //N(8)
      COD_NAT: String; //C(2)
      IND_CTA: String; //C(1)
      NIVEL: Integer; //N
      COD_CTA: String; //C
      COD_CTA_SUP: String; //C
      CTA: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI050 }

procedure TRegistroI050.grava;
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
