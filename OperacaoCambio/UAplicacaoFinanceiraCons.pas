unit UAplicacaoFinanceiraCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFAplicacaoFinanceiraCons = class(TFTConsulta)
    MEDepartamentoCons: TMaskEdit;
    SBDepartamentoCons: TSpeedButton;
    EdDepartamentoCons: TEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    MEDt_Aplicacao_I: TMaskEdit;
    MeDt_Aplicacao_F: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    MEDt_Vencimento_I: TMaskEdit;
    MEDt_Vencimento_F: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    MEContaCorrenteCons: TMaskEdit;
    SBContaCorrenteCons: TSpeedButton;
    EdContaCorrenteCons: TEdit;
    MEHistoricoCons: TMaskEdit;
    SBHistoricoCons: TSpeedButton;
    EdHistoricoCons: TEdit;
    Label9: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure SBDepartamentoConsClick(Sender: TObject);
    procedure MEDepartamentoConsExit(Sender: TObject);
    procedure SBContaCorrenteConsClick(Sender: TObject);
    procedure SBHistoricoConsClick(Sender: TObject);
    procedure MEContaCorrenteConsExit(Sender: TObject);
    procedure MEHistoricoConsExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAplicacaoFinanceiraCons: TFAplicacaoFinanceiraCons;

implementation

uses UAplicacaoFinanceira_cl, UDepartamentoCons, UDepartamento_cl,
  UOracle_cl, UFilialCons, UFilial_cl, UContaCorrenteCons,
  UBancoAgencia_cl, UHistoricoCons, UHistorico_cl;

{$R *.dfm}

procedure TFAplicacaoFinanceiraCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMAplicacaoFinanceira do
  Begin
    QAplicacaoFinanceiraCons.Close;

    If Trim(MEDepartamentoCons.text)<>'' then
      QAplicacaoFinanceiraCons.SetVariable('DEPARTAMENTO',Trim(MEDepartamentoCons.Text))
    Else
      QAplicacaoFinanceiraCons.SetVariable('DEPARTAMENTO',Null);

    If Trim(MEContaCorrenteCons.text)<>'' then
      QAplicacaoFinanceiraCons.SetVariable('CONTA_CORRENTE',Trim(MEContaCorrenteCons.Text))
    Else
      QAplicacaoFinanceiraCons.SetVariable('CONTA_CORRENTE',Null);

    If Trim(MEHistoricoCons.text)<>'' then
      QAplicacaoFinanceiraCons.SetVariable('HISTORICO',Trim(MEHistoricoCons.Text))
    Else
      QAplicacaoFinanceiraCons.SetVariable('HISTORICO',Null);    

    If ((Trim(MEDt_Aplicacao_I.text)<>'') and (Trim(MEDt_Aplicacao_F.text)<>'')) then
    Begin
      QAplicacaoFinanceiraCons.SetVariable('DT_APLICACAO_I',Trim(MEDt_Aplicacao_I.text));
      QAplicacaoFinanceiraCons.SetVariable('DT_APLICACAO_F',Trim(MEDt_Aplicacao_F.Text));
    end
    Else
    Begin
      QAplicacaoFinanceiraCons.SetVariable('DT_APLICACAO_I',Null);
      QAplicacaoFinanceiraCons.SetVariable('DT_APLICACAO_F',Null);
    end;

    If ((Trim(MEDt_Vencimento_I.text)<>'') and (Trim(MEDt_Vencimento_F.text)<>'')) then
    Begin
      QAplicacaoFinanceiraCons.SetVariable('DT_VENCIMENTO_I',Trim(MEDt_Vencimento_I.text));
      QAplicacaoFinanceiraCons.SetVariable('DT_VENCIMENTO_F',Trim(MEDt_Vencimento_F.Text));
    end
    Else
    Begin
      QAplicacaoFinanceiraCons.SetVariable('DT_VENCIMENTO_I',Null);
      QAplicacaoFinanceiraCons.SetVariable('DT_VENCIMENTO_F',Null);
    end;

    QAplicacaoFinanceiraCons.Open;
  End;

end;

procedure TFAplicacaoFinanceiraCons.SBDepartamentoConsClick(
  Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = nil Then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk Then
  begin
    MEDepartamentoCons.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Text;
    MEDepartamentoConsExit(Self);
  end;   
end;

procedure TFAplicacaoFinanceiraCons.MEDepartamentoConsExit(
  Sender: TObject);
begin
  inherited;
  if trim(MEDepartamentoCons.Text) <> '' then
    edDepartamentoCons.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + MEDepartamentoCons.Text)
  else
    edDepartamentoCons.Text := 'Todos';
end;

procedure TFAplicacaoFinanceiraCons.SBContaCorrenteConsClick(
  Sender: TObject);
begin
  inherited;
  If (FContaCorrenteCons = nil) Then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If (FContaCorrenteCons.ShowModal = mrOk) Then
  begin
    MEContaCorrenteCons.Text := floattostr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    MEContaCorrenteConsExit(Self);
  end;
end;

procedure TFAplicacaoFinanceiraCons.SBHistoricoConsClick(Sender: TObject);
begin
  inherited;
  If (FHistoricoCons = nil) Then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  If (FHistoricoCons.ShowModal = mrOk) Then
  begin
    MEHistoricoCons.Text := floattostr(DMHistorico.QHistoricoConsCOD_HISTORICO.Value);
    MEHistoricoConsExit(Self);
  end; 
end;

procedure TFAplicacaoFinanceiraCons.MEContaCorrenteConsExit(Sender: TObject);
begin
  inherited;
  if trim(MEContaCorrenteCons.Text) <> '' then
    EdContaCorrenteCons.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + MEContaCorrenteCons.Text)
  else
    EdContaCorrenteCons.Text := 'Todas';
end;

procedure TFAplicacaoFinanceiraCons.MEHistoricoConsExit(Sender: TObject);
begin
  inherited;
  if trim(MEHistoricoCons.Text) <> '' then
    EdHistoricoCons.Text := DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = ' + MEHistoricoCons.Text)
  else
    EdHistoricoCons.Text := 'Todos';
end;

end.
