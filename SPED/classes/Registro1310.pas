unit Registro1310;

interface

uses Arquivo, Registro, Controls;

type
  TRegistro1310 = Class (TRegistro)
    private
    public
      NUM_TANQUE: String; //C
      BOMBA: String; //C
      BICO: Integer; //N
      FECHA: Double; //N(X,3)
      ABERT: Double; //N(X,3)
      AFERI: Double; //N(X,3)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro1310 }

procedure TRegistro1310.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(NUM_TANQUE);
  addCampo(BOMBA);
  addCampo(BICO, 0);
  addCampo(FECHA, 3);
  addCampo(ABERT, 3);
  addCampo(AFERI, 3);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
