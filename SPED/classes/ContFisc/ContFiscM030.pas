unit ContFiscM030;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscM030 = class(TRegistro)
  private

  public
    DT_INI: TDate; //N(8)
    DT_FIN: TDate; //N(8)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscM030.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIN, 'D');      

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
