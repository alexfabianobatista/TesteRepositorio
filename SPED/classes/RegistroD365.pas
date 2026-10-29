unit RegistroD365;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD365 = Class (TRegistro)
    private
    public
      COD_TOT_PAR: String; //C
      VLR_ACUM_TOT: Double; //N(X,2)
      NR_TOT: Integer; //N(2)
      DESCR_NR_TOT: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD365 }

procedure TRegistroD365.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_TOT_PAR);
  addCampo(VLR_ACUM_TOT, 2);
  addCampo(NR_TOT, 2);
  addCampo(DESCR_NR_TOT);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
