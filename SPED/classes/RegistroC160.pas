unit RegistroC160;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC160 = Class (TRegistro)
    private
    public
      COD_PART: String; //C
      VEIC_ID: String; //C(7)
      QTD_VOL: Integer; //N
      PESO_BRT: Double; //N(X,2)
      PESO_LIQ: Double; //N(X,2)
      UF_ID: String; //C(2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC160 }

procedure TRegistroC160.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_PART);
  addCampo(Limpa(VEIC_ID), 7);
  addCampo(QTD_VOL, 1);
  addCampo(PESO_BRT, 2);
  addCampo(PESO_LIQ, 2);
  addCampo(UF_ID, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
