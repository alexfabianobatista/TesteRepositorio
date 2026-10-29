unit RegistroD530;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD530 = Class (TRegistro)
    private
    public
      IND_SERV: String; //C(1)
      DT_INI_SERV: TDate; //N(8)
      DT_FIN_SERV: TDate; //N(8)
      PER_FISCAL: Integer; //N(6)
      COD_AREA: String; //C
      TERMINAL: Integer; //N

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD530 }

procedure TRegistroD530.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_SERV, 1);
  addCampo(DT_INI_SERV, 'D');
  addCampo(DT_FIN_SERV, 'D');
  addCampo(PER_FISCAL, 6);
  addCampo(COD_AREA);
  addCampo(TERMINAL, 0);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
