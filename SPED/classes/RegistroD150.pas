unit RegistroD150;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD150 = Class (TRegistro)
    private
    public
      COD_MUN_ORIG: Integer; //C(7)
      COD_MUN_DEST: Integer; //C(7)
      VEIC_ID: String; //C
      VIAGEM: Integer; //N
      IND_TFA: String; //C(1)
      VL_PESO_TX: Double; //N(X,2)
      VL_TX_TERR: Double; //N(X,2)
      VL_TX_RED: Double; //N(X,2)
      VL_OUT: Double; //N(X,2)
      VL_TX_ADV: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD150 }

procedure TRegistroD150.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MUN_ORIG, 7);
  addCampo(COD_MUN_DEST, 7);
  addCampo(VEIC_ID);
  addCampo(VIAGEM, 0);
  addCampo(IND_TFA, 1);
  addCampo(VL_PESO_TX, 2);
  addCampo(VL_TX_TERR, 2);
  addCampo(VL_TX_RED, 2);
  addCampo(VL_OUT, 2);
  addCampo(VL_TX_ADV, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
