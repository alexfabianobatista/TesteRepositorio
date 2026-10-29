unit Registro0190;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro0190 = Class (TRegistro)
    private
    public
      UNID: String; //C
      DESCR: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0190 }

procedure TRegistro0190.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(UNID);
  addCampo(DESCR);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
