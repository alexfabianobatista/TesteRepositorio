unit FCont9001;

interface

uses Arquivo, Registro, Controls;

type
  TFCont9001 = class(TRegistro)
  private
  public
    IND_MOV: Integer; //N(1)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TFCont9001 }

procedure TFCont9001.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_MOV, 1);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
