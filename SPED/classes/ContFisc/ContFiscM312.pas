unit ContFiscM312;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscM312 = class(TRegistro)
  private

  public
    NUM_LCTO: string; //C(50)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscM312.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(NUM_LCTO);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;

end.
