unit Registro0205;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro0205 = Class (TRegistro)
    private
    public
      DESCR_ANT_ITEM: String; //C
      DT_INI: TDate; //N(8)
      DT_FIM: TDate; //N(8)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0205 }

procedure TRegistro0205.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DESCR_ANT_ITEM);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIM, 'D');

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
