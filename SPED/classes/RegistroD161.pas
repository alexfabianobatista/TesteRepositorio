unit RegistroD161;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD161 = Class (TRegistro)
    private
    public
      IND_CARGA: Integer; //N(1)
      CNPJ_COL: String; //N(14)
      IE_COL: String; //C
      COD_MUN_COL: Integer; //N(7)
      CNPJ_ENTG: String; //N(14)
      IE_ENTG: String; //C
      COD_MUN_ENTG: Integer; //N(7)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD161 }

procedure TRegistroD161.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_CARGA, 1);
  addCampo(CNPJ_COL, 14);
  addCampo(IE_COL);
  addCampo(COD_MUN_COL, 7);
  addCampo(CNPJ_ENTG, 14);
  addCampo(IE_ENTG);
  addCampo(COD_MUN_ENTG, 7);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
