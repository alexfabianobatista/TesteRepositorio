unit UAplicacaoFinanceiraParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask,
  UFmHistorico, UFmFilial, UFmDepartamento;

type
  TFAplicacaoFinanceiraParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label97: TLabel;
    ME1ContaCorrente: TMaskEdit;
    SB1ContaCorrente: TSpeedButton;
    Ed1ContaCorrente: TEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    ME1DtAplicacaoI: TMaskEdit;
    ME1DtAplicacaoF: TMaskEdit;
    FmFilial1: TFmFilial;
    FmHistorico1: TFmHistorico;
    FmDepartamento1: TFmDepartamento;
    Rg1Opcao: TRadioGroup;
    procedure SB1ContaCorrenteClick(Sender: TObject);
    procedure FmFilial1BtFilialClick(Sender: TObject);
    procedure ME1ContaCorrenteExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAplicacaoFinanceiraParam: TFAplicacaoFinanceiraParam;

implementation

uses UContaCorrenteCons, UOracle_cl, UBancoAgencia_cl;

{$R *.dfm}

procedure TFAplicacaoFinanceiraParam.SB1ContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);

  if FContaCorrenteCons.showmodal = mrok then
    ME1ContaCorrente.Text := IntToStr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    ME1COntaCorrenteExit(self);
end;

procedure TFAplicacaoFinanceiraParam.FmFilial1BtFilialClick(
  Sender: TObject);
begin
  inherited;
  FmFilial1.BtFilialClick(Sender);

end;

procedure TFAplicacaoFinanceiraParam.ME1ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(ME1ContaCorrente.Text) <> '' then
    Ed1ContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + Trim(ME1ContaCorrente.Text))
  else
    Ed1ContaCorrente.Text := 'Todas';

end;

end.
