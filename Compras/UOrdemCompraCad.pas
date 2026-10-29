unit UOrdemCompraCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, Grids, DBGrids, ImgList, OracleNavigator, DBDirceu, variants,
  UFmHistorico, ActnList, DBPanel, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFOrdemCompraCad = class(TFTCadSimples)
    PGOrdemCompra: TPageControl;
    TSCabecalho: TTabSheet;
    TSItem: TTabSheet;
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
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    DBGrid1: TDBGrid;
    BtConsFilial: TBitBtn;
    BtConsOperacao: TBitBtn;
    BtConsCadastro: TBitBtn;
    BtConsMoeda: TBitBtn;
    Label15: TLabel;
    DBEdit19: TDBEdit;
    Label16: TLabel;
    DBEdit20: TDBEdit;
    Label17: TLabel;
    DBEdProduto: TDBEdit;
    Label18: TLabel;
    DBEdit22: TDBEdit;
    Label19: TLabel;
    Label20: TLabel;
    DBQtde_Atendido: TDBEdit;
    Label21: TLabel;
    DBEQtdCancelado: TDBEdit;
    Label22: TLabel;
    DBEdit26: TDBEdit;
    Label23: TLabel;
    BtConsProduto: TBitBtn;
    Label24: TLabel;
    DBEdit29: TDBEdit;
    OCAberto1: TMenuItem;
    Espelho1: TMenuItem;
    Label25: TLabel;
    DBEdit30: TDBEdit;
    Outros1: TMenuItem;
    CancelaItem1: TMenuItem;
    GroupBox1: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit25: TDBEdit;
    DBEdit31: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label28: TLabel;
    DBEdit32: TDBEdit;
    BtConsTransportadora: TBitBtn;
    Label29: TLabel;
    DBEdit34: TDBEdit;
    Label30: TLabel;
    DBEdit35: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label31: TLabel;
    DBEdit36: TDBEdit;
    BtConsTributacao: TBitBtn;
    ProdutoAcumulado1: TMenuItem;
    PorFornecedor1: TMenuItem;
    Label32: TLabel;
    DBEdit38: TDBEdit;
    DBGrid2: TDBGrid;
    Label33: TLabel;
    Label34: TLabel;
    DBEdit39: TDBEdit;
    DBGrid3: TDBGrid;
    Label35: TLabel;
    Label36: TLabel;
    DBEdit40: TDBEdit;
    Label37: TLabel;
    MeDtReferencia: TMaskEdit;
    OracleNavigator1: TOracleNavigator;
    NotasQueAtenderamOC1: TMenuItem;
    DBRGTipoPagamento: TDBRadioGroup;
    PosioFinanceiraOrdemCompra1: TMenuItem;
    Label38: TLabel;
    DBEdit21: TDBEdit;
    Label39: TLabel;
    DBEdit41: TDBEdit;
    Label40: TLabel;
    DBEdit42: TDBEdit;
    BtConsCultura: TBitBtn;
    DBEdit23: TDBEdit;
    DBEdit27: TDBEdit;
    DBDirceu13: TDBDirceu;
    Label71: TLabel;
    Label72: TLabel;
    DBDirceu14: TDBDirceu;
    Label41: TLabel;
    DBEdit17: TDBEdit;
    BtConsMensagem: TBitBtn;
    OCcomProdutosemTrnsito1: TMenuItem;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    DBDirceu6: TDBDirceu;
    DBDirceu7: TDBDirceu;
    DBEdit15: TDBEdit;
    Label42: TLabel;
    DBEdit16: TDBEdit;
    Label43: TLabel;
    DBEdit18: TDBEdit;
    BtConsFinalidade: TBitBtn;
    DBDirceu8: TDBDirceu;
    ValorUtilizadodoLimitedeCompras1: TMenuItem;
    Label44: TLabel;
    MeLimite: TMaskEdit;
    TsAdiantamentos: TTabSheet;
    Label45: TLabel;
    MeValor: TMaskEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    FmHistorico: TFmHistorico;
    BitBtn5: TBitBtn;
    DBGrid4: TDBGrid;
    DsOrdemCompraCaixa: TDataSource;
    Label46: TLabel;
    DBEdit28: TDBEdit;
    Label47: TLabel;
    DBEdit33: TDBEdit;
    BtDepartamentoCons: TBitBtn;
    DBDirceu9: TDBDirceu;
    Label48: TLabel;
    DBEdit37: TDBEdit;
    MeSaldo: TMaskEdit;
    Label70: TLabel;
    LblNumOs: TLabel;
    DBENumOs: TDBEdit;
    BtConsOS: TBitBtn;
    DBPVendedor: TDBPanel;
    DBPanel1: TDBPanel;
    MarcarOrdemCompracomoAtendida1: TMenuItem;
    AtendeItemPedido1: TMenuItem;
    Label49: TLabel;
    DBEdit24: TDBEdit;
    Label50: TLabel;
    EdNumFabricante: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtConsOperacaoClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsMoedaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure OCAberto1Click(Sender: TObject);
    procedure Espelho1Click(Sender: TObject);
    procedure CancelaItem1Click(Sender: TObject);
    procedure DBEQtdCanceladoExit(Sender: TObject);
    procedure BtConsTransportadoraClick(Sender: TObject);
    procedure BtConsTributacaoClick(Sender: TObject);
    procedure ProdutoAcumulado1Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure PorFornecedor1Click(Sender: TObject);
    procedure DBEdProdutoExit(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure MeDtReferenciaExit(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NotasQueAtenderamOC1Click(Sender: TObject);
    procedure PosioFinanceiraOrdemCompra1Click(Sender: TObject);
    procedure BtConsCulturaClick(Sender: TObject);
    procedure BtConsMensagemClick(Sender: TObject);
    procedure OCcomProdutosemTrnsito1Click(Sender: TObject);
    procedure DBEdit39Change(Sender: TObject);
    procedure BtConsFinalidadeClick(Sender: TObject);
    procedure ValorUtilizadodoLimitedeCompras1Click(Sender: TObject);
    procedure DBEdit18Exit(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure PGOrdemCompraChange(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BtDepartamentoConsClick(Sender: TObject);
    procedure BtConsOSClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBPVendedorDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel1DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure OracleNavigator1BeforeAction(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure MarcarOrdemCompracomoAtendida1Click(Sender: TObject);
    procedure AtendeItemPedido1Click(Sender: TObject);
    procedure DBQtde_AtendidoExit(Sender: TObject);
    procedure EdNumFabricanteExit(Sender: TObject);
    procedure EdNumFabricanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
  private
    procedure atualizaUltimaOc;
    procedure CalculoLimite(wLocal: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrdemCompraCad: TFOrdemCompraCad;

implementation

uses UOrdemCompra_cl, UOperacaoCons, UOperacao_cl, UFilialCons, UFilial_cl,
  UCadastroCons, UCadastro_cl, UMoedaCons, UMoeda_cl, UOracle_cl,
  UOrdemCompraCons, UProdutoCons, UProduto_cl, UOrdemCompraParam,
  UROrdemCompra_Aberto, UROrdemCompra_Espelho, UTributacaoCons,
  UTributacao_cl, UROrdemCompra_ProdutoAcum, UROrdemCompraFornecedor,
  UTipoLoteCons, UNotaEntrada_cl, UEstoque_cl, UROrdemCompraNota,
  UContasReceberCons, UContasReceber_cl, UUsuario_cl,
  UrOrdemCompraFinanceiro, UCulturaCons, UCultura_cl, UParamSistema_cl,
  UMensagemCons, UMensagem_cl, UROrdemCompraProdutoTransito,
  UFinalidadeCons, UFinalidade_cl, UrOrdemCompraLimite, UHistorico_cl,
  UPedido_cl, UBiblioteca, UPlanilha_cl, USequencia_cl, URReciboCaixa,
  UDepartamentoCons, UDepartamento_cl, UOs_cl, UOSCons, UVendedorCons;

{$R *.DFM}

procedure TFOrdemCompraCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMOrdemCompra do
  begin
    QOrdemCompra.Open;
    QItemOC.Open;
    QSomaItemOC.Open;
  end;
  MeDtReferencia.Text := DateToStr(Date() - 60);
  TsAdiantamentos.TabVisible := False;
  PGOrdemCompra.ActivePage := TSCabecalho;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL' then
  begin
    DBRGTipoPagamento.Items.Clear;
    DBRGTipoPagamento.Items.Add('A Vista');
    DBRGTipoPagamento.Items.Add('A Prazo');
    DBRGTipoPagamento.Items.Add('Adiantamento');
    TsAdiantamentos.TabVisible := True;
    DMOrdemCompra.QOrdemCompraCaixa.Open;
  end;

end;

procedure TFOrdemCompraCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    DMOrdemCompra.QOrdemCompraCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFOrdemCompraCad.BtConsOperacaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 0;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  if FOperacaoCons.ShowModal = mrOk then
    DMOrdemCompra.QOrdemCompraCod_Operacao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
end;

procedure TFOrdemCompraCad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMOrdemCompra.QOrdemCompraCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFOrdemCompraCad.BtConsMoedaClick(Sender: TObject);
begin
  inherited;
  if FMoedaCons = nil then
    FMoedaCons := TFMoedaCons.Create(Application);
  if FMoedaCons.ShowModal = mrOk then
    DMOrdemCompra.QOrdemCompraCod_Moeda.Value := DMMoeda.QMoedaConsCod_Moeda.Value;
end;

procedure TFOrdemCompraCad.SBConfirmarClick(Sender: TObject);
begin
  CalculoLimite('SALVANDO'); // vai calcular o limite de credito para gasto no mes
  DmUsuario.Checar_Filial_Usuario(DMOrdemCompra.QOrdemCompraCod_Filial.Text, 'COMPRA');
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS') and
      (DMOrdemCompra.QOrdemCompraNUM_OS.IsNull) then
    MessageDlg('Atenção!'+#13+#10+'Você não informou o NÚMERO DA OS! ' +
      'Essa Ordem de Compra não será considerada uma'+#13+#10+
      'requisição de serviço de terceiros.', mtWarning, [mbOK], 0);
  inherited;
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;
end;

procedure TFOrdemCompraCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FOrdemCompraCons = nil then
    FOrdemCompraCons := TFOrdemCompraCons.Create(Application);
  if FOrdemCompraCons.ShowModal = mrOk then
    with DMOrdemCompra do
    begin
      QOrdemCompra.Close;
      QOrdemCompra.SetVariable('PK', QOrdemCompraConsCod_Ordem_Compra_Cab.Value);
      QOrdemCompra.Open;
    end;
end;

procedure TFOrdemCompraCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    with DMOrdemCompra do
    begin
      QItemOC.Edit;
      QItemOCCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
      QItemOCCod_Tributacao.Value := DMProduto.QProdutoConsCod_Tributacao.Value;
      DBEdProdutoExit(Self);
    end;
end;

procedure TFOrdemCompraCad.OCAberto1Click(Sender: TObject);
begin
  inherited;
  if FOrdemCompraParam = nil then
    FOrdemCompraParam := TFOrdemCompraParam.Create(Application);
  FOrdemCompraParam.PGRelatorio.Pages[0].TabVisible := True;
  if FOrdemCompraParam.ShowModal = mrOk then
    with DMOrdemCompra do
    begin
      DmUsuario.Checar_Filial_Usuario(TRIM(FOrdemCompraParam.ME0Filial.Text), 'COMPRA');
      QROCAberto.Close;
      if Trim(FOrdemCompraParam.ME0Filial.Text) = '' then
        QROCAberto.SetVariable('FILIAL', Null)
      else
        QROCAberto.SetVariable('FILIAL', FOrdemCompraParam.ME0Filial.Text);
      if Trim(FOrdemCompraParam.ME0Cadastro.Text) = '' then
        QROCAberto.SetVariable('CADASTRO', Null)
      else
        QROCAberto.SetVariable('CADASTRO', FOrdemCompraParam.ME0Cadastro.Text);
      if Trim(FOrdemCompraParam.ME0Produto.Text) = '' then
        QROCAberto.SetVariable('PRODUTO', Null)
      else
        QROCAberto.SetVariable('PRODUTO', FOrdemCompraParam.ME0Produto.Text);
      if Trim(FOrdemCompraParam.ME0Classe.Text) = '' then
        QROCAberto.SetVariable('NUM_CLASSE', Null)
      else
        QROCAberto.SetVariable('NUM_CLASSE', FOrdemCompraParam.ME0Classe.Text);
      if Trim(FOrdemCompraParam.ME0SubClasse.Text) = '' then
        QROCAberto.SetVariable('NUM_SUBCLASSE', Null)
      else
        QROCAberto.SetVariable('NUM_SUBCLASSE', FOrdemCompraParam.ME0SubClasse.Text);
      if Trim(FOrdemCompraParam.ME0Finalidade.Text) = '' then
        QROCAberto.SetVariable('COD_FINALIDADE', Null)
      else
        QROCAberto.SetVariable('COD_FINALIDADE', FOrdemCompraParam.ME0Finalidade.Text);
      QROCAberto.SetVariable('DATA_I', StrToDate(FOrdemCompraParam.ME0DataI.Text));
      QROCAberto.SetVariable('DATA_F', StrToDateTime(FOrdemCompraParam.ME0DataF.Text + ' 23:59:59'));
      case FOrdemCompraParam.CB0Ordem.ItemIndex of
        0: QROCAberto.SQL.Add('ORDER BY TB_ORDEM_COMPRA_CAB.DT_EMISSAO');
        1: QROCAberto.SQL.Add('ORDER BY TB_ORDEM_COMPRA_CAB.DT_ENTREGA');
        2: QROCAberto.SQL.Add('ORDER BY TB_ORDEM_COMPRA_CAB.COD_CADASTRO');
      else
        raise Exception.Create('Nenhuma ordem selecionada!');
      end; // Case
      QROCAberto.Open;
      if FROrdemCompra_Aberto = nil then
        FROrdemCompra_Aberto := TFROrdemCompra_Aberto.Create(Application);
      FROrdemCompra_Aberto.QRLPeriodo.Caption := 'De ' + FOrdemCompraParam.ME0DataI.Text + ' Ate ' + FOrdemCompraParam.ME0DataF.Text;

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
      begin
        FROrdemCompra_Aberto.QRLabel9.Caption := 'Oper: ';
        FROrdemCompra_Aberto.QRDBText8.DataField := 'COD_OPERACAO';
        FROrdemCompra_Aberto.QRLabel17.Caption := 'Finalide:';
        FROrdemCompra_Aberto.QRDBText16.DataField := 'COD_FINALIDADE';
        FROrdemCompra_Aberto.QRLabel19.Caption := 'Dept: ';
        FROrdemCompra_Aberto.QRDBText7.DataField := 'DESC_DEPARTAMENTO';
        FROrdemCompra_Aberto.QRLabel20.Caption := 'Venc: ';
        FROrdemCompra_Aberto.QRDBText19.DataField := 'DT_VENCIMENTO';
      end
      else
      begin
        FROrdemCompra_Aberto.QRLabel9.Caption := 'Moeda: ';
        FROrdemCompra_Aberto.QRDBText8.DataField := 'DESC_MOEDA';
        FROrdemCompra_Aberto.QRLabel17.Caption := 'Entrega: ';
        FROrdemCompra_Aberto.QRDBText16.DataField := 'DT_ENTREGA';
        FROrdemCompra_Aberto.QRLabel19.Caption := '';
        FROrdemCompra_Aberto.QRDBText7.DataField := '';
        FROrdemCompra_Aberto.QRLabel20.Caption := '';
        FROrdemCompra_Aberto.QRDBText19.DataField := '';
      end;

      if FOrdemCompraParam.RGPreview.ItemIndex = 0 then
        FROrdemCompra_Aberto.QRPrimario.Preview
      else
        FROrdemCompra_Aberto.QRPrimario.Print;
      QROCAberto.Close;
      QROCAberto.SQL[QROCAberto.SQL.Count - 1] := '';
    end;
end;

procedure TFOrdemCompraCad.Espelho1Click(Sender: TObject);
begin
  inherited;
  if FOrdemCompraParam = nil then
    FOrdemCompraParam := TFOrdemCompraParam.Create(Application);
  FOrdemCompraParam.PGRelatorio.Pages[3].TabVisible := True;
  if FOrdemCompraParam.ShowModal = mrOk then
  begin
    if FROrdemCompra_Espelho = nil then
      FROrdemCompra_Espelho := TFROrdemCompra_Espelho.Create(Application);
    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('Pk', DMOrdemCompra.QOrdemCompraCod_Filial.Value);
    DMFilial.QFilial.Open;

    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('Pk', DMOrdemCompra.QOrdemCompraCod_Cadastro.Value);
    DMCadastro.QCadastro.Open;

    DMMensagem.QMensagem.Close;
    DMMensagem.QMensagem.SetVariable('Pk', DMOrdemCompra.QOrdemCompraCod_Mensagem.Value);
    DMMensagem.QMensagem.Open;
    if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') or (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL') then
      FROrdemCompra_Espelho.QRLMensagem.Caption := DMMensagem.QMensagemDesc_Mensagem.Text + DMMensagem.QMensagemDesc_Complemento.Text + DMMensagem.QMensagemDesc_Complemento1.Text
    else
      FROrdemCompra_Espelho.QRLMensagem.Caption := DMMensagem.QMensagemDesc_Mensagem.Text;
    If FOrdemCompraParam.Rg3Valores.ItemIndex = 0 Then
     Begin
       FROrdemCompra_Espelho.QRDBTValUnitario.Font.Color := clWindowText;
       FROrdemCompra_Espelho.QRDBTValTotal.Font.Color := clWindowText;
       FROrdemCompra_Espelho.QRExpr1.Font.Color := clWindowText;
       FROrdemCompra_Espelho.QRDBText18.Font.Color := clWindowText;
       FROrdemCompra_Espelho.sValCDesconto.Font.Color := clWindowText;
       FROrdemCompra_Espelho.sValIpi.Font.Color := clWindowText;
       FROrdemCompra_Espelho.sValSubstituicao.Font.Color := clWindowText;
       FROrdemCompra_Espelho.sValTotal.Font.Color := clWindowText;
       FROrdemCompra_Espelho.QRLabel9.Font.Color := clWindowText;
       FROrdemCompra_Espelho.QRLabel21.Font.Color := clWindowText;
       FROrdemCompra_Espelho.QRLabel22.Font.Color := clWindowText;
       FROrdemCompra_Espelho.QRLabel23.Font.Color := clWindowText;
       FROrdemCompra_Espelho.QRLabel24.Font.Color := clWindowText;
     End
    Else
     Begin
       FROrdemCompra_Espelho.QRDBTValUnitario.Font.Color := ClWindow;
       FROrdemCompra_Espelho.QRDBTValTotal.Font.Color := ClWindow;
       FROrdemCompra_Espelho.QRExpr1.Font.Color := ClWindow;
       FROrdemCompra_Espelho.QRDBText18.Font.Color := ClWindow;
       FROrdemCompra_Espelho.sValCDesconto.Font.Color := ClWindow;
       FROrdemCompra_Espelho.sValIpi.Font.Color := ClWindow;
       FROrdemCompra_Espelho.sValSubstituicao.Font.Color := ClWindow;
       FROrdemCompra_Espelho.sValTotal.Font.Color := ClWindow;
       FROrdemCompra_Espelho.QRLabel9.Font.Color := ClWindow;
       FROrdemCompra_Espelho.QRLabel21.Font.Color := ClWindow;
       FROrdemCompra_Espelho.QRLabel22.Font.Color := ClWindow;
       FROrdemCompra_Espelho.QRLabel23.Font.Color := ClWindow;
       FROrdemCompra_Espelho.QRLabel24.Font.Color := ClWindow;

     End;
    if FOrdemCompraParam.RGPreview.ItemIndex = 0 then
      FROrdemCompra_Espelho.QRPrimario.Preview
    else
      FROrdemCompra_Espelho.QRPrimario.Print;
  end;
end;

procedure TFOrdemCompraCad.CancelaItem1Click(Sender: TObject);
begin
  inherited;
  if DMOrdemCompra.QOrdemCompra.State <> dsEdit then
    raise Exception.Create('Ordem não está no modo de Alteração!');
  PGOrdemCompra.ActivePage := TSItem;
  DBEQtdCancelado.SetFocus;
  DBEQtdCancelado.ReadOnly := False;
  DBEQtdCancelado.Color := clWindow;
end;

procedure TFOrdemCompraCad.DBEQtdCanceladoExit(Sender: TObject);
begin
  inherited;
  DBEQtdCancelado.ReadOnly := True;
  DBEQtdCancelado.ParentColor := True;
end;

procedure TFOrdemCompraCad.BtConsTransportadoraClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMOrdemCompra.QOrdemCompraCod_Cad_Frete.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFOrdemCompraCad.BtConsTributacaoClick(Sender: TObject);
begin
  inherited;
  if FTributacaoCons = nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal = mrOk then
  begin
    DMOrdemCompra.QItemOC.Edit;
    DMOrdemCompra.QItemOCCod_Tributacao.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value;
  end;
end;

procedure TFOrdemCompraCad.ProdutoAcumulado1Click(Sender: TObject);
var
  wLinha: Integer;
begin
  inherited;
  if FOrdemCompraParam = nil then
    FOrdemCompraParam := TFOrdemCompraParam.Create(Application);
  FOrdemCompraParam.PGRelatorio.Pages[1].TabVisible := True;
  if FOrdemCompraParam.ShowModal = mrOk then
    with DMOrdemCompra do
    begin
      DmUsuario.Checar_Filial_Usuario(TRIM(FOrdemCompraParam.ME1Filial.Text), 'COMPRA');
      QRProdutoAcum.Close;
      QRProdutoAcum.SetVariable('DATA_I', StrToDate(FOrdemCompraParam.ME1DataI.Text));
      QRProdutoAcum.SetVariable('DATA_F', StrToDate(FOrdemCompraParam.ME1DataF.Text + ' 23:59:59'));

      if Trim(FOrdemCompraParam.ME1Filial.Text) = '' then
        QRProdutoAcum.SetVariable('FILIAL', Null)
      else
        QRProdutoAcum.SetVariable('FILIAL', FOrdemCompraParam.ME1Filial.Text);
      if Trim(FOrdemCompraParam.ME1Cadastro.Text) = '' then
        QRProdutoAcum.SetVariable('CADASTRO', Null)
      else
        QRProdutoAcum.SetVariable('CADASTRO', FOrdemCompraParam.ME1Cadastro.Text);
      if Trim(FOrdemCompraParam.ME1Produto.Text) = '' then
        QRProdutoAcum.SetVariable('PRODUTO', Null)
      else
        QRProdutoAcum.SetVariable('PRODUTO', FOrdemCompraParam.ME1Produto.Text);
      case FOrdemCompraParam.CB1Ordem.ItemIndex of
        0: QRProdutoAcum.SQL.Add('ORDER BY TB_PRODUTO.COD_PRODUTO');
        1: QRProdutoAcum.SQL.Add('ORDER BY TB_PRODUTO.DESC_PRODUTO');
      else
        raise Exception.Create('Nenhuma ordem selecionada!');
      end; // Case
      case FOrdemCompraParam.Rg1Situacao.ItemIndex of
        0: QRProdutoAcum.SetVariable('IND_GERAL', 'A'); // somente abertos
        1: QRProdutoAcum.SetVariable('IND_GERAL', Null); // emite geral
      end; // Case
      QRProdutoAcum.Open;
      if FROrdemCompra_ProdutoAcum = nil then
        FROrdemCompra_ProdutoAcum := TFROrdemCompra_ProdutoAcum.Create(Application);
      if FOrdemCompraParam.RGPreview.ItemIndex = 0 then
        FROrdemCompra_ProdutoAcum.QRPrimario.Preview
      else
        FROrdemCompra_ProdutoAcum.QRPrimario.Print;
      QRProdutoAcum.Close;
      wLinha := QRProdutoAcum.SQL.Count - 1;
      QRProdutoAcum.SQL[wLinha] := '';
    end;
end;

procedure TFOrdemCompraCad.SBExcluirClick(Sender: TObject);
begin
  // inherited;
  DMOrdemCompra.ExcluiOrdemCompra;
end;

procedure TFOrdemCompraCad.PorFornecedor1Click(Sender: TObject);
//var
//  a: TPrinterOrientation;
begin
  inherited;
  if FOrdemCompraParam = nil then
    FOrdemCompraParam := TFOrdemCompraParam.Create(Application);
  FOrdemCompraParam.PGRelatorio.Pages[2].TabVisible := True;
  if FOrdemCompraParam.ShowModal = mrOk then
    with DMOrdemCompra do
    begin
      DmUsuario.Checar_Filial_Usuario(TRIM(FOrdemCompraParam.ME2Filial.Text), 'COMPRA');
      QROrdemCompraFor.Close;
      QROrdemCompraFor.SetVariable('DATA_I', StrToDate(FOrdemCompraParam.ME2DataI.Text));
      QROrdemCompraFor.SetVariable('DATA_F', StrToDate(FOrdemCompraParam.ME2DataF.Text + ' 23:59:59'));

      if Trim(FOrdemCompraParam.ME2Filial.Text) = '' then
        QROrdemCompraFor.SetVariable('FILIAL', Null)
      else
        QROrdemCompraFor.SetVariable('FILIAL', FOrdemCompraParam.ME2Filial.Text);
      if FOrdemCompraParam.Rg2Situacao.ItemIndex = 1 then
        QROrdemCompraFor.SetVariable('TODOS', Null)
      else
        QROrdemCompraFor.SetVariable('TODOS', 'A');

      if Trim(FOrdemCompraParam.ME2Cadastro.Text) = '' then
        QROrdemCompraFor.SetVariable('CADASTRO', Null)
      else
        QROrdemCompraFor.SetVariable('CADASTRO', FOrdemCompraParam.ME2Cadastro.Text);
      if Trim(FOrdemCompraParam.Me2Finalidade.Text) = '' then
        QROrdemCompraFor.SetVariable('COD_FINALIDADE', Null)
      else
        QROrdemCompraFor.SetVariable('COD_FINALIDADE', FOrdemCompraParam.Me2Finalidade.Text);
      QROrdemCompraFor.Open;
      if FROrdemCompraFornecedor = nil then
        FROrdemCompraFornecedor := TFROrdemCompraFornecedor.Create(Application);
      FROrdemCompraFornecedor.QRLTitulo.Caption := 'Ordem de Compra por Fornecedor ' + FOrdemCompraParam.ME2DataI.Text + ' até ' + FOrdemCompraParam.ME2DataF.Text;

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
      begin
        FROrdemCompraFornecedor.QRLabel9.Caption := 'Vencto';
        FROrdemCompraFornecedor.QRDBText6.DataField := 'DT_VENCIMENTO';
        FROrdemCompraFornecedor.QRLabel11.Caption := 'Finalidade';
        FROrdemCompraFornecedor.QRDBText8.DataField := 'COD_FINALIDADE';
        FROrdemCompraFornecedor.QRDBText8.Mask := '';
        FROrdemCompraFornecedor.QRLabel15.Caption := 'Operação';
        FROrdemCompraFornecedor.QRDBText11.DataField := 'COD_OPERACAO';
        FROrdemCompraFornecedor.QRLabel16.Caption := 'Departamento';
        FROrdemCompraFornecedor.QRDBText12.DataField := 'DESC_DEPARTAMENTO';

        FROrdemCompraFornecedor.QRExpr3.Visible := False;
        FROrdemCompraFornecedor.QRExpr6.Visible := False;

        FROrdemCompraFornecedor.QRLabel11.Alignment := taLeftJustify;
        FROrdemCompraFornecedor.QRDBText8.Alignment := taCenter;
      end
      else
      begin
        FROrdemCompraFornecedor.QRLabel9.Caption := 'Entrega';
        FROrdemCompraFornecedor.QRDBText6.DataField := 'DT_ENTREGA';
        FROrdemCompraFornecedor.QRLabel11.Caption := 'Desconto';
        FROrdemCompraFornecedor.QRDBText8.DataField := 'VAL_DESCONTO';
        FROrdemCompraFornecedor.QRLabel15.Caption := '';
        FROrdemCompraFornecedor.QRDBText11.DataField := '';
        FROrdemCompraFornecedor.QRLabel16.Caption := '';
        FROrdemCompraFornecedor.QRDBText12.DataField := '';

        FROrdemCompraFornecedor.QRExpr3.Visible := True;
        FROrdemCompraFornecedor.QRExpr6.Visible := True;

        FROrdemCompraFornecedor.QRLabel11.Alignment := taRightJustify;
        FROrdemCompraFornecedor.QRDBText8.Alignment := taRightJustify;
      end;

      if FOrdemCompraParam.RGPreview.ItemIndex = 0 then
        FROrdemCompraFornecedor.QRPrimario.Preview
      else
        FROrdemCompraFornecedor.QRPrimario.Print;
      QROrdemCompraFor.Close;
    end;
end;

procedure TFOrdemCompraCad.DBEdProdutoExit(Sender: TObject);
var
  mNumeroFabricante: string;
begin
  inherited;
  if DSPrimario.State in [DsInsert, DsEdit] then
  begin
    if (DMOrdemCompra.QItemOCnome_produto.Value = '') or
        (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS') then
    begin
      mNumeroFabricante := ''; // Inicializa valor do numero fabricante.
      if Trim(DMOrdemCompra.QItemOCCOD_PRODUTO.Text) <> '' then
      begin
        mNumeroFabricante := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO', 'NUM_FABRICANTE = ' + chr(39) + Trim(DMOrdemCompra.QItemOCCOD_PRODUTO.Text) + chr(39), True);
        if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS') and (mNumeroFabricante = '') then
          mNumeroFabricante := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO',
              'NUM_FABRICANTE LIKE ' + QuotedStr(DMOrdemCompra.QItemOCCOD_PRODUTO.Text) + ' || ' +
              QuotedStr('%') + ' ORDER BY NUM_FABRICANTE');
        if Trim(mNumeroFabricante) = '' then
          DMOrdemCompra.QItemOCCOD_PRODUTO.Text := mNumeroFabricante
        else
        begin
          if (DMOrdemCompra.DSItemOC.State = dsBrowse) and (DMOrdemCompra.QItemOCCOD_PRODUTO.Value = 0) then
            DMOrdemCompra.QItemOC.Insert;
          if (DMOrdemCompra.DSItemOC.State = dsBrowse) and (DMOrdemCompra.QItemOCCOD_PRODUTO.Value > 0) then
            DMOrdemCompra.QItemOC.Edit;
          DMOrdemCompra.QItemOCCOD_PRODUTO.Value := StrToFloat(mNumeroFabricante);
        end;
      end;
    end;

    if (DMParamSistema.QParamSistemaCod_Empresa.Text <> 'MOINHO') then
    begin
      if DMOrdemCompra.QItemOCCod_Produto.Text <> '' then
      begin
        MeDtReferencia.Text := DMOracle.BuscaNome('SELECT DT_COMPRA FROM TB_ESTOQUE', 'COD_PRODUTO = ' + FloatToStr(DMOrdemCompra.QItemOCCod_Produto.Value), True);
        DMOrdemCompra.QItemOCCod_Tributacao.Text := DMOracle.BuscaNome('SELECT COD_TRIBUTACAO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(DMOrdemCompra.QItemOCCod_Produto.Value), True);
        if Trim(MeDtReferencia.Text) = '' then
        begin
          MeDtReferencia.Text := DateToStr(Date - 10);
          DmOrdemCompra.QOrdemCompraUltima.SetVariable('RECEBIMENTO1', Date);
        end
        else
          DmOrdemCompra.QOrdemCompraUltima.SetVariable('RECEBIMENTO1', StrToDate(MeDtReferencia.Text));
        atualizaUltimaOc;
        if (DMParamSistema.QParamSistemaCod_Empresa.Text <> 'FAVILLE') and (DMParamSistema.QParamSistemaCod_Empresa.Text <> 'ZADIMEL') then
        begin
          if not DmOrdemCompra.QOrdemCompraUltima.Eof then
            DmOrdemCompra.QItemOCVAL_UNITARIO.Value := DmOrdemCompra.QOrdemCompraUltimaVAL_UNITARIO.Value;
        end;
        DmOrdemCompra.QItemOCQt_Embalagem.Text := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO', 'COD_PRODUTO = ' + DmOrdemCompra.QItemOCCod_Produto.Text, True);
      end;
    end;
    //solicitado por RUBENS - CLEBER 16/04/2020
    if (DMParamSistema.QParamSistemaCod_Empresa.Text = 'KREUZ') then
    begin
      if DMOrdemCompra.QItemOCCod_Produto.Text <> '' then
      begin
        DMEstoque.QEstoqueCons.Close;
        DMEstoque.QEstoqueCons.SetVariable('COD_PRODUTO', DMOrdemCompra.QItemOCCod_Produto.Text);
        DMEstoque.QEstoqueCons.Open;
        if not DMEstoque.QEstoqueCons.Eof then
          DMOrdemCompra.QItemOCVAL_UNITARIO.Text := DMEstoque.QEstoqueConsVL_CUSTO_MEDIO.Text;
      end;

    end;
  end;
end;

procedure TFOrdemCompraCad.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  with DmOrdemCompra do
  begin
    QOrdemCompraUltima.Close;
  end;
  with DmEstoque do
  begin
    QEstoqueCons.Close;
  end;

end;

procedure TFOrdemCompraCad.atualizaUltimaOc;
begin
  with DmOrdemCompra do
  begin
    QOrdemCompraUltima.Close;
    QOrdemCompraUltima.SetVariable('RECEBIMENTO', StrToDate(MeDtReferencia.Text));
    QOrdemCompraUltima.SetVariable('PRODUTO', QItemOcCod_Produto.Value);
    QOrdemCompraUltima.Open;
  end;
  with DmEstoque do
  begin
    QEstoqueCons.Close;
    QEstoqueCons.SetVariable('PRODUTO', Null);
    QEstoqueCons.SetVariable('TIPO_LOTE', Null);
    QEstoqueCons.SetVariable('COD_PRODUTO', DmOrdemCompra.QItemOcCod_Produto.Value);
    QEstoqueCons.SetVariable('FILIAL', DmOrdemCompra.QOrdemCompraCod_Filial.Value);
    QEstoqueCons.Open;
  end;
end;

procedure TFOrdemCompraCad.MeDtReferenciaExit(Sender: TObject);
begin
  inherited;
  DmOrdemCompra.QOrdemCompraUltima.SetVariable('RECEBIMENTO1', Date);
  atualizaUltimaOc;
end;

procedure TFOrdemCompraCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(2);
end;

procedure TFOrdemCompraCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMOrdemCompra do
  begin
    QOrdemCompra.Close;
    QItemOC.Close;
    QSomaItemOC.Close;
    QOrdemCompraCaixa.Close;
  end;
  Action := CaFree;
  FOrdemCompraCad := nil;
end;

procedure TFOrdemCompraCad.NotasQueAtenderamOC1Click(Sender: TObject);
begin
  inherited;
  if FOrdemCompraParam = nil then
    FOrdemCompraParam := TFOrdemCompraParam.Create(Application);
  FOrdemCompraParam.PGRelatorio.Pages[4].TabVisible := True;
  if FOrdemCompraParam.ShowModal = mrOk then
    with DMOrdemCompra do
    begin
      QROrdemCompraNota.Close;
      if Trim(FOrdemCompraParam.ME3OrdemCompra.Text) <> '' then
        QROrdemCompraNota.SetVariable('NUM_ORDEM_COMPRA', Trim(FOrdemCompraParam.ME3OrdemCompra.Text))
      else
        QROrdemCompraNota.SetVariable('NUM_ORDEM_COMPRA', Null);
      if Trim(FOrdemCompraParam.Me3Cadastro.Text) <> '' then
        QROrdemCompraNota.SetVariable('COD_CADASTRO', Trim(FOrdemCompraParam.Me3Cadastro.Text))
      else
        QROrdemCompraNota.SetVariable('COD_CADASTRO', Null);

      if Trim(FOrdemCompraParam.Me3Filial.Text) <> '' then
        QROrdemCompraNota.SetVariable('FILIAL', Trim(FOrdemCompraParam.Me3Filial.Text))
      else
        QROrdemCompraNota.SetVariable('FILIAL', null);

      if Trim(FOrdemCompraParam.Me3Produto.Text) <> '' then
        QROrdemCompraNota.SetVariable('PRODUTO', Trim(FOrdemCompraParam.Me3Produto.Text))
      else
        QROrdemCompraNota.SetVariable('PRODUTO', null);

      QROrdemCompraNota.SetVariable('DT_EMISSAO_INI', FOrdemCompraParam.Me3DtInicial.Text);
      QROrdemCompraNota.SetVariable('DT_EMISSAO_FIM', FOrdemCompraParam.Me3DtFinal.Text);
      QROrdemCompraNota.Open;
      //    If QROrdemCompraNota.Eof Then
      //       Raise Exception.Create ('Ordem de Compra ainda Não Atendida');
      if FROrdemCompraNota = nil then
        FROrdemCompraNota := TFROrdemCompraNota.Create(Application);
      FROrdemCompraNota.QRLFornecedor.caption := 'Fornecedor: ' + FOrdemCompraParam.Ed3Cadastro.text;
      FROrdemCompraNota.QRLFilial.caption := 'Filial: ' + FOrdemCompraParam.Ed3Filial.text;

      if FOrdemCompraParam.RGPreview.ItemIndex = 0 then
        FROrdemCompraNota.QRPrimario.Preview
      else
        FROrdemCompraNota.QRPrimario.Print;
      QROrdemCompraNota.Close;
    end;

end;

procedure TFOrdemCompraCad.PosioFinanceiraOrdemCompra1Click(
  Sender: TObject);
begin
  inherited;
  if FOrdemCompraParam = nil then
    FOrdemCompraParam := TFOrdemCompraParam.Create(Application);
  FOrdemCompraParam.PGRelatorio.Pages[5].TabVisible := True;
  if FOrdemCompraParam.ShowModal = mrOk then
    with DMOrdemCompra do
    begin
      QrOrdemCompraFinanceiro.Close;
      QrOrdemCompraFinanceiro.SetVariable('COD_ORDEM_COMPRA_CAB', FOrdemCompraParam.Me4OrdemCompra.Text);
      QrOrdemCompraFinanceiro.Open;
      if FrOrdemCompraFinanceiro = nil then
        FrOrdemCompraFinanceiro := TFrOrdemCompraFinanceiro.Create(Application);
      FrOrdemCompraFinanceiro.QRLTitulo.caption := 'Posição Financeira da Ordem de Compra:' + FOrdemCompraParam.Me4NumeroOrdemCompra.text;
      if FOrdemCompraParam.RGPreview.ItemIndex = 0 then
        FrOrdemCompraFinanceiro.QRPrimario.Preview
      else
        FrOrdemCompraFinanceiro.QRPrimario.Print;
      QrOrdemCompraFinanceiro.Close;
    end;

end;

procedure TFOrdemCompraCad.BtConsCulturaClick(Sender: TObject);
begin
  inherited;
  if FCulturaCons = nil then
    FCulturaCons := TFCulturaCons.Create(Application);
  if FCulturaCons.ShowModal = mrOk then
    DMOrdemCompra.QOrdemCompraCod_Cultura.Value := DMCultura.QCulturaConsCod_Cultura.Value;
end;

procedure TFOrdemCompraCad.BtConsMensagemClick(Sender: TObject);
begin
  inherited;
  if FMensagemCons = nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  if FMensagemCons.ShowModal = mrOk then
    DMOrdemCompra.QOrdemCompraCod_Mensagem.Value := DMMensagem.QMensagemConsCod_Mensagem.Value;
end;

procedure TFOrdemCompraCad.OCcomProdutosemTrnsito1Click(Sender: TObject);
begin
  inherited;
  if FOrdemCompraParam = nil then
    FOrdemCompraParam := TFOrdemCompraParam.Create(Application);
  FOrdemCompraParam.PGRelatorio.Pages[6].TabVisible := True;
  if FOrdemCompraParam.ShowModal = mrOk then
    with DMOrdemCompra do
    begin
      QROrdemCompraTransito.Close;
      if Trim(FOrdemCompraParam.ME5OrdemCompra.Text) <> '' then
        QROrdemCompraTransito.SetVariable('NUM_ORDEM_COMPRA', Trim(FOrdemCompraParam.ME5OrdemCompra.Text))
      else
        QROrdemCompraTransito.SetVariable('NUM_ORDEM_COMPRA', Null);
      if Trim(FOrdemCompraParam.Me5Cadastro.Text) <> '' then
        QROrdemCompraTransito.SetVariable('COD_CADASTRO', Trim(FOrdemCompraParam.Me5Cadastro.Text))
      else
        QROrdemCompraTransito.SetVariable('COD_CADASTRO', Null);

      if Trim(FOrdemCompraParam.Me5Filial.Text) <> '' then
        QROrdemCompraTransito.SetVariable('FILIAL', Trim(FOrdemCompraParam.Me5Filial.Text))
      else
        QROrdemCompraTransito.SetVariable('FILIAL', null);

      if Trim(FOrdemCompraParam.Me5Produto.Text) <> '' then
        QROrdemCompraTransito.SetVariable('PRODUTO', Trim(FOrdemCompraParam.Me5Produto.Text))
      else
        QROrdemCompraTransito.SetVariable('PRODUTO', null);

      QROrdemCompraTransito.SetVariable('DT_EMISSAO_INI', FOrdemCompraParam.Me5DtInicial.Text);
      QROrdemCompraTransito.SetVariable('DT_EMISSAO_FIM', FOrdemCompraParam.Me5DtFinal.Text);
      QROrdemCompraTransito.Open;
      //    If QROrdemCompraTransito.Eof Then
      //       Raise Exception.Create ('Ordem de Compra ainda Não Atendida');
      if FROrdemCompraProdutoTransito = nil then
        FROrdemCompraProdutoTransito := TFROrdemCompraProdutoTransito.Create(Application);
      FROrdemCompraProdutoTransito.QRLbFornecedor.caption := 'Fornecedor: ' + FOrdemCompraParam.Ed5Cadastro.text;
      FROrdemCompraProdutoTransito.QRLbFilial.caption := 'Filial: ' + FOrdemCompraParam.Ed5Filial.text;
      if FOrdemCompraParam.RGPreview.ItemIndex = 0 then
        FROrdemCompraProdutoTransito.QRPrimario.Preview
      else
        FROrdemCompraProdutoTransito.QRPrimario.Print;
      QROrdemCompraTransito.Close;
    end;
end;

procedure TFOrdemCompraCad.DBEdit39Change(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARZ' then
    DMOrdemCompra.QItemOCQT_EMBALAGEM.Value := 1;

end;

procedure TFOrdemCompraCad.BtConsFinalidadeClick(Sender: TObject);
begin
  inherited;
  if FFinalidadeCons = nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.showModal = mrOk then
    DMOrdemCompra.QOrdemCompraCOD_FINALIDADE.Value := DMFinalidade.QFinalidadeConsCod_Finalidade.Value;
  DBEdit18.SetFocus;
end;

procedure TFOrdemCompraCad.ValorUtilizadodoLimitedeCompras1Click(
  Sender: TObject);
begin
  inherited;
  if FOrdemCompraParam = nil then
    FOrdemCompraParam := TFOrdemCompraParam.Create(Application);
  FOrdemCompraParam.PGRelatorio.Pages[7].TabVisible := True;
  if FOrdemCompraParam.ShowModal = mrOk then
    with DMOrdemCompra do
    begin
      QROrdemCompraLimite.Close;
      if Trim(FOrdemCompraParam.Me6Filial.Text) <> '' then
        QROrdemCompraLimite.SetVariable('COD_FILIAL', Trim(FOrdemCompraParam.Me6Filial.Text))
      else
        QROrdemCompraLimite.SetVariable('COD_FILIAL', null);

      QROrdemCompraLimite.SetVariable('DT_INICIO', FOrdemCompraParam.Me6DtInicial.Text);
      QROrdemCompraLimite.SetVariable('DT_FIM', FOrdemCompraParam.Me6DtFinal.Text);
      QROrdemCompraLimite.Open;
      if FrOrdemCompraLimite = nil then
        FrOrdemCompraLimite := tFrOrdemCompraLimite.Create(Application);
      FrOrdemCompraLimite.QRLTitulo.caption := 'Filial: ' + FOrdemCompraParam.Ed6Filial.text + ' De ' + FOrdemCompraParam.Me6DtInicial.Text + ' Até ' + FOrdemCompraParam.Me6DtFinal.Text;
      if FOrdemCompraParam.RGPreview.ItemIndex = 0 then
        FrOrdemCompraLimite.QRPrimario.Preview
      else
        FrOrdemCompraLimite.QRPrimario.Print;
      QROrdemCompraLimite.Close;
    end;
end;

procedure TFOrdemCompraCad.CalculoLimite(wLocal: string);
var
  wDtInicio, wDtFim: string;
  Day, Month, Year: Word;
  wNrDiasMes: Integer;
  wLimite, wValorGasto: Real;
begin
  if DMOrdemCompra.QOrdemCompraCOD_FINALIDADE.Text <> '' then
  begin
    if DMOrdemCompra.QItemOC.State in [dsEdit, dsInsert] then // esta fazendo este post aqui para poder somar o valor total da OC
      DMOrdemCompra.QItemOC.Post;
    wLimite := StrToFloat('0' + DMOracle.BuscaNome('SELECT VAL_LIMITE FROM TB_FINALIDADE', 'COD_FINALIDADE = ' + DMOrdemCompra.QOrdemCompraCod_Finalidade.Text, True));
    if wLimite <> 0 then
    begin
      DecodeDate(Date, Year, Month, Day);
      wDtInicio := '01' + '/' + IntToStr(Month) + '/' + IntToStr(Year);
      wDtFim := '01' + '/' + IntToStr(Month) + '/' + IntToStr(Year);
      wNrDiasMes := DMOracle.DiasNoMes(Date);
      wDtFim := IntToStr(wNrDiasMes) + '/' + IntToStr(Month) + '/' + IntToStr(Year);
      DMOrdemCompra.QOrdemCompraLimite.Close;
      DMOrdemCompra.QOrdemCompraLimite.SetVariable('Dt_Inicio', wDtInicio);
      DMOrdemCompra.QOrdemCompraLimite.SetVariable('Dt_Fim', wDtFim);
      DMOrdemCompra.QOrdemCompraLimite.SetVariable('Cod_Finalidade', DMOrdemCompra.QOrdemCompraCOD_FINALIDADE.Text);
      DMOrdemCompra.QOrdemCompraLimite.SetVariable('Cod_Ordem_Compra_Cab', DMOrdemCompra.QOrdemCompraCOD_ORDEM_COMPRA_CAB.Text);
      DMOrdemCompra.QOrdemCompraLimite.Open;
      wValorGasto := 0;
      if not DMOrdemCompra.QOrdemCompraLimite.Eof then
        wValorGasto := DMOrdemCompra.QOrdemCompraLimiteSVLR_LIQUIDO.Value;
      if wLocal = 'SALVANDO' then // somente manda mensagem quando estiver salvando (botao salvar)
      begin
        if wValorGasto + DMOrdemCompra.QSomaItemOCSVLR_LIQUIDO.Value > wLimite then
          raise Exception.Create('Já foi gasto todo o limite para este mês - favor conversar com a gerência');
      end
      else
        MeLimite.Text := FloatToStr(wLimite - wValorGasto);
    end;
  end;

end;

procedure TFOrdemCompraCad.DBEdit18Exit(Sender: TObject);
begin
  inherited;
  CalculoLimite('FINALIDADE'); // vai calcular o limite de credito para gasto no mes
end;

procedure TFOrdemCompraCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  MeLimite.Clear;
  PGOrdemCompra.ActivePage := TSCabecalho;
  if DBEdit5.CanFocus then
    DBEdit5.SetFocus;
end;

procedure TFOrdemCompraCad.BitBtn3Click(Sender: TObject);
var
  wNumDoc, wContaCred, wContaDeb: string;
  wCodDoc, wCodHistorico, wVlrLancto, wCodCompl: Real;
  wDtLancto: TDateTime;
  wFilial: Integer;
begin
  inherited;
  if Trim(FMHistorico.MeHistorico.Text) = '' then
    raise Exception.Create('Preencher Histórico');
  if Trim(MeValor.Text) = '' then
    raise Exception.Create('Preecher Valor');
  DMHistorico.QHistorico.Close;
  DMHistorico.QHistorico.SetVariable('Pk', StrToInt(Trim(FMHistorico.MeHistorico.Text)));
  DMHistorico.QHistorico.Open;
  if DMHistorico.QHistorico.Eof then
    raise Exception.Create('Historico Não Cadastrado');
  DMPedido.QCaixa.Close;
  DMPedido.QCaixa.Open;
  DMPedido.QCaixa.Insert;
  DMPedido.QCaixaCOD_USUARIO.Value := DMusuario.CodUsuarioCorrente;
  DMPedido.QCaixaCOD_FILIAL.Value := DMOrdemCompra.QOrdemCompraCod_Filial.Value;
  DMPedido.QCaixaCOD_DEPARTAMENTO.Value := DmUsuario.CodDepartamentoUsuario;
  DMPedido.QCaixaCOD_HISTORICO.Value := StrToInt(Trim(FMHistorico.MeHistorico.Text));
  DMPedido.QCaixaDT_MOVIMENTO.Value := Date;
  DMPedido.QCaixaVAL_MOVIMENTO.Value := StrToFloat(Bib.LimpaString(Trim(MeValor.text), '.'));
  DMPedido.QCaixaNUM_DOCUMENTO.Value := DMOrdemCompra.QOrdemCompraNum_Ordem_Compra.Value;
  DMPedido.QCaixaCOD_CADASTRO.Value := DMOrdemCompra.QOrdemCompraCod_Cadastro.Value;
  DMPedido.QCaixaDT_USUARIO.Value := DMOracle.DataServ;
  DMPedido.QCaixaDESC_COMPLEMENTO.Value := 'Adiantamento Ordem Compra. ' + DMOrdemCompra.QOrdemCompraNum_Ordem_Compra.Text;
  DMPedido.QCaixaCod_Ordem_Compra_Cab.Value := DMOrdemCompra.QOrdemCompraCod_Ordem_Compra_Cab.Value;
  DMPedido.QCaixa.Post;
  if (DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S') then
  begin
    wCodDoc := DMPedido.QCaixaCod_Caixa_Mov.Value;
    wNumDoc := FloatToStr(DMOrdemCompra.QOrdemCompraNum_Ordem_Compra.Value) + '-' + Trim(DMPedido.QCaixaDesc_Complemento.Value);
    wFilial := DMPedido.QCaixaCod_Filial.Value;
    wContaCred := DMHistorico.QHistoricoCod_Contabil_Cred.Value;
    wContaDeb := DMHistorico.QHistoricoCod_Contabil_Deb.Value;
    wCodCompl := DMPedido.QCaixaCod_Cadastro.Value;
    wCodHistorico := DMHistorico.QHistoricoCod_Historico_Contabil.Value;
    if wCodHistorico <> 0 then
    begin
      wVlrLancto := DMPedido.QCaixaVal_Movimento.Value;
      wDtLancto := DMPedido.QCaixaDt_Movimento.Value;
      DMPlanilha.GravaLanc('CX', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDtLancto, wContaDeb);
      DMPlanilha.GravaLanc('CX', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDtLancto, wContaCred);
    end;
  end;
  DMOrdemCompra.QOrdemCompra.Edit;
  DMOrdemCompra.QOrdemCompraVal_Adiantamento.Value := DMOrdemCompra.QOrdemCompraVal_Adiantamento.Value + StrToFloat(Bib.LimpaString(Trim(MeValor.Text), '.'));
  DMOrdemCompra.QOrdemCompra.Post;
  wVlrLancto := DMOrdemCompra.QSomaItemOCSVLR_LIQUIDO.Value - DMOrdemCompra.QOrdemCompraVal_Adiantamento.Value;
  if wVlrLancto > 0 then
    MeSaldo.Text := FloatToStr(wVlrLancto)
  else
    MeSaldo.Text := '0,00';

  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;
  ShowMessage('Movimentos Gerados com Sucesso!');
  DMOrdemCompra.QOrdemCompraCaixa.Close;
  DMOrdemCompra.QOrdemCompraCaixa.Open;
end;

procedure TFOrdemCompraCad.BitBtn4Click(Sender: TObject);
var
  wNumero: Integer;
begin
  inherited;
  if FRReciboCaixa = nil then
    FRReciboCaixa := TFRReciboCaixa.Create(Application);
  FRReciboCaixa.QRBand2.Enabled := DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL';
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK', DMOrdemCompra.QOrdemCompraCod_Filial.Value);
  DMFilial.QFilial.Open;
  FRReciboCaixa.QRLResponsavel.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + DMOrdemCompra.QOrdemCompraCOD_CADASTRO.Text);
  FRReciboCaixa.QRLRecibo.Caption := DMFilial.QFilialDesc_Filial.value;
  wNumero := DMSequencia.Sequencia(DMOrdemCompra.QOrdemCompraCod_Filial.Value, 'RECIBO');
  FRReciboCaixa.QRLNumero.Caption := FloatToStr(wNumero);
  FRReciboCaixa.QRLNumDocumento.Caption := DMOrdemCompra.QOrdemCompraNum_Ordem_Compra.Text;
  FRReciboCaixa.QRLComplemento.Caption := 'Adiantamento Referente Ordem de Compra Nr. ' + DMOrdemCompra.QOrdemCompraNum_Ordem_Compra.Text;
  FRReciboCaixa.QRLValorExtenso.Caption := Bib.extenso(StrToFloat(Bib.LimpaString(Trim(MeValor.text), '.')), 'REAL');
  FRReciboCaixa.QRLValor.Caption := FormatFloat('#,##0.00', StrToFloat(Bib.LimpaString(Trim(MeValor.text), '.')));
  FRReciboCaixa.QRLData.Caption := FormatDateTime(', dd "de" mmmm "de" yyyy', Date);

  FRReciboCaixa.QRLResponsavel1.Caption := FRReciboCaixa.QRLResponsavel.Caption;
  FRReciboCaixa.QRLRecibo1.Caption := DMFilial.QFilialDesc_Filial.value;
  FRReciboCaixa.QRLNumero1.Caption := FloatToStr(wNumero);
  FRReciboCaixa.QRLNumDocumento1.Caption := DMOrdemCompra.QOrdemCompraNum_Ordem_Compra.Text;
  FRReciboCaixa.QRLComplemento1.Caption := 'Adiantamento Referente Ordem de Compra Nr. ' + DMOrdemCompra.QOrdemCompraNum_Ordem_Compra.Text;
  FRReciboCaixa.QRLValorExtenso1.Caption := Bib.extenso(StrToFloat(Bib.LimpaString(Trim(MeValor.text), '.')), 'REAL');
  FRReciboCaixa.QRLValor1.Caption := FormatFloat('#,##0.00', StrToFloat(Bib.LimpaString(Trim(MeValor.text), '.')));
  FRReciboCaixa.QRLData1.Caption := FormatDateTime(', dd "de" mmmm "de" yyyy', Date);

  FRReciboCaixa.QuickRep1.Preview;
  DMFilial.QFilial.Close;

end;

procedure TFOrdemCompraCad.PGOrdemCompraChange(Sender: TObject);
begin
  inherited;
  if PGOrdemCompra.ActivePage = TsAdiantamentos then
  begin
    MeValor.Text := FloatToStr(DMOrdemCompra.QSomaItemOCSVLR_LIQUIDO.Value - DMOrdemCompra.QOrdemCompraVal_Adiantamento.Value);
    MeSaldo.Text := FloatToStr(DMOrdemCompra.QSomaItemOCSVLR_LIQUIDO.Value - DMOrdemCompra.QOrdemCompraVal_Adiantamento.Value);
  end;

end;

procedure TFOrdemCompraCad.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if DMOrdemCompra.QOrdemCompraCaixaCod_Ordem_Compra_Cab.Text = '' then
    raise Exception.Create('Selecionar uma Ordem de Compra para voltar adiantamento');
  if DMOrdemCompra.QOrdemCompraCaixaCod_Caixa_Mov.Text = '' then
    raise Exception.Create('Ordem de Compra Sem Adiantamentos');
  if DMOracle.DBCemapa.InTransaction = False then
    DMOracle.DBCemapa.StartTransaction;
  try
    DMPedido.QCaixa.Close;
    DMPedido.QCaixa.SetVariable('Pk', DMOrdemCompra.QOrdemCompraCaixaCod_Caixa_Mov.Value);
    DMPedido.QCaixa.Open;
    // Vai descontabilizar
    DMPlanilha.Descontabiliza(DMOrdemCompra.QOrdemCompraCaixaCod_Caixa_Mov.Value, 'CX');
    // Vai atualizar o valor do adiantamento
    DMOrdemCompra.QOrdemCompra.Edit;
    DMOrdemCompra.QOrdemCompraVal_Adiantamento.Value := DMOrdemCompra.QOrdemCompraVal_Adiantamento.Value - DMOrdemCompra.QOrdemCompraCaixaVal_Movimento.Value;
    DMOrdemCompra.QOrdemCompra.Post;

    // Exclui o lancamento do caixa
    DMPedido.QCaixa.Delete;
    DMOracle.DBCemapa.Commit;
    DMPedido.QCaixa.Close;
    DMOrdemCompra.QOrdemCompraCaixa.Close;
    DMOrdemCompra.QOrdemCompraCaixa.Open;
    ShowMessage('Movimento Excluido com Sucesso!');
  except
    DMPedido.QCaixa.Cancel;
    DMOracle.DBCemapa.RollBack;
    DMPedido.QCaixa.Close;
  end;

end;

procedure TFOrdemCompraCad.BtDepartamentoConsClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.showModal = mrOk then
    DMOrdemCompra.QOrdemCompraCOD_DEPARTAMENTO.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;
end;

procedure TFOrdemCompraCad.BtConsOSClick(Sender: TObject);
begin
  inherited;
  if FOsCons = nil then
    FOsCons := TFOsCons.Create(Application);
  if FOsCons.ShowModal = MrOk then
    DMOrdemCompra.QOrdemCompraNUM_OS.Value := DMOs.QOSConsNUM_OS.Value;
end;

procedure TFOrdemCompraCad.DSPrimarioStateChange(Sender: TObject);
var
  b: bool;
begin
  inherited;
  b := DSPrimario.State in [DsInsert, DsEdit];
  BtConsFilial.Enabled := b;
  BtConsCadastro.Enabled := b;
  BtConsOperacao.Enabled := b;
  BtConsFinalidade.Enabled := b;
  BtDepartamentoCons.Enabled := b;
  BtConsMoeda.Enabled := b;
  BtConsCultura.Enabled := b;
  BtConsTransportadora.Enabled := b;
  BtConsMensagem.Enabled := b;
  BtConsOS.Enabled := b;
  BtConsProduto.Enabled := b;
  BtConsTributacao.Enabled := b;
end;

procedure TFOrdemCompraCad.DBPVendedorDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVendedorCons;
  Classe := TFVendedorCons;
end;

procedure TFOrdemCompraCad.DBPanel1DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTipoLoteCons;
  Classe := TFTipoLoteCons;
end;

procedure TFOrdemCompraCad.OracleNavigator1BeforeAction(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  {if (Button = nbInsert) or (Button = nbPost) then
    DBEdProduto.SetFocus;}
  if (Button = nbPost) and (not ValidaCampos(Self, DMOrdemCompra.DSItemOC)) then
    Abort;

end;

procedure TFOrdemCompraCad.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = Chr(43) then
  begin
    if (DMParamSistema.QparamSistemaCod_Empresa.Value <> 'MARTICAR') then
    begin
      DMOrdemCompra.QItemOC.Append;
      Key := #0;
    end;
    DBEdProduto.SetFocus;
  end;
end;

procedure TFOrdemCompraCad.MarcarOrdemCompracomoAtendida1Click(
  Sender: TObject);
Var wSaldo :Real;
  wEvento: TDataSetNotifyEvent;
begin
  inherited;
  If DMOrdemCompra.QOrdemCompraCOD_ORDEM_COMPRA_CAB.Text = '' Then
     Raise exception.Create('Selectionar uma ordem de compra');
  DMOrdemCompra.QItemOC.First;
  DMOrdemCompra.QOrdemCompra.Edit;
  wEvento := DMOrdemCompra.QItemOC.AfterPost;
  DMOrdemCompra.QItemOC.AfterPost := Nil;
  While not(DMOrdemCompra.QItemOC.Eof) do
   Begin
     wSaldo := DMOrdemCompra.QItemOCQT_PEDIDO.Value - DMOrdemCompra.QItemOCQT_CANCELADO.Value;
     DMOrdemCompra.QItemOC.Edit;
     DMOrdemCompra.QItemOCQT_ATENDIDO.Value := wSaldo;
     DMOrdemCompra.QItemOC.Post;
     DMOrdemCompra.QItemOC.Next;
   End;
  DMOrdemCompra.QItemOC.AfterPost := wEvento;
  DMOrdemCompra.QOrdemCompra.Post;
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;  
end;

procedure TFOrdemCompraCad.AtendeItemPedido1Click(Sender: TObject);
begin
  inherited;
  if DMOrdemCompra.QOrdemCompra.State <> dsEdit then
    raise Exception.Create('Ordem não está no modo de Alteração!');
  PGOrdemCompra.ActivePage := TSItem;
  DBQtde_Atendido.SetFocus;
  DBQtde_Atendido.ReadOnly := False;
  DBQtde_Atendido.Color := clWindow;

end;

procedure TFOrdemCompraCad.DBQtde_AtendidoExit(Sender: TObject);
begin
  inherited;
  DBQtde_Atendido.ReadOnly := True;
  DBQtde_Atendido.ParentColor := True;

end;

procedure TFOrdemCompraCad.EdNumFabricanteExit(Sender: TObject);
var mNumeroFabricante: string;
begin //solicitado por FABI - ULTRAMAQ. Junior 16/03/2021
  inherited;
    mNumeroFabricante := ''; // Inicializa valor do numero fabricante.
    if Trim(EdNumFabricante.Text) <> '' then
    begin
      mNumeroFabricante := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO', 'NUM_FABRICANTE = ' + chr(39) + Trim(EdNumFabricante.Text) + chr(39), True);
      if Trim(mNumeroFabricante) = '' then
        EdNumFabricante.Text := mNumeroFabricante
      else
      begin
        if (DMOrdemCompra.DSItemOC.State = dsBrowse) and (DMOrdemCompra.QItemOCCOD_PRODUTO.Value = 0) then
          DMOrdemCompra.QItemOC.Insert;
        if (DMOrdemCompra.DSItemOC.State = dsBrowse) and (DMOrdemCompra.QItemOCCOD_PRODUTO.Value > 0) then
          DMOrdemCompra.QItemOC.Edit;
        DMOrdemCompra.QItemOCCOD_PRODUTO.Value := StrToFloat(mNumeroFabricante);
      end;
      EdNumFabricante.Text := '';
      DBEdit22.SetFocus;
    end;
end;

procedure TFOrdemCompraCad.EdNumFabricanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then
    BtConsProduto.Click;
end;

procedure TFOrdemCompraCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit2.Text);
end;

procedure TFOrdemCompraCad.DBEdit3Exit(Sender: TObject);
begin
  inherited;
{  if ( DMOracle.FastSelect('IND_COMPRAS','TB_OPERACAO','COD_OPERACAO = ' + FOrdemCompraCad.DBEdit3.Text ) <> 'C' ) then
Na radiolandia é utilizado operação de devolução, por este motivo foi alterado para o tipo operação para separar o que não é entrada.
Alex 18/12/2025}
  if ( DMOracle.FastSelect('IND_TIPO_OPERACAO','TB_OPERACAO','COD_OPERACAO = ' + FOrdemCompraCad.DBEdit3.Text ) <> 'E' ) then
  begin
    ShowMessage('Esta operação não é do tipo ENTRADA!!');
    FOrdemCompraCad.DBEdit3.SetFocus;
  end;
end;

end.

