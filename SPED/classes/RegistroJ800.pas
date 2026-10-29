unit RegistroJ800;

interface

uses Arquivo, Registro, Controls, SysUtils;

type
  TRegistroJ800 = Class (TRegistro)
    private
    public
      TIPO_DOC: String; //C(003)
      DESC_RTF: String; //C(n)
      HASH_RTF: String; //C(41) // Preenchido pelo PVA
      ARQ_RTF: String; //C(65535)
      IND_FIM_RTF: String; //C(7)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroJ800 }

procedure TRegistroJ800.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(TIPO_DOC, 3);
  addCampo(DESC_RTF);
  addCampo('');
  addCampo(Trim(ARQ_RTF), Length(ARQ_RTF));
  addCampo(IND_FIM_RTF, 7);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
