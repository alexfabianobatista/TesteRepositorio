unit RegistroC400;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC400 = Class (TRegistro)
    private
    public
      COD_MOD: String; //C(2)
      ECF_MOD: String; //C
      ECF_FAB: String; //C
      ECF_CX: Integer; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC400 }

procedure TRegistroC400.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD);
  addCampo(ECF_MOD);
  addCampo(ECF_FAB);
  addCampo(ECF_CX, 0);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
