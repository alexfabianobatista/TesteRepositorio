unit RegistroC110;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC110 = Class (TRegistro)
    private
    public
      COD_INF: String; //C
      TXT_COMPL: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC110 }

procedure TRegistroC110.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_INF);
  addCampo(TXT_COMPL);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
