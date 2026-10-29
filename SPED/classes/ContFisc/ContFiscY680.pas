unit ContFiscY680;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY680 = class(TRegistro)
  private

  public
    MES: string; //C(2)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY680.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(MES);

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
