unit RegistroD350;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD350 = Class (TRegistro)
    private
    public
      COD_MOD: String; //C(2)
      ECF_MOD: String; //C
      ECF_FAB: String; //C
      ECF_CX: Double; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD350 }

procedure TRegistroD350.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(ECF_MOD);
  addCampo(ECF_FAB);
  addCampo(ECF_CX, 0);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
