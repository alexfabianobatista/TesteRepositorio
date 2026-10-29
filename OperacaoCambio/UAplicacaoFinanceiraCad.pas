unit UAplicacaoFinanceiraCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids;

type
  TFAplicacaoFinanceiraCad = class(TFTCadSimples)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SBDepartamentoCons: TSpeedButton;
    SBCCCons: TSpeedButton;
    SBHistoricoCons: TSpeedButton;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    Opes1: TMenuItem;
    BaixaAplicao1: TMenuItem;
    DBEdit12: TDBEdit;
    Label12: TLabel;
    DBDirceu1: TDBDirceu;
    DBGrid1: TDBGrid;
    VoltaBaixa1: TMenuItem;
    ListadeAplicaes1: TMenuItem;
    DBEdit10: TDBEdit;
    DBDirceu5: TDBDirceu;
    SbFilial: TSpeedButton;
    Label7: TLabel;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBDepartamentoConsClick(Sender: TObject);
    procedure SBCCConsClick(Sender: TObject);
    procedure SBHistoricoConsClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BaixaAplicao1Click(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure VoltaBaixa1Click(Sender: TObject);
    procedure SbFilialClick(Sender: TObject);
    procedure ListadeAplicaes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAplicacaoFinanceiraCad: TFAplicacaoFinanceiraCad;

implementation

uses UAplicacaoFinanceira_cl, UFilialCons, UDepartamentoCons,
  UContaCorrenteCons, UHistoricoCons, UFilial_cl, UDepartamento_cl,
  UHistorico_cl, UBancoAgencia_cl, UOracle_cl, UAplicacaoFinanceiraCons,
  UAplicacaoFinanceiraMov, UAplicacaoFinanceiraMovCons,
  UAplicacaoFinanceiraVoltaMov, UAplicacaoFinanceiraParam,
  UOperacaoCambioParam, URAplicacaoFinanceira, UOperacaoCambio_cl;

{$R *.dfm}

procedure TFAplicacaoFinanceiraCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMAplicacaoFinanceira.QAplicacaoFinanceira.open;
end;

procedure TFAplicacaoFinanceiraCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMAplicacaoFinanceira.QAplicacaoFinanceira.open; 
end;

procedure TFAplicacaoFinanceiraCad.SBDepartamentoConsClick(
  Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application); 
  if FDepartamentoCons.showmodal = mrok then
    DMAplicacaoFinanceira.QAplicacaoFinanceiraCOD_DEPARTAMENTO.Value := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Value;
end;

procedure TFAplicacaoFinanceiraCad.SBCCConsClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);

  if FContaCorrenteCons.showmodal = mrok then
    DMAplicacaoFinanceira.QAplicacaoFinanceiraCOD_CONTA_CORRENTE.Value := DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value;
    DMAPlicacaoFinanceira.QAplicacaoFinanceiraCOD_BANCO.Value := DMBancoAgencia.QContaCorrenteConsCOD_BANCO_AGENCIA.Value;
end;

procedure TFAplicacaoFinanceiraCad.SBHistoricoConsClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.create(application);

  if FHistoricoCons.showmodal = mrok then
    DMAplicacaoFinanceira.QAplicacaoFinanceiraCOD_HISTORICO.Value := DMHistorico.QHistoricoConsCOD_HISTORICO.Value;
end;

procedure TFAplicacaoFinanceiraCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBAlterar.Enabled := False;
  if DSPrimario.State in [dsEdit, dsInsert] then
  begin
    SBCCCons.Enabled            := true;
    SBDepartamentoCons.Enabled  := true;
    SBHistoricoCons.Enabled     := true;
    SbFilial.Enabled            := true;
  end
  else
  begin
    SBCCCons.Enabled            := false;
    SBDepartamentoCons.Enabled  := false;
    SBHistoricoCons.Enabled     := false;
    SbFilial.Enabled            := False;
  end;

  //If DSPrimario.State in [dsInsert] then
  //  DMAplicacaoFinanceira.QAplicacaoFinanceiraVAL_ORIGINAL.Value := DMAplicacaoFinanceira.QAplicacaoFinanceiraVAL_APLICADO.Value;

end;

procedure TFAplicacaoFinanceiraCad.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  If Trim(DBEdit8.Text) <> '' then
  DMAplicacaoFinanceira.QAplicacaoFinanceiraCOD_BANCO.Value := StrToInt(DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE ='+dbEdit8.Text));
end;

procedure TFAplicacaoFinanceiraCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FAplicacaoFinanceiraCons = Nil then
    FAplicacaoFinanceiraCons:=TFAplicacaoFinanceiraCons.Create(Application);
  If FAplicacaoFinanceiraCons.ShowModal=mrOK then
  Begin
    With DMAplicacaoFinanceira do
    Begin
       QAplicacaoFinanceira.Close;
       QAplicacaoFinanceira.SetVariable('PK',QAplicacaoFinanceiraConsCod_Aplicacao_Financeira.Value);
       QAplicacaoFinanceira.Open;
       QAplicacaoFinanceiraMovCons.Close;
       QAplicacaoFinanceiraMovCons.SetVariable('COD_APLICACAO',QAplicacaoFinanceiraConsCod_Aplicacao_Financeira.Value);
       QAplicacaoFinanceiraMovCons.Open;
    End;
  End;
end;

procedure TFAplicacaoFinanceiraCad.BaixaAplicao1Click(Sender: TObject);
begin
  inherited;
  If DMAplicacaoFinanceira.QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Value <> 0 then
  Begin
    If DMAplicacaoFinanceira.QAplicacaoFinanceiraVAL_APLICADO.Value = 0 Then
      Raise Exception.Create('Valor Aplicado Está Zerado - Não Permite Movimentação');
    if FAplicacaoFinanceiraMov = nil then
      FAplicacaoFinanceiraMov := TFAplicacaoFinanceiraMov.create(application);
    FAplicacaoFinanceiraMov.ShowModal;
  end
  else
    Raise Exception.Create('É necessário selecionar uma Aplicação Financeira!');
end;

procedure TFAplicacaoFinanceiraCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DBEdit12.SetFocus;
end;

procedure TFAplicacaoFinanceiraCad.VoltaBaixa1Click(Sender: TObject);
begin
  inherited;
  If DMAplicacaoFinanceira.QAplicacaoFinanceiraCOD_APLICACAO_FINANCEIRA.Value <> 0 then
  Begin
    if FAplicacaoFinanceiraVoltaMov = nil then
      FAplicacaoFinanceiraVoltaMov := TFAplicacaoFinanceiraVoltaMov.create(application);
    FAplicacaoFinanceiraVoltaMov.ShowModal;
  end
  else
    Raise Exception.Create('É necessário selecionar uma Aplicação Financeira!');
end;

procedure TFAplicacaoFinanceiraCad.SbFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrok then
    DMAplicacaoFinanceira.QAplicacaoFinanceiraCOD_FILIAL.Value := DMFilial.QFilialConsCOD_Filial.Value;

end;

procedure TFAplicacaoFinanceiraCad.ListadeAplicaes1Click(Sender: TObject);
begin
  inherited;

  if FAplicacaoFinanceiraParam = Nil then
    FAplicacaoFinanceiraParam:= TFAplicacaoFinanceiraParam.Create(Application);
  FAplicacaoFinanceiraParam.PGRelatorio.Pages[0].TabVisible := True;
  If FAplicacaoFinanceiraParam.ShowModal =  mrOk then
  with DMAplicacaoFinanceira do
  begin
    QRAplicacaoFinanceira.close;

    if trim(FAplicacaoFinanceiraParam.ME1ContaCorrente.Text) <> '' then
      QRAplicacaoFinanceira.SetVariable('CONTA_CORRENTE',trim(FAplicacaoFinanceiraParam.ME1ContaCorrente.Text))
    else
      QRAplicacaoFinanceira.SetVariable('CONTA_CORRENTE',null);

    if trim(FAplicacaoFinanceiraParam.FMDepartamento1.MEDepartamento.Text) <> '' then
      QRAplicacaoFinanceira.SetVariable('DEPARTAMENTO',trim(FAplicacaoFinanceiraParam.FMDepartamento1.MEDepartamento.Text))
    else
      QRAplicacaoFinanceira.SetVariable('DEPARTAMENTO',null);

    if trim(FAplicacaoFinanceiraParam.FMFilial1.MEFilial.Text) <> '' then
      QRAplicacaoFinanceira.SetVariable('FILIAL',trim(FAplicacaoFinanceiraParam.FMFilial1.MEFilial.Text))
    else
      QRAplicacaoFinanceira.SetVariable('FILIAL',null);

    if trim(FAplicacaoFinanceiraParam.ME1DtAplicacaoI.Text) <> '' then
      QRAplicacaoFinanceira.SetVariable('DT_APLICACAO_I',trim(FAplicacaoFinanceiraParam.ME1DtAplicacaoI.Text))
    else
      Raise exception.Create('Informar Data Inicial');

    if trim(FAplicacaoFinanceiraParam.ME1DtAplicacaoF.Text) <> '' then
      QRAplicacaoFinanceira.SetVariable('DT_APLICACAO_F',trim(FAplicacaoFinanceiraParam.ME1DtAplicacaoF.Text))
    else
      Raise exception.Create('Informar Data Final');

    Case FAplicacaoFinanceiraParam.Rg1Opcao.ItemIndex Of
     0 : QRAplicacaoFinanceira.SetVariable('SITUACAO', '1 = 1');
     1 : QRAplicacaoFinanceira.SetVariable('SITUACAO', 'TB_APLICACAO_FINANCEIRA.VAL_APLICADO > 0');
     2 : QRAplicacaoFinanceira.SetVariable('SITUACAO', 'TB_APLICACAO_FINANCEIRA.VAL_APLICADO = 0');
    End;
    QRAplicacaoFinanceira.open;

    if FRAplicacaoFinanceira = nil then
      FRAplicacaoFinanceira := TFRAplicacaoFinanceira.create(application);
    FRAplicacaoFinanceira.QRLFilial.Caption := 'Filial: '+FAplicacaoFinanceiraParam.FMFilial1.MEFilial.Text+
                                             FAplicacaoFinanceiraParam.FMFilial1.EdFilial.Text+
                                             ' Departamento: '+FAplicacaoFinanceiraParam.FMDepartamento1.MEDepartamento.Text+
                                             FAplicacaoFinanceiraParam.FMDepartamento1.EdDepartamento.Text;
    FRAplicacaoFinanceira.QRLTitulo.Caption := 'Relatório de Aplicações Financeiras de '+ FAplicacaoFinanceiraParam.ME1DtAplicacaoI.Text + ' Até ' + FAplicacaoFinanceiraParam.ME1DtAplicacaoF.Text;
    If FAplicacaoFinanceiraParam.RGPreview.ItemIndex = 0 then
      FRAplicacaoFinanceira.QRPrimario.Preview
    else
      FRAplicacaoFinanceira.QRPrimario.Print;

    QRAplicacaoFinanceira.Close;
  end;

end;

end.
