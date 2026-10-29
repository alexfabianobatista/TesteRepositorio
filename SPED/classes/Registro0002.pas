unit Registro0002;

interface

uses Arquivo, Registro, Controls;

type
  TFiscal0002 = Class (TRegistro)
    private
    public
      CLAS_ESTAB_IND: String; //N(2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0002 }

procedure TFiscal0002.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(CLAS_ESTAB_IND, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;


end.
