unit RegistroI510;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroI510 = Class (TRegistro)
    private
    public
      NM_CAMPO: String; //C(16)
      DESC_CAMPO: String; //C(50)
      TIPO_CAMPO: String; //C(1)
      TAM_CAMPO: Integer; //N(3)
      DEC_CAMPO: Integer; //N(2)
      COL_CAMPO: Integer; //N(3)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroI510 }

procedure TRegistroI510.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NM_CAMPO, 16);
  addCampo(DESC_CAMPO, 50);
  addCampo(TIPO_CAMPO, 1);
  addCampo(TAM_CAMPO, 3);
  addCampo(DEC_CAMPO, 2);
  addCampo(COL_CAMPO, 3);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
