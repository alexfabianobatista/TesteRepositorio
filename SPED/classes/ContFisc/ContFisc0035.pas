unit ContFisc0035;

interface

uses Arquivo, Controls, Registro;

type
  TContFisc0035 = Class(TRegistro)
  private

  public
    COD_SCP: String; //C(14)
    NOME_SCP: String;

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFisc0035.grava;
begin

  inherited

  addCampo(bloco + registro);
  addCampo(COD_SCP);
  addCampo(NOME_SCP);

  gravaLinha(arquivoPadrao, TRegistro(self));
  afterGravacao;
  
end;

end.
