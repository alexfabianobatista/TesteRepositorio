unit RegistroI075;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI075 = Class (TRegistro)
    private
    public
      COD_HIST: String; //C
      DESCR_HIST: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI075 }

procedure TRegistroI075.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_HIST);
  addCampo(DESCR_HIST);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
