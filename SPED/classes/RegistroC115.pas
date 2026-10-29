unit RegistroC115;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC115 = Class (TRegistro)
    private
    public
      IND_CARGA: Integer; //C(1)
      CNPJ_COL: String; //N(14)
      IE_COL: String; //C
      CPF_COL: String; //N(11)
      COD_MUN_COL: Integer; //N(7)
      CNPJ_ENTG: String; //N(14)
      IE_ENTG: String; //C
      CPF_ENTG: String; //N(11)
      COD_MUN_ENTG: Integer; //N(7)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC115 }

procedure TRegistroC115.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_CARGA, 1);
  addCampo(CNPJ_COL, 14);
  addCampo(IE_COL);
  addCampo(CPF_COL, 11);
  addCampo(COD_MUN_COL, 7);
  addCampo(CNPJ_ENTG, 14);
  addCampo(IE_ENTG);
  addCampo(CPF_ENTG, 11);
  addCampo(COD_MUN_ENTG, 7);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
