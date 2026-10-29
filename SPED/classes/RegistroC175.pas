unit RegistroC175;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC175 = Class (TRegistro)
    private
    public
      IND_VEIC_OPER: String; //C(1)
      CNPJ: String; //N(14)
      UF: String; //C(2)
      CHASSI_VEIC: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC175 }

procedure TRegistroC175.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_VEIC_OPER, 1);
  addCampo(CNPJ, 14);
  addCampo(UF, 2);
  addCampo(CHASSI_VEIC);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
