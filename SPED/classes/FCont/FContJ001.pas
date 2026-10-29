unit FContJ001;

interface

uses Arquivo, Registro, Controls;

type
  TFContJ001 = class(TRegistro)
  private
  public
    IND_DAD: Integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFContJ001 }

procedure TFContJ001.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);
  
  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
