unit RegistroC195;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC195 = Class (TRegistro)
    private
    public
      COD_OBS: String; //C
      TXT_COMPL: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC195 }

procedure TRegistroC195.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_OBS);
  addCampo(TXT_COMPL);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
