unit RegistroI100;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI100 = Class (TRegistro)
    private
    public
      DT_ALT: TDate; //N(8)
      COD_CCUS: String; //C
      CCUS: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI100 }

procedure TRegistroI100.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_ALT, 'D');
  addCampo(COD_CCUS);
  addCampo(CCUS);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
