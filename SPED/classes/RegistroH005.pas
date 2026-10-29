unit RegistroH005;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroH005 = Class (TRegistro)
    private
    public
      DT_INV: TDate; //N(8)
      VL_INV: Double; //N(X,2)
      MOT_INV: String;

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroH005 }

procedure TRegistroH005.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_INV, 'D');
  addCampo(VL_INV, 2);
  addCampo(MOT_INV);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
