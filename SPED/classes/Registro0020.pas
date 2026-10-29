unit Registro0020;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro0020 = Class (TRegistro)
    private
    public
      IND_DEC: Integer; //N(1)
      CNPJ: String; //N(14)
      UF: String; //C(2)
      IE: String; //C
      COD_MUN: Integer; //N(7)
      IM: String; //C
      NIRE: String; //N(11)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0020 }

procedure TRegistro0020.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_DEC, 1);
  addCampo(CNPJ, 14);
  addCampo(UF, 2);
  addCampo(SomenteNumeros(IE));
  addCampo(COD_MUN, 7);
  addCampo(IM);
  addCampo(NIRE, 11);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
