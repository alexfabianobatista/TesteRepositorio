unit RegistroC174;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC174 = Class (TRegistro)
    private
    public
      IND_ARM: String; //C(1)
      NUM_ARM: String; //C
      DESC_COMPL: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC174 }

procedure TRegistroC174.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_ARM, 1);
  addCampo(NUM_ARM);
  addCampo(DESC_COMPL);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
