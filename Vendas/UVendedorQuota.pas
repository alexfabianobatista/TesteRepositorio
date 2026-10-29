unit UVendedorQuota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, DBCtrls, Spin, variants, DBDirceu, TeEngine,
  Series, TeeProcs, Chart, DbChart, Provider, DBClient, jpeg, ActnList;

type
  TFVendedorQuota = class(TFTCadSimples)
    QuotaporVendedor1: TMenuItem;
    Opes1: TMenuItem;
    ReplicarCotasVendedores1: TMenuItem;
    Panel2: TPanel;
    DSComissao: TDataSource;
    PcDados: TPageControl;
    TsNormal: TTabSheet;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBE_Ano: TDBEdit;
    DBE_Mes: TDBEdit;
    DBEdit6: TDBEdit;
    BtConVendedorCad: TBitBtn;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    btConsProd: TBitBtn;
    DBDirceu1: TDBDirceu;
    DBEdit2: TDBEdit;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Label7: TLabel;
    Image2: TImage;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    TsOutros: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    BitBtn1: TBitBtn;
    DBEdit11: TDBEdit;
    BitBtn2: TBitBtn;
    DBDirceu2: TDBDirceu;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    Restaurarquantidadepadro1: TMenuItem;
    QuotaporSupervisorVendedorProduto1: TMenuItem;
    procedure BtConsVendedorClick(Sender: TObject);
    procedure MEVendedorExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtConVendedorCadClick(Sender: TObject);
    procedure BtConsClasseClick(Sender: TObject);
    procedure BtReplicaClick(Sender: TObject);
    //procedure MEAnoExit(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure QuotaporVendedor1Click(Sender: TObject);
    procedure ReplicarCotasVendedores1Click(Sender: TObject);
    procedure btConsProdClick(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Restaurarquantidadepadro1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure QuotaporSupervisorVendedorProduto1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendedorQuota: TFVendedorQuota;

implementation

uses UVendedor_cl, UVendedorCons, UClasseCons, UClasse_cl,
  UVendedorQuotaCons, UVendedorParam, URVendedorQuota, UOracle_cl,
  UParamSistema_cl, UProdutoCons, UProduto_cl, UMetaKgGrafico,
  UMetaValGrafico, UGrupoProdutoMeta_cl, UGrupoProdutoMetaCons,
  UParamSistema, UUsuario_cl, URQuotaSupervisorVendedor, UFmProduto,
  UFmVendedor;

{$R *.DFM}

procedure TFVendedorQuota.BtConsVendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.create(Application);
  if FVendedorCons.ShowModal = mrOk then
    with DMVendedor do
    begin
      MeLocaliza.Text := QVendedorConsCod_Vendedor.Text;
      MELocalizaExit(Self);
    end;
end;

procedure TFVendedorQuota.MEVendedorExit(Sender: TObject);
begin
  inherited;
  with DMVendedor do
  begin
    {
      If Trim(MEVendedor.Text) = '' then
      Begin
        EdVendedor.Text := 'Todos';
        QQuotaVendedor.Close;
        QQuotaVendedor.SetVariable('VENDEDOR',Null);
        QQuotaVendedor.Open;
      End
      Else
    }
    with DMVendedor do
    begin
      QVendedor.Close;
      QVendedor.SetVariable('PK', StrToInt(Trim(MELocaliza.Text)));
      QVendedor.Open;
      //EdVendedor.Text := QVendedorNome.Text;
      QQuotaVendedor.Close;
      QQuotaVendedor.SetVariable('VENDEDOR', StrToInt(Trim(MELocaliza.Text)));
      QQuotaVendedor.Open;
    end;
  end;
end;

procedure TFVendedorQuota.FormActivate(Sender: TObject);
begin
  inherited;
  DMVendedor.QQuotaVendedor.Open;

  TsNormal.TabVisible := False;
  TsOutros.TabVisible := False;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then
  begin
    TsOutros.Visible := True;
    TsNormal.Visible := False;
  end
  else
  begin
    TsOutros.Visible := False;
    TsNormal.Visible := True;
  end;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
  begin
    FVendedorQuota.Label4.Caption := 'Quota/Peças';
    FVendedorQuota.Label8.Caption := 'Quota/Valor';
  end;
end;

procedure TFVendedorQuota.BtConVendedorCadClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.create(Application);
  if FVendedorCons.ShowModal = mrOk then
    with DMVendedor do
    begin
      QQuotaVendedorCod_Vendedor.Value := QVendedorConsCod_Vendedor.Value;
    end;
end;

procedure TFVendedorQuota.BtConsClasseClick(Sender: TObject);
begin
  inherited;
  {
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.create(Application);
  If FClasseCons.ShowModal = mrOk then
  With DMVendedor do
  Begin
    QQuotaVendedorCod_Classe.Value := DMClasse.QClasseConsCod_Classe.Value;
  End;}
end;

procedure TFVendedorQuota.BtReplicaClick(Sender: TObject);
var
  wOldVendedor, wOldClasse, wOldAno, wOldMes: Integer;
  wOldQtde: Real;
begin
  inherited;
  {With DMVendedor do
  Begin
    wOldVendedor := QQuotaVendedorCod_Vendedor.Value;
    wOldClasse := QQuotaVendedorCod_Classe.Value;
    wOldQtde := QQuotaVendedorQt_Quota.Value;
    wOldAno := QQuotaVendedorNum_Ano.Value;
    wOldMes := QQuotaVendedorNum_Mes.Value;
    SBIncluirClick(Self);
    QQuotaVendedorCod_Vendedor.Value := wOldVendedor;
    QQuotaVendedorCod_Classe.Value := wOldClasse;
    QQuotaVendedorQt_Quota.Value := wOldQtde;
    QQuotaVendedorNum_Ano.Value := wOldAno;
    QQuotaVendedorNum_Mes.Value := wOldMes;
  End;
  }
end;

{procedure TFVendedorQuota.MEAnoExit(Sender: TObject);
begin
  inherited;
  With DMVendedor do
  Begin
    If Trim(MEAno.Text) = '' then
    Begin
      QQuotaVendedor.Close;
      QQuotaVendedor.SetVariable('ANO',Null);
      QQuotaVendedor.Open;
    End
    Else
    With DMVendedor do
    Begin
      QQuotaVendedor.Close;
      QQuotaVendedor.SetVariable('ANO',StrToFloat(Trim(MEAno.Text)));
      QQuotaVendedor.Open;
    End;
  End;
end;
 }

procedure TFVendedorQuota.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(32);
end;

procedure TFVendedorQuota.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FVendedorQuotaCons = nil then
    FVendedorQuotaCons := TFVendedorQuotaCons.Create(Application);
  FVendedorQuotaCons.MEVendedorCons.Clear;
  FVendedorQuotaCons.MeSupervisor.Clear;
  FVendedorQuotaCons.MEVendedorCons.Enabled := True;
  FVendedorQuotaCons.SBVendedorCons.Enabled := True;
  FVendedorQuotaCons.MeSupervisor.Enabled := True;
  FVendedorQuotaCons.SbSupervisor.Enabled := True;
  If DMUsuario.pTipoFuncionario = 'VENDEDOR' Then
   Begin
     FVendedorQuotaCons.MEVendedorCons.Text := IntToStr(DMUsuario.CodVendedorPadrao);
     FVendedorQuotaCons.MEVendedorCons.Enabled := False;
     FVendedorQuotaCons.SBVendedorCons.Enabled := False;
   End;
  If DMUsuario.pTipoFuncionario = 'SUPERVISOR' Then
   Begin
     FVendedorQuotaCons.MeSupervisor.Text := IntToStr(DMUsuario.CodVendedorPadrao);
     FVendedorQuotaCons.MeSupervisor.Enabled := False;
     FVendedorQuotaCons.SbSupervisor.Enabled := False;
   End;
  if FVendedorQuotaCons.ShowModal = mrOk then
    with DMVendedor do
    begin
      QQuotaVendedor.Close;
      QQuotaVendedor.SetVariable('PK', QQuotaVendedorConsCOD_VENDEDOR_QUOTA.Value);
      QQuotaVendedor.Open;
    end;
end;

procedure TFVendedorQuota.QuotaporVendedor1Click(Sender: TObject);
begin
  inherited;
  if FVendedorParam = nil then
    FVendedorParam := TFVendedorParam.Create(Application);
  FVendedorParam.PGRelatorio.Pages[2].TabVisible := True;
  if FVendedorParam.ShowModal = mrOk then
    with DMVendedor do
    begin
      QRVendedorQuota.Close;
      if Trim(FVendedorParam.ME2Vendedor.Text) <> '' then
        QRVendedorQuota.SetVariable('VENDEDOR', FVendedorParam.ME2Vendedor.Text)
      else
        QRVendedorQuota.SetVariable('VENDEDOR', Null);

      if Trim(FVendedorParam.ME2Ano.Text) <> '' then
        QRVendedorQuota.SetVariable('ANO', FVendedorParam.ME2Ano.Text)
      else
        QRVendedorQuota.SetVariable('ANO', Null);
      QRVendedorQuota.Open;

      if FrVendedorQuota = nil then
        FrVendedorQuota := TFrVendedorQuota.Create(Application);
      FrVendedorQuota.QRLTitulo.Caption := 'Relatório de Quota por Vendedor';

      if FVendedorParam.RGPreview.ItemIndex = 0 then
        FrVendedorQuota.QRPrimario.Preview
      else
        FrVendedorQuota.QRPrimario.Print;
      QrVendedorQuota.Close;

    end;
end;

procedure TFVendedorQuota.ReplicarCotasVendedores1Click(Sender: TObject);
begin
  inherited;
  if FVendedorParam = nil then
    FVendedorParam := TFVendedorParam.Create(Application);
  FVendedorParam.PGRelatorio.Pages[4].TabVisible := True;
  if FVendedorParam.ShowModal = mrOk then
  begin
    if trim(FVendedorParam.edt4Ano.Text) = '' then
      raise Exception.create('Informe o Ano');
    if trim(FVendedorParam.edt4Mes.Text) = '' then
      raise Exception.create('Informe o Mês');

    DMOracle.DBCemapa.StartTransaction;
    try
      DMVendedor.QReplicaCotasVendedor.SetVariable('NUM_MES', strtoint(trim(FVendedorParam.edt4Mes.text)));
      DMVendedor.QReplicaCotasVendedor.SetVariable('NUM_ANO', strtoint(trim(FVendedorParam.edt4Ano.text)));

      DMVendedor.QReplicaCotasVendedor.ExecSQL;
      DMOracle.DBCemapa.Commit;

      MessageDlg('Cotas Replicadas com sucesso', mtConfirmation, [mbok], 0);
    except
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  end;
end;

procedure TFVendedorQuota.btConsProdClick(Sender: TObject);
begin
  inherited;
  if FGrupoProdutoMetaCons = nil then
    FGrupoProdutoMetaCons := TFGrupoProdutoMetaCons.Create(Application);
  if FGrupoProdutoMetaCons.ShowModal = MrOk then
    DMVendedor.QQuotaVendedorCOD_GRUPO_PRODUTO_META.Value := DMGrupoProdutoMeta.QGrupoProdutoMetaConsCOD_GRUPO_PRODUTO_META.Value;
end;

procedure TFVendedorQuota.Label7Click(Sender: TObject);
begin
  inherited;
  if DMVendedor.QQuotaVendedor.RecordCount = 0 then
    raise Exception.Create('Nenhum registro selecionado');
  if FMetaKgGrafico = nil then
    FMetaKgGrafico := TFMetaKgGrafico.Create(Application);
  FMetaKgGrafico.ShowModal();
end;

procedure TFVendedorQuota.Label10Click(Sender: TObject);
begin
  inherited;
  if DMVendedor.QQuotaVendedor.RecordCount = 0 then
    raise Exception.Create('Nenhum registro selecionado');
  if FMetaValGrafico = nil then
    FMetaValGrafico := TFmetaValGrafico.Create(Application);
  FMetavalGrafico.ShowModal();
end;

procedure TFVendedorQuota.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
    DMVendedor.QQuotaVendedorCOD_PRODUTO.Value := DMProduto.QProdutoConsCOD_PRODUTO.Value;
end;

procedure TFVendedorQuota.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.create(Application);
  if FVendedorCons.ShowModal = mrOk then
    DMVendedor.QQuotaVendedorCOD_VENDEDOR.Value := DMVendedor.QVendedorConsCOD_VENDEDOR.Value;
end;

procedure TFVendedorQuota.Restaurarquantidadepadro1Click(Sender: TObject);
begin
  inherited;
  if (MessageDlg('Deseja restaurar a quantidade padrão para todos os vendedores?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    DMOracle.ExecutaSql('UPDATE TB_VENDEDOR_QUOTA SET QT_QUOTA_KG = QT_QUOTA_KG_PADRAO');
  end;
end;

procedure TFVendedorQuota.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'ABATE' then
    try
      DMVendedor.OPVendedor.CallProcedure('VENDEDOR_QUOTA',
        [DMVendedor.QQuotaVendedorCOD_VENDEDOR.Value,
        DMVendedor.QQuotaVendedorCOD_PRODUTO.Value,
        DMVendedor.QQuotaVendedorQT_QUOTA_KG.Value]);
      if DMVendedor.QQuotaVendedor.CommitOnPost then
        DMOracle.DBCemapa.Commit;
    except
      on E: Exception do
      begin
        MessageDlg('Não foi possível atualizar quota dos vendedores supervisionados por este vendedor.'+#13+#10+
          'Erro: ' + e.Message, mtWarning, [mbOK], 0);
        if DMVendedor.QQuotaVendedor.CommitOnPost then
          DMOracle.DBCemapa.Rollback;
      end;
    end;
end;

procedure TFVendedorQuota.QuotaporSupervisorVendedorProduto1Click(
  Sender: TObject);
begin
  inherited;
  if FVendedorParam = nil then
    FVendedorParam := TFVendedorParam.Create(Application);
  FVendedorParam.AtivaPagina(5);
  if FVendedorParam.ShowModal = MrOk then
    with DMVendedor do
    begin
      QRQuotaSupervisorVendedor.Close;
      QRQuotaSupervisorVendedor.ClearVariables;
      if Trim(FVendedorParam.Fm5Filial.MeFilial.Text) <> '' then
        QRQuotaSupervisorVendedor.SetVariable('FILIAL', Trim(FVendedorParam.Fm5Filial.MeFilial.Text));
      if Trim(FVendedorParam.Fm5Supervisor.MeVendedor.Text) <> '' then
        QRQuotaSupervisorVendedor.SetVariable('SUPERVISOR', Trim(FVendedorParam.Fm5Supervisor.MeVendedor.Text));
      if Trim(FVendedorParam.Fm5Vendedor.MeVendedor.Text) <> '' then
        QRQuotaSupervisorVendedor.SetVariable('VENDEDOR', Trim(FVendedorParam.Fm5Vendedor.MeVendedor.Text));
      if Trim(FVendedorParam.Fm5Produto.MeProduto.Text) <> '' then
        QRQuotaSupervisorVendedor.SetVariable('PRODUTO', Trim(FVendedorParam.Fm5Produto.MeProduto.Text));
      QRQuotaSupervisorVendedor.Open;

      if FRQuotaSupervisorVendedor = nil then
        FRQuotaSupervisorVendedor := TFRQuotaSupervisorVendedor.Create(Application);
      FRQuotaSupervisorVendedor.QRLFilial.Caption := FVendedorParam.Fm5Filial.EdFilial.Text;
      FRQuotaSupervisorVendedor.QRLProduto.Caption := FVendedorParam.Fm5Produto.EdProduto.Text;
      FRQuotaSupervisorVendedor.QRLSupervisor.Caption := FVendedorParam.Fm5Supervisor.EdVendedor.Text;
      FRQuotaSupervisorVendedor.QRLVendedor.Caption := FVendedorParam.Fm5Vendedor.EdVendedor.Text;
      if FVendedorParam.RGPreview.ItemIndex = 0 then
        FRQuotaSupervisorVendedor.QRPrimario.Preview
      else
        FRQuotaSupervisorVendedor.QRPrimario.Print;

      QRQuotaSupervisorVendedor.Close;
    end;
end;

end.
