unit UPremioExportacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu;

type
  TFPremioExportacao = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    SbComprador: TSpeedButton;
    SbContaCorrente: TSpeedButton;
    RelPrmioExportao1: TMenuItem;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    SbHistorico: TSpeedButton;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    SbDepartamento: TSpeedButton;
    DBDirceu4: TDBDirceu;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    DBDirceu5: TDBDirceu;
    SBFilial: TSpeedButton;
    procedure SbCompradorClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SbContaCorrenteClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelPrmioExportao1Click(Sender: TObject);
    procedure SbHistoricoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SbDepartamentoClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPremioExportacao: TFPremioExportacao;

implementation

uses UPremioExportacao_cl, UCadastroCons, UCadastro_cl, UOracle_cl,
  UContaCorrenteCons, UBancoAgencia_cl, UPremioExportacaoCons,
  UPremioExportacaoParam, URPremioExportacao, UHistoricoCons,
  UHistorico_cl, UDepartamentoCons, UDepartamento_cl, UUsuario_cl,
  UFilialCons, UFilial_cl;

{$R *.dfm}

procedure TFPremioExportacao.SbCompradorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
  begin
    DMPremioExportacao.QPremioExportacaoCOD_CADASTRO.Value := DMCadastro.QCadastroConsCOD_CADASTRO.Value;
  end;
end;

procedure TFPremioExportacao.FormActivate(Sender: TObject);
begin
  inherited;
  DMPremioExportacao.QPremioExportacao.open;
end;

procedure TFPremioExportacao.SbContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = MrOk then
  begin
    DMPremioExportacao.QPremioExportacaoCOD_CONTA_CORRENTE.Value :=
                    DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value;
  end;
end;

procedure TFPremioExportacao.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FPremioExportacaoCons = Nil then
    FPremioExportacaoCons := TFPremioExportacaoCons.Create(Application);
  if FPremioExportacaoCons.ShowModal = MrOk then
  begin
    MeLocaliza.Text := DMPremioExportacao.QPremioExportacaoConsCOD_PREMIO_EXPORTACAO.Text;
    MeLocalizaExit(Self);
  end;
end;

procedure TFPremioExportacao.RelPrmioExportao1Click(Sender: TObject);
begin
  inherited;
  if FPremioExportacaoParam = Nil then
    FPremioExportacaoParam := TFPremioExportacaoParam.Create(Application);
  FPremioExportacaoParam.PGRelatorio.Pages[0].TabVisible := true;
  if FPremioExportacaoParam.ShowModal = MrOk then
  begin
    with DMPremioExportacao do
    begin
      QRPremioExportacao.Close;

      if Trim(FPremioExportacaoParam.Me1Contrato.Text) <> '' then
      QRPremioExportacao.SetVariable('CONTRATO', Trim(FPremioExportacaoParam.Me1Contrato.Text))
      else
        QRPremioExportacao.SetVariable('CONTRATO', null);

      if Trim(FPremioExportacaoParam.Me1Fatura.Text) <> '' then
        QRPremioExportacao.SetVariable('FATURA', Trim(FPremioExportacaoParam.Me1Fatura.Text))
      else
        QRPremioExportacao.SetVariable('FATURA', null);

      if Trim(FPremioExportacaoParam.FMCadastro1.MeCadastro.Text) <> '' then
        QRPremioExportacao.SetVariable('COMPRADOR', Trim(FPremioExportacaoParam.FMCadastro1.MeCadastro.Text))
      else
        QRPremioExportacao.SetVariable('COMPRADOR', null);

      if Trim(FPremioExportacaoParam.Me1Data_I.Text) <> '' then
        QRPremioExportacao.SetVariable('DATA_I', Trim(FPremioExportacaoParam.Me1Data_I.Text))
      else
        Raise Exception.Create('A data inicial deve ser informada');

      if Trim(FPremioExportacaoParam.Me1Data_F.Text) <> '' then
        QRPremioExportacao.SetVariable('DATA_F', Trim(FPremioExportacaoParam.Me1Data_F.Text))
      else
        QRPremioExportacao.SetVariable('DATA_F', DateToStr(Date));

      QRPremioExportacao.Open;
    end;
    if FRPremioExportacao = Nil then
      FRPremioExportacao := TFRPremioExportacao.Create(Application);
    FRPremioExportacao.QRLabel14.Caption := 'Período de ' + Trim(FPremioExportacaoParam.Me1Data_I.Text) +
                                            ' até ' + Trim(FPremioExportacaoParam.Me1Data_F.Text);
    if FPremioExportacaoParam.RGPreview.ItemIndex = 0 then
      FRPremioExportacao.QRPrimario.Preview
    else
      FRPremioExportacao.QRPrimario.Print;
  end;
end;

procedure TFPremioExportacao.SbHistoricoClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal = MrOk then
    DMPremioExportacao.QPremioExportacaoCOD_HISTORICO.Value :=
                    DMHistorico.QHistoricoConsCOD_HISTORICO.Value;
end;

procedure TFPremioExportacao.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SbComprador.Enabled := DSPrimario.State in [DsInsert,DsEdit];
  SbContaCorrente.Enabled := DSPrimario.State in [DsInsert,DsEdit];
  SbHistorico.Enabled := DSPrimario.State in [DsInsert,DsEdit];
  SbDepartamento.Enabled := DSPrimario.State in [DsInsert,DsEdit];
  SbFilial.Enabled := DSPrimario.State in [DsInsert,DsEdit];
end;

procedure TFPremioExportacao.SbDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = MrOk then
    DMPremioExportacao.QPremioExportacaoCOD_DEPARTAMENTO.Value :=
    DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Value;
end;

procedure TFPremioExportacao.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
    DMPremioExportacao.QPremioExportacaoCOD_FILIAL.Value := DMFilial.QFilialConsCOD_FILIAL.Value;
end;

end.
