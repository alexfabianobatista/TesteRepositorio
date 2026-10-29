unit RegistroC112;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC112 = Class (TRegistro)
    private
    public
      COD_DA: String; //C(1)
      UF: String; //C(2)
      NUM_DA: String; //C
      COD_AUT: String; //C
      VL_DA: Double; //N(X,2)
      DT_VCTO: TDate; //N(8)
      DT_PGTO: TDate; //N(8)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC112 }

procedure TRegistroC112.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_DA, 1);
  addCampo(UF, 2);
  addCampo(NUM_DA);
  addCampo(COD_AUT);
  addCampo(VL_DA, 2);
  addCampo(DT_VCTO, 'D');
  addCampo(DT_PGTO, 'D');
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
