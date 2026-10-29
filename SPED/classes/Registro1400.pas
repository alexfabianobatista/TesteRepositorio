unit Registro1400;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro1400 = Class (TRegistro)
    private
    public
      COD_ITEM: String; //C
      MUN: Integer; //N(7)
      VALOR: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro1400 }

procedure TRegistro1400.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_ITEM);
  addCampo(MUN, 7);
  addCampo(VALOR, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
