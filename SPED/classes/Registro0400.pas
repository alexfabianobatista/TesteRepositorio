unit Registro0400;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro0400 = Class (TRegistro)
    private
    public
      COD_NAT: String; //C
      DESCR_NAT: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0400 }

procedure TRegistro0400.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_NAT);
  addCampo(DESCR_NAT);

  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
