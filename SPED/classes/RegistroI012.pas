unit RegistroI012;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI012 = Class (TRegistro)
    private
    public
      NUM_ORD: Integer; //N
      NAT_LIVR: String; //C(8)
      TIPO: Integer; //N(1)
      COD_HASH_AUX: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI012 }

procedure TRegistroI012.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_ORD, 0);
  addCampo(NAT_LIVR, 8);
  addCampo(TIPO, 1);
  addCampo(COD_HASH_AUX);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
