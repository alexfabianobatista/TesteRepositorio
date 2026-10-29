unit RegistroD170;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD170 = Class (TRegistro)
    private
    public
      COD_PART_CONSIG: String; //C
      COD_PART_RED: String; //C
      COD_MUN_ORIG: Integer; //N(7)
      COD_MUN_DEST: Integer; //N(7)
      OTM: String; //C
      IND_NAT_FRT: String; //C(1)
      VL_LIQ_FRT: Double; //N(X,2)
      VL_GRIS: Double; //N(X,2)
      VL_PDG: Double; //N(X,2)
      VL_OUT: Double; //N(X,2)
      VL_FRT: Double; //N(X,2)
      VEIC_ID: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD170 }

procedure TRegistroD170.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_PART_CONSIG);
  addCampo(COD_PART_RED);
  addCampo(COD_MUN_ORIG, 7);
  addCampo(COD_MUN_DEST, 7);
  addCampo(OTM);
  addCampo(IND_NAT_FRT, 1);
  addCampo(VL_LIQ_FRT, 2);
  addCampo(VL_GRIS, 2);
  addCampo(VL_PDG, 2);
  addCampo(VL_OUT, 2);
  addCampo(VL_FRT, 2);
  addCampo(VEIC_ID);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
