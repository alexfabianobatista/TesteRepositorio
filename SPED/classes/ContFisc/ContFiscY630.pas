unit ContFiscY630;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY630 = class(TRegistro)
  private

  public
    CNPJ: string; //C(14)
    QTE_QUOT: string; //C
    QTE_QUOTA: string; //C
    PATR_FIN_PER: double; //N(19,2)
    DAT_ABERT: tdate; //C(8)
    DAT_ENCER: tdate; //C(8)

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY630.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(CNPJ);
  addCampo(QTE_QUOT);
  addCampo(QTE_QUOTA);
  addCampo(PATR_FIN_PER, 2);
  addCampo(DAT_ABERT, 'D');
  addCampo(DAT_ENCER, 'D');

  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
