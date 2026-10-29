unit Registro0175;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro0175 = Class (TRegistro)
    private
    public
      DT_ALT: TDate; //N(8)
      NR_CAMPO: Integer; //C(2)
      CONT_ANT: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0175 }

procedure TRegistro0175.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_ALT, 'D');
  addCampo(NR_CAMPO, 0);
  addCampo(CONT_ANT);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
