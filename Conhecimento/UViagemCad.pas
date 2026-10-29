unit UViagemCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, DBCtrls, DBPanel;

type
  TFViagemCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    tbsCabecalho: TTabSheet;
    Label8: TLabel;
    DBPPlaca: TDBPanel;
    GroupBox1: TGroupBox;
    DBPCodigo: TDBPanel;
    DBPData: TDBPanel;
    DBPDescricao: TDBPanel;
    DBPFreteSaida: TDBPanel;
    DBPFreteVolta: TDBPanel;
    DBPFreteTotal: TDBPanel;
    DBPComissao: TDBPanel;
    DBPAdiantamento: TDBPanel;
    DBPSaldoReceber: TDBPanel;
    DBPFilial: TDBPanel;
    Viagem1: TMenuItem;
    tbsControleViagem: TTabSheet;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    ControledeViagem1: TMenuItem;
    procedure DBPPlacaDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPFreteSaidaCodigoExit(Sender: TObject);
    procedure DBPFreteVoltaCodigoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure Viagem1Click(Sender: TObject);
    procedure DBPanel5DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel6DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel7DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure FormCreate(Sender: TObject);
    procedure ControledeViagem1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FViagemCad: TFViagemCad;

implementation

uses UViagem_cl, UVeiculoConhecimentoCons, UOracle_cl, UConhecimento_cl, uBiblioteca,
  UViagemCons, UViagemParam, URViagem, UParamSistema_cl, UCadastroCons,URControleViagemEntrega;
{$R *.dfm}

procedure TFViagemCad.DBPPlacaDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVeiculoConhecimentoCons;
  Classe := TFVeiculoConhecimentoCons;
end;

procedure TFViagemCad.DBPFreteSaidaCodigoExit(Sender: TObject);
begin
  inherited;
  with DMViagem do
    QViagemCadVL_FRETE_TOTAL.Value := QViagemCadVL_FRETE_IDA.Value + QViagemCadVL_FRETE_VOLTA.Value;
end;

procedure TFViagemCad.DBPFreteVoltaCodigoExit(Sender: TObject);
begin
  inherited;
  DBPFreteSaidaCodigoExit(nil);
end;

procedure TFViagemCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMViagem do
  begin
    QViagemCad.Open;
  end;
end;

procedure TFViagemCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFViagemCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FViagemCons = nil then
    FViagemCons := TFViagemCons.Create(Application);
  if FViagemCons.ShowModal = mrOk then
  begin
    with DMViagem do
    begin
      QViagemCad.Close;
      QViagemCad.SetVariable('PK', QViagemConsCod_Viagem.Value);
      QViagemCad.Open;
      MELocalizaExit(Self);
    end;
  end;
end;

procedure TFViagemCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  if PageControl1.ActivePage.Name = 'tbsCabecalho' then
    DBPData.SetFocus
  else if PageControl1.ActivePage.Name = 'tbsControleViagem' then
  begin
    DBPanel2.SetFocus;
    DBPanel2.DBEdit.Text := DateToStr(Date());
  end;
end;

procedure TFViagemCad.Viagem1Click(Sender: TObject);
begin
  inherited;
  if FViagemParam = nil then
    FViagemParam := TFViagemParam.Create(Application);
  FViagemParam.PGRelatorio.Pages[0].TabVisible := True;
  if FViagemParam.ShowModal = mrOk then
  begin
    with DMViagem do
    begin
     QRViagem.Close;
      if Trim(FViagemParam.Me0CodFilial.Text) <> '' then
        QRViagem.SetVariable('COD_FILIAL',Trim(FViagemParam.Me0CodFilial.Text))
      else
        QRViagem.SetVariable('COD_FILIAL', Null);
      if Trim(FViagemParam.ME0CodVeiculo.Text) <> '' then
        QRViagem.SetVariable('DESC_PLACA', Trim(QuotedStr(FViagemParam.ME0CodVeiculo.Text)))
      else
        QRViagem.SetVariable('DESC_PLACA', Null);
      if Trim(FViagemParam.ME0EmissaoInicial.Text) <> '' then
        QRViagem.SetVariable('DT_INICIAL', Trim(FViagemParam.ME0EmissaoInicial.Text))
      else
        QRViagem.SetVariable('DT_INICIAL', DateToStr(Now));
      if Trim(FViagemParam.ME0EmissaoFinal.Text) <> '' then
        QRViagem.SetVariable('DT_FINAL', Trim(FViagemParam.ME0EmissaoFinal.Text))
      else
        QRViagem.SetVariable('DT_FINAL', DateToStr(Now));

      QRViagem.Open;
      if FRViagem = nil then
        FRViagem := TFRViagem.Create(Application);
      //Cabeçalho Relatório
      FRViagem.QRLEmpresa.Caption := Trim(DMParamSistema.QParamSistemaDESC_EMPRESA.Text);
      FRViagem.QRLTitulo.Caption  := 'Relatório de saldos e valores de viagens';
      FRViagem.QRLFilial.Caption  := 'Filial: '  + Trim(FViagemParam.Ed0Filial.Text);
      FRViagem.QRLPeriodo.Caption := 'Período: ' + Trim(FViagemParam.ME0EmissaoInicial.Text) +
                                               ' até ' + Trim(FViagemParam.ME0EmissaoFinal.Text);
      //----------------------------

      if FViagemParam.RGPreview.ItemIndex = 0 then
        FRViagem.QRPrimario.Preview
      else
        FRViagem.QRPrimario.Print;
    end;
  end;
end;

procedure TFViagemCad.DBPanel5DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFViagemCad.DBPanel6DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFViagemCad.DBPanel7DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFViagemCad.FormCreate(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then
    tbsCabecalho.TabVisible := False
  else
    tbsControleViagem.TabVisible := False;
end;

procedure TFViagemCad.ControledeViagem1Click(Sender: TObject);
begin
  inherited;
  if FViagemParam = nil then
    FViagemParam := TFViagemParam.Create(Application);
  FViagemParam.PGRelatorio.Pages[1].TabVisible := True;
  if FViagemParam.ShowModal = mrOk then
  begin
    with DMViagem do
    begin
     QRControleViagem.Close;
      if Trim(FViagemParam.Me0CodFilial.Text) <> '' then
        QRControleViagem.SetVariable('COD_FILIAL',Trim(FViagemParam.FmFilial1.MeFilial.Text))
      else
        QRControleViagem.SetVariable('COD_FILIAL', Null);
      if Trim(FViagemParam.MeCodVeiculo1.Text) <> '' then
        QRControleViagem.SetVariable('DESC_PLACA', (FViagemParam.MeCodVeiculo1.Text))
      else
        QRControleViagem.SetVariable('DESC_PLACA', Null);
      if Trim(FViagemParam.FmDatas1.MeDtInicial.Text) <> '' then
        QRControleViagem.SetVariable('DT_INICIAL', Trim(FViagemParam.FmDatas1.MeDtInicial.Text))
      else
        QRControleViagem.SetVariable('DT_INICIAL', Null);
      if Trim(FViagemParam.FmDatas1.MeDtFinal.Text) <> '' then
        QRControleViagem.SetVariable('DT_FINAL', Trim(FViagemParam.FmDatas1.MeDtFinal.Text))
      else
        QRControleViagem.SetVariable('DT_FINAL', Null);

      QRControleViagem.Open;
      if FRControleViagemEntrega= nil then
        FRControleViagemEntrega := TFRControleViagemEntrega.Create(Application);
      //Cabeçalho Relatório
      FRControleViagemEntrega.QRLFilial.Caption  := 'Filial: '  + Trim(FViagemParam.FmFilial1.MeFilial.Text);
      FRControleViagemEntrega.QRLPeriodo.Caption := 'Período: ' + Trim(FViagemParam.FmDatas1.MeDtInicial.Text) +
                                               ' até ' + Trim(FViagemParam.FmDatas1.MeDtFinal.Text);
      //----------------------------

      if FViagemParam.RGPreview.ItemIndex = 0 then
        FRControleViagemEntrega.QRPrimario.Preview
      else
        FRControleViagemEntrega.QRPrimario.Print;
    end;
  end;
end;

procedure TFViagemCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMViagem.QViagemCad.Close;
  Action := caFree;
  FViagemCad := Nil;
end;

end.
