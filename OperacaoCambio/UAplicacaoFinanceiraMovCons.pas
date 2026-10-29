unit UAplicacaoFinanceiraMovCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFAplicacaoFinanceiraMovCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAplicacaoFinanceiraMovCons: TFAplicacaoFinanceiraMovCons;

implementation

uses UAplicacaoFinanceira_cl;

{$R *.dfm}

procedure TFAplicacaoFinanceiraMovCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMAplicacaoFinanceira.QAplicacaoFinanceiraMovCons.Close;
  DMAplicacaoFinanceira.QAplicacaoFinanceiraMovCons.SetVariable('COD_APLICACAO',METexto.Text);
  DMAplicacaoFinanceira.QAplicacaoFinanceiraMovCons.Open;
end;

procedure TFAplicacaoFinanceiraMovCons.FormActivate(Sender: TObject);
begin
  inherited;
  DMAplicacaoFinanceira.QAplicacaoFinanceira.Close;
  DMAplicacaoFinanceira.QAplicacaoFinanceira.SetVariable('PK',DMAplicacaoFinanceira.QAplicacaoFinanceiraConsCod_Aplicacao_Financeira.Value);
  DMAplicacaoFinanceira.QAplicacaoFinanceira.Open;
  METexto.Text := DMAplicacaoFinanceira.QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Text;
end;

end.
