unit UNotaClassificacaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, OracleNavigator, variants,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  ActnList;

type
  TFNotaClassificacaoCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
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
    TabSheet2: TTabSheet;
    SBNotaClassificacao: TSpeedButton;
    DBDirceu1: TDBDirceu;
    SBProduto: TSpeedButton;
    DBDirceu2: TDBDirceu;
    DSItens: TDataSource;
    OracleNavigator1: TOracleNavigator;
    DBGrid1: TDBGrid;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    SBNotaCab: TSpeedButton;
    DSItensGrid: TDataSource;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    SBDestino: TSpeedButton;
    DBDirceu3: TDBDirceu;
    Opes1: TMenuItem;
    GerarContasPagar1: TMenuItem;
    DBEdit12: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    LBTotalPeso: TLabel;
    VoltaContasPagar1: TMenuItem;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    SBFilial: TSpeedButton;
    DBDirceu4: TDBDirceu;
    Label15: TLabel;
    LBTotalValor: TLabel;
    NotasdeProdutosClassificadasemamberto1: TMenuItem;
    NotasdeProdutosClassificadosPorfatura1: TMenuItem;
    NotasdeProdutosClassificadosBaixados1: TMenuItem;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBNotaClassificacaoClick(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
    procedure SBNotaCabClick(Sender: TObject);
    procedure DSItensStateChange(Sender: TObject);
    procedure SBDestinoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DSItensDataChange(Sender: TObject; Field: TField);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure GerarContasPagar1Click(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure VoltaContasPagar1Click(Sender: TObject);
    procedure NotasdeProdutosClassificadasemamberto1Click(Sender: TObject);
    procedure NotasdeProdutosClassificadosPorfatura1Click(Sender: TObject);
    procedure NotasdeProdutosClassificadosBaixados1Click(Sender: TObject);
  private
    procedure CalculaTotalPeso;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaClassificacaoCad: TFNotaClassificacaoCad;

implementation

uses UNotaClassificacao_cl, UCadastroCons, UCadastro_cl, UProdutoCons,
  UProduto_cl, UNotaSaidaCons, UNotaSaida_cl, UNotaClassificacaoCons,
  UOracle_cl, UConhecimento_CP, UContasPagar_cl, UUsuario_cl, UFilialCons,
  UFilial_cl, UPlanilha_cl, UNotaClassificacaoParam,
  URNotaClassificacaoAberto, URNotaClassificacaoPorFatura,
  UNotaCabClassificacaoCons, URNotaClassificacaoBaixado, UCaixaLanc_Cont,
  UParamSistema_cl, UBiblioteca;

{$R *.DFM}

procedure TFNotaClassificacaoCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.DataSet := DMNotaClassificacao.QNotaClassificacao; //evita de perder o dataset

  PageControl1.ActivePage := TabSheet1;
end;

procedure TFNotaClassificacaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMNotaClassificacao.QNotaClassificacao.Close;
  DMNotaClassificacao.QNotaClassificacao.Open;

  DMNotaClassificacao.QNotaClassificacaoItem.Close;
  DMNotaClassificacao.QNotaClassificacaoItem.Open;

  DMNotaClassificacao.QNotaClassificacaoItemGrid.Close;
  DMNotaClassificacao.QNotaClassificacaoItemGrid.Open;
end;

procedure TFNotaClassificacaoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsInsert, dsEdit] then
  begin
    SBNotaClassificacao.Enabled := true;
    SBProduto.Enabled           := true;
    SBDestino.Enabled           := true;
    SBFilial.Enabled            := true;
  end
  else
  begin
    SBNotaClassificacao.Enabled := false;
    SBProduto.Enabled           := false;
    SBDestino.Enabled           := false;
    SBFilial.Enabled            := false;
  end;
end;

procedure TFNotaClassificacaoCad.SBNotaClassificacaoClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);

  if FCadastroCons.showmodal = mrok then
    DMNotaClassificacao.QNotaClassificacaoCOD_CADASTRO.Value :=
      dmCadastro.QcadastroConsCod_cadastro.Value;
end;

procedure TFNotaClassificacaoCad.SBProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.create(application);

  if FProdutoCons.showmodal = mrok then
    DMNotaClassificacao.QNotaClassificacaoCOD_PRODUTO.Value :=
      DMProduto.QProdutoConsCOD_PRODUTO.AsInteger;
end;

procedure TFNotaClassificacaoCad.SBNotaCabClick(Sender: TObject);
begin
  inherited;
  if FNotaCabClassificacaoCons = nil then
    FNotaCabClassificacaoCons := TFNotaCabClassificacaoCons.create(application);

  if FNotaCabClassificacaoCons.showmodal = mrok then
    DMNotaClassificacao.QNotaClassificacaoItemCOD_NOTA_CAB.Value :=
      DMNotaClassificacao.QNotaCabClassificacaoConsCOD_NOTA_CAB.Value;
end;

procedure TFNotaClassificacaoCad.DSItensStateChange(Sender: TObject);
begin
  inherited;
  if DSItens.State in [dsInsert, dsEdit] then
    SBNotaCab.Enabled := true
  else
    SBNotaCab.Enabled := false;
end;

procedure TFNotaClassificacaoCad.SBDestinoClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.create(application);

  if FCadastroCons.showmodal = mrok then
    DMNotaClassificacao.QNotaClassificacaoCOD_CADASTRO_DESTINO.Value :=
      dmCadastro.QcadastroConsCod_cadastro.Value;
end;

procedure TFNotaClassificacaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FNotaClassificacaoCons = nil then
    FNotaClassificacaoCons := TFNotaClassificacaoCons.create(application);

  if FNotaClassificacaoCons.showmodal = mrok then
  Begin
    DMNotaClassificacao.QNotaClassificacao.Close;
    DMNotaClassificacao.QNotaClassificacao.SetVariable('PK',DMNotaClassificacao.QNotaClassificacaoConsCOD_NOTA_CLASSIFICACAO.Value);
    DMNotaClassificacao.QNotaClassificacao.open;
  End;
end;

procedure TFNotaClassificacaoCad.CalculaTotalPeso;
var wVal : string;
begin
  wVal := '0';

  if DMNotaClassificacao.QNotaClassificacaoCOD_NOTA_CLASSIFICACAO.Text <> '' then
  begin
    wVal := '0' + DMOracle.BuscaNome(' SELECT SUM(NVL(TB_NOTA_ITEM.QT_QUANTIDADE,0)) ' +
                         ' FROM ' +
                         '   TB_NOTA_CLASSIFICACAO, ' +
                         '   TB_NOTA_CLASSIFICACAO_ITEM, ' +
                         '   TB_NOTA_CAB, ' +
                         '   TB_NOTA_ITEM ',
                         ' TB_NOTA_CLASSIFICACAO.COD_NOTA_CLASSIFICACAO = TB_NOTA_CLASSIFICACAO_ITEM.COD_NOTA_CLASSIFICACAO (+) ' +
                         ' AND ' +
                         ' TB_NOTA_CLASSIFICACAO_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB (+) ' +
                         ' AND ' +
                         ' TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB (+) ' +
                         ' AND ' +
                         ' TB_NOTA_CLASSIFICACAO.COD_NOTA_CLASSIFICACAO = ' + DMNotaClassificacao.QNotaClassificacaoCOD_NOTA_CLASSIFICACAO.Text);

    LBTotalPeso.Caption := FormatFloat('#,##0',StrToFloat(wVal) + DMNotaClassificacao.QNotaClassificacaoQT_DIFERENCA.Value);
  end
  else
    LBTotalPeso.Caption := '0';

  LBTotalValor.Caption := FormatFloat('#,##0.00', (strtofloat(wVal) + DMNotaClassificacao.QNotaClassificacaoQT_DIFERENCA.Value)/1000 *
    DMNotaClassificacao.QNotaClassificacaoVAL_UNITARIO.Value + DMNotaClassificacao.QNotaClassificacaoVAL_DIFERENCA.Value);
end;

procedure TFNotaClassificacaoCad.DSItensDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  CalculaTotalPeso;
end;

procedure TFNotaClassificacaoCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  CalculaTotalPeso;
end;

procedure TFNotaClassificacaoCad.GerarContasPagar1Click(Sender: TObject);
var
  wVlrCP, wValUnitario : real;
  wQtQuantidade : integer;
  wVal : string;
  wCommitOnPost : boolean;
  wLabel1Visible, wMECodFinalidadeVisible, wSpeedButton1Visible, wMEFinalidadeVisible : boolean;
  wLabel4Caption : string;
  wLBDtVencimentoVisible, wMEDtVencimentoVisible : boolean;

  wNumDoc,wContaCred,wContaDeb:String;
  wCodDoc,wCodHistorico,wVlrLancto,wCodCompl:Real;
  wFilial : Integer;
  wDtLancto :TDateTime;
  wGerarContabilidade : boolean;
begin
  inherited;

  //---verifiva se tem alguma nota de classificacao aberta
  if DMNotaClassificacao.QNotaClassificacaoCOD_NOTA_CLASSIFICACAO.Text = '' then
    raise Exception.Create('Selecione uma nota para gerar o contas a pagar.');

  //---verifica se a nota de classificacao já tenha gerado o contas a pagar
  if not DMNotaClassificacao.QNotaClassificacaoCOD_CONTA_PAGAR.IsNull then
    raise Exception.Create('Essa nota de classificação já gerou contas a pagar.');

  //--------calcula o peso total das notas lançadas------------
  wVal := DMOracle.BuscaNome(' SELECT SUM(NVL(TB_NOTA_ITEM.QT_QUANTIDADE,0)) ' +
                         ' FROM ' +
                         '   TB_NOTA_CLASSIFICACAO, ' +
                         '   TB_NOTA_CLASSIFICACAO_ITEM, ' +
                         '   TB_NOTA_CAB, ' +
                         '   TB_NOTA_ITEM ',
                         ' TB_NOTA_CLASSIFICACAO.COD_NOTA_CLASSIFICACAO = TB_NOTA_CLASSIFICACAO_ITEM.COD_NOTA_CLASSIFICACAO (+) ' +
                         ' AND ' +
                         ' TB_NOTA_CLASSIFICACAO_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB (+) ' +
                         ' AND ' +
                         ' TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB (+) ' +
                         ' AND ' +
                         ' TB_NOTA_CLASSIFICACAO.COD_NOTA_CLASSIFICACAO = ' + DMNotaClassificacao.QNotaClassificacaoCOD_NOTA_CLASSIFICACAO.Text);

  if wVal = '' then
    raise Exception.Create('Peso igual a zero');
  if StrToInt(wVal) <= 0 then
    raise Exception.Create('Peso igual a zero');
  //-----------------------------------------------------------

  wQtQuantidade := StrToInt(wVal) + DMNotaClassificacao.QNotaClassificacaoQT_DIFERENCA.Value;
  wValUnitario  := DMNotaClassificacao.QNotaClassificacaoVAL_UNITARIO.Value;

  if wQtQuantidade <= 0 then
    raise Exception.Create('Diferença muito grande');

  wVlrCP := (wQtQuantidade/1000 * wValUnitario) + DMNotaClassificacao.QNotaClassificacaoVAL_DIFERENCA.Value;

  if wVlrCP <= 0 then
    raise exception.create('Valor inválido para Contas a Pagar');

  wCommitOnPost := DMNotaClassificacao.QNotaClassificacao.CommitOnPost;  //guarda o estado do commitOnPost
  DMNotaClassificacao.QNotaClassificacao.CommitOnPost := false;          //deixa o commitOnPost como false, pois deverá ser commitado pela transação

  DMOracle.DBCemapa.StartTransaction;
  Try
    With DMNotaClassificacao Do           
    begin
      If FConhecimento_CP = Nil then
        FConhecimento_CP := TFConhecimento_CP.Create(Application);

      //-----------gurda o estado dos compoenentes da tela FConhecimento_CP que serão alterados----------
      wLabel1Visible          := FConhecimento_CP.Label1.Visible;
      wMECodFinalidadeVisible := FConhecimento_CP.MECodFinalidade.Visible;
      wSpeedButton1Visible    := FConhecimento_CP.SpeedButton1.Visible;
      wMEFinalidadeVisible    := FConhecimento_CP.MEFinalidade.Visible;
      wLabel4Caption          := FConhecimento_CP.LblPedagio.Caption;
      wLBDtVencimentoVisible  := FConhecimento_CP.LBDtVencimento.Visible;
      wMEDtVencimentoVisible  := FConhecimento_CP.MEDtVencimento.Visible;

      FConhecimento_CP.Label1.Visible          := false;
      FConhecimento_CP.MECodFinalidade.Visible := false;
      FConhecimento_CP.SpeedButton1.Visible    := false;
      FConhecimento_CP.MEFinalidade.Visible    := false;
      FConhecimento_CP.LblPedagio.Caption          := 'Finalidade';
      FConhecimento_CP.LBDtVencimento.Visible  := true;
      FConhecimento_CP.MEDtVencimento.Visible  := true;
      //------------------------------------------------------------------------

      If FConhecimento_CP.ShowModal = MrOk Then
      Begin
        With DMContasPagar do
        Begin
          QContasPagar_Mov.Close;
          QContasPagar_Cab.Close;
          QContasPagar_Cab.Open;
          QContasPagar_Mov.Open;
          QContasPagar_Cab.Insert;

          if Trim(FConhecimento_CP.MeCodFinalidadePedagio.Text) <> '' then
            QContasPagar_cabCod_Finalidade.Value := StrToInt(Trim(FConhecimento_CP.MeCodFinalidadePedagio.text))
          else
            raise Exception.Create('Deve ser informado a finalidade');

          if Trim(FConhecimento_CP.MECodBanco.Text) <> '' then
            QContasPagar_CabCOD_BANCO_AGENCIA.Value := StrToInt(Trim(FConhecimento_CP.MECodBanco.text));

          if Trim(FConhecimento_CP.MECodDepartamento.Text) <> '' then
            QContasPagar_CabCOD_Departamento.Value := StrToInt(Trim(FConhecimento_CP.MECodDepartamento.text))
          else
            raise Exception.Create('Deve ser informado o Departamento.');

          QContasPagar_CabCOD_CADASTRO.Value        := QNotaClassificacaoCOD_CADASTRO.Value;
          QContasPagar_CabCOD_FILIAL.Value          := QNotaClassificacaoCOD_FILIAL.Value;
          QContasPagar_CabDESC_TIPO_DOCUMENTO.Value := 'NCL'; //NOTA DE CLASSIFICACAO
          QContasPagar_CabDT_EMISSAO.Value          := QNotaClassificacaoDT_EMISSAO.Value;
          QContasPagar_CabDT_VENCIMENTO.Value       := StrToDate(FConhecimento_CP.MEDtVencimento.Text);
          QContasPagar_CabVAL_TITULO.Value          := wVlrCP;
          QContasPagar_CabNUM_TITULO.Value          := QNotaClassificacaoNUM_GUIA_RECOLHIMENTO.Value;
          QContasPagar_CabIND_ACEITE.Value          := 'NAO';
          QContasPagar_CabIND_SITUACAO.Value        := 'ABERTO';
          QContasPagar_Cab.Post;

          //----------JOGA O CODIGO DO CONTAS A PAGAR NA NOTA DE CLASSIFICACAO-----
          QNotaClassificacao.Edit;
          QNotaClassificacaoCOD_CONTA_PAGAR.Value := QContasPagar_CabCOD_CONTA_PAGAR_CAB.Value;
          QNotaClassificacao.Post;
          //---------------------------------------------------------------------

          //------------GERA A CONTABILIDADE------------------------
          wCodDoc    := QContasPagar_CabCOD_CONTA_PAGAR_CAB.Value;
          wNumDoc    := QContasPagar_CabNUM_TITULO.Text;
          wFilial    := QContasPagar_CabCOD_FILIAL.Value;
          wCodCompl  := QContasPagar_CabCOD_CADASTRO.Value;
          wVlrLancto := QContasPagar_CabVAL_TITULO.Value;
          wDtLancto  := QContasPagar_CabDT_EMISSAO.Value;

          wVal := DMOracle.BuscaNome('SELECT IND_CONTABILIDADE FROM TB_FINALIDADE','COD_FINALIDADE  = '+FloatToStr(QContasPagar_CabCOD_FINALIDADE.Value));
          if wVal = 'S' then  //usado para verificar se a finalidade possui contas para lancar na contabilidade
            wGerarContabilidade := true
          else
            wGerarContabilidade := false;

          if wGerarContabilidade then
          begin
            wVal := DMOracle.BuscaNome('SELECT COD_CONTABIL_INCLUSAO_CRED FROM TB_FINALIDADE','COD_FINALIDADE = ' + QContasPagar_CabCOD_FINALIDADE.Text);
            wContaCred := wVal;

            wVal := DMOracle.BuscaNome('SELECT COD_CONTABIL_INCLUSAO_DEB FROM TB_FINALIDADE','COD_FINALIDADE = ' + QContasPagar_CabCOD_FINALIDADE.Text);
            wContaDeb := wVal;

            wVal := DMOracle.BuscaNome('SELECT COD_HIST_CONTABIL_INCLUSAO FROM TB_FINALIDADE','COD_FINALIDADE = ' + QContasPagar_CabCOD_FINALIDADE.Text);
            if wVal <> '' then
              wCodHistorico := StrToInt(wVal);

            If FCaixa_Lanc_Cont = nil then
               FCaixa_Lanc_Cont := TFCaixa_Lanc_Cont.Create(Application);

            If DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'UNICO' Then
               FCaixa_Lanc_Cont.pFilial := 1
            Else
               FCaixa_Lanc_Cont.pFilial := wFilial;

            FCaixa_Lanc_Cont.MeContaCredito.text     := wContaCred;
            FCaixa_Lanc_Cont.MeContaDebito.text      := wContaDeb;
            FCaixa_Lanc_Cont.Label3.Visible          := False;
            FCaixa_Lanc_Cont.Label4.Visible          := False;
            FCaixa_Lanc_Cont.MeFilialDebito.Visible  := False;
            FCaixa_Lanc_Cont.MeFilialCredito.Visible := False;
            FCaixa_Lanc_Cont.MEContaDebitoExit(Self);
            FCaixa_Lanc_Cont.MEContaCreditoExit(Self);

            if FCaixa_Lanc_Cont.ShowModal = mrok then
            begin
              wContaCred := Bib.LimpaString(FCaixa_Lanc_Cont.MeContaCredito.Text,'.');
              wContaDeb  := Bib.LimpaString(FCaixa_Lanc_Cont.MeContaDebito.Text,'.');
            end
            else
              raise Exception.Create('Contas a pagar Cancelada.');

            DMContasPagar.QContasPagar_Mov.Edit;

            DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaDeb);
            DMContasPagar.QContasPagar_MovCOD_LANCTO_CONTABIL_CRED.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;

            DMPlanilha.GravaLanc('CP',wCodDoc,wNumDoc,wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDTLancto,wContaCred);
            DMContasPagar.QContasPagar_MovCOD_LANCTO_CONTABIL_DEB.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;

            DMContasPagar.QContasPagar_Mov.Post;
          end;
          //-------------------FIM GERA CONTABILIDADE-----------------

          QContasPagar_Mov.Close;
          QContasPagar_Cab.Close;
        End;
        DMOracle.DBCemapa.Commit;
        MessageDlg('Contas a Pagar gerado com sucesso.',mtInformation, [mbok], 0);
      End
      else
        DMOracle.DBCemapa.Rollback; //se nao deu ok na tela

      //---------volta o estado dos componentes alterados---------------------
      FConhecimento_CP.Label1.Visible          := wLabel1Visible;
      FConhecimento_CP.MECodFinalidade.Visible := wMECodFinalidadeVisible;
      FConhecimento_CP.SpeedButton1.Visible    := wSpeedButton1Visible;
      FConhecimento_CP.MEFinalidade.Visible    := wMEFinalidadeVisible;
      FConhecimento_CP.LblPedagio.Caption      := wLabel4Caption;
      FConhecimento_CP.LBDtVencimento.Visible  := wLBDtVencimentoVisible;
      FConhecimento_CP.MEDtVencimento.Visible  := wMEDtVencimentoVisible;
      //----------------------------------------------------------------------
    End;
  Except
    DMNotaClassificacao.QNotaClassificacao.Cancel;
    DMContasPagar.QContasPagar_Cab.Cancel;
    DMContasPagar.QContasPagar_Mov.Cancel;
    DMOracle.DBCemapa.Rollback;
    DMNotaClassificacao.QNotaClassificacao.CommitOnPost := wCommitOnPost; //volta o estado do commitOnPost

    //---------volta o estado dos componentes alterados---------------------
    FConhecimento_CP.Label1.Visible          := wLabel1Visible;
    FConhecimento_CP.MECodFinalidade.Visible := wMECodFinalidadeVisible;
    FConhecimento_CP.SpeedButton1.Visible    := wSpeedButton1Visible;
    FConhecimento_CP.MEFinalidade.Visible    := wMEFinalidadeVisible;
    FConhecimento_CP.LblPedagio.Caption      := wLabel4Caption;
    FConhecimento_CP.LBDtVencimento.Visible  := wLBDtVencimentoVisible;
    FConhecimento_CP.MEDtVencimento.Visible  := wMEDtVencimentoVisible;
    //----------------------------------------------------------------------
    Raise ; // Exception.Create('Não foi possível gerar contas a pagar!');
  End;
  DMNotaClassificacao.QNotaClassificacao.CommitOnPost := wCommitOnPost; //volta o estado do commitOnPost
end;

procedure TFNotaClassificacaoCad.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
    DMNotaClassificacao.QNotaClassificacaoCOD_FILIAL.Value :=
      DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFNotaClassificacaoCad.VoltaContasPagar1Click(Sender: TObject);
var wCommitOnPost : boolean;
begin
  inherited;

  if DMNotaClassificacao.QNotaClassificacaoCOD_NOTA_CLASSIFICACAO.IsNull then
    raise Exception.Create('Não tem Nenhuma nota de Classificação selecionada');

  if DMNotaClassificacao.QNotaClassificacaoCOD_CONTA_PAGAR.IsNull then
    raise Exception.Create('Essa Nota de Classificação ainda não gerou o contas a pagar.');

  DMContasPagar.QContasPagar_Cab.close;
  DMContasPagar.QContasPagar_Cab.SetVariable('PK', DMNotaClassificacao.QNotaClassificacaoCOD_CONTA_PAGAR.Value);
  DMContasPagar.QContasPagar_Cab.open;

  //verificar se o contas a pagar está diferente de aberto
  If DMContasPagar.QContasPagar_CabInd_Situacao.Value <> 'ABERTO' then
    Raise Exception.Create('Não é Possível Excluir um Título Com Baixas');

  wCommitOnPost := DMNotaClassificacao.QNotaClassificacao.CommitOnPost; //guarda o estado do commitOnPost
  DMNotaClassificacao.QNotaClassificacao.CommitOnPost := false;         //deixa o commitOnPost em falso, pois o commit será dado pela transação.

  DMOracle.DBCemapa.StartTransaction;
  try
    DMNotaClassificacao.QNotaClassificacao.Edit;
    DMNotaClassificacao.QNotaClassificacaoCOD_CONTA_PAGAR.Clear;
    DMNotaClassificacao.QNotaClassificacao.Post;

    DMContasPagar.ExcluiMovimentos(DMContasPagar.QContasPagar_CabCOD_CONTA_PAGAR_CAB.Value);
    DMContasPagar.QContasPagar_Cab.delete;

    DMOracle.DBCemapa.Commit;
    DMNotaClassificacao.QNotaClassificacao.CommitOnPost := wCommitOnPost;//volta o estado do commitOnPost

    MessageDlg('Contas a Pagar voltado com sucesso.', mtInformation, [mbok], 0);
  except
    DMOracle.DBCemapa.Rollback;
    raise Exception.Create('Não foi possível fazer a volta');
    DMNotaClassificacao.QNotaClassificacao.CommitOnPost := wCommitOnPost;//volta o estado do commitOnPost
  end;
end;

procedure TFNotaClassificacaoCad.NotasdeProdutosClassificadasemamberto1Click(
  Sender: TObject);
begin
  inherited;
  if FNotaClassificacaoParam = nil then
    FNotaClassificacaoParam := TFNotaClassificacaoParam.create(application);

  FNotaClassificacaoParam.PGRelatorio.Pages[0].TabVisible := True;
  if FNotaClassificacaoParam.showmodal = mrok then
  begin
    DMNotaClassificacao.QRNotaClassificacaoAberto.close;

    if Trim(FNotaClassificacaoParam.ME0DtInicio.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoAberto.SetVariable('DT_EMISSAO_INI',StrToDate(Trim(FNotaClassificacaoParam.ME0DtInicio.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoAberto.SetVariable('DT_EMISSAO_INI',null);

    if Trim(FNotaClassificacaoParam.ME0DtFim.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoAberto.SetVariable('DT_EMISSAO_FIM',StrToDate(Trim(FNotaClassificacaoParam.ME0DtFim.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoAberto.SetVariable('DT_EMISSAO_FIM',null);

    if Trim(FNotaClassificacaoParam.ME0Produto.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoAberto.SetVariable('COD_PRODUTO',StrToInt(Trim(FNotaClassificacaoParam.ME0Produto.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoAberto.SetVariable('COD_PRODUTO',null);

    if Trim(FNotaClassificacaoParam.ME0Cadastro.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoAberto.SetVariable('COD_CADASTRO',StrToInt(Trim(FNotaClassificacaoParam.ME0Cadastro.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoAberto.SetVariable('COD_CADASTRO',null);

    if Trim(FNotaClassificacaoParam.ME0CadastroClassificacao.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoAberto.SetVariable('COD_CADASTRO_CLASSIFICACAO',StrToInt(Trim(FNotaClassificacaoParam.ME0CadastroClassificacao.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoAberto.SetVariable('COD_CADASTRO_CLASSIFICACAO',null);

    if Trim(FNotaClassificacaoParam.ME0Filial.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoAberto.SetVariable('COD_FILIAL',StrToInt(Trim(FNotaClassificacaoParam.ME0Filial.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoAberto.SetVariable('COD_FILIAL',null);

    DMNotaClassificacao.QRNotaClassificacaoAberto.open;

    if FRNotaClassificacaoAberto = nil then
      FRNotaClassificacaoAberto := TFRNotaClassificacaoAberto.create(application);

    if FNotaClassificacaoParam.RGPreview.ItemIndex = 0 then
      FRNotaClassificacaoAberto.QRPrimario.Preview
    else
      FRNotaClassificacaoAberto.QRPrimario.print;
  end;
end;

procedure TFNotaClassificacaoCad.NotasdeProdutosClassificadosPorfatura1Click(
  Sender: TObject);
begin
  inherited;
  if FNotaClassificacaoParam = nil then
    FNotaClassificacaoParam := TFNotaClassificacaoParam.create(application);

  FNotaClassificacaoParam.PGRelatorio.Pages[1].TabVisible := True;
  if FNotaClassificacaoParam.showmodal = mrok then
  begin
    DMNotaClassificacao.QRNotaClassificacaoPorFatura.close;

    if Trim(FNotaClassificacaoParam.ME1DtInicio.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoPorFatura.SetVariable('DT_EMISSAO_INI',StrToDate(Trim(FNotaClassificacaoParam.ME1DtInicio.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoPorFatura.SetVariable('DT_EMISSAO_INI',null);

    if Trim(FNotaClassificacaoParam.ME1DtFim.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoPorFatura.SetVariable('DT_EMISSAO_FIM',StrToDate(Trim(FNotaClassificacaoParam.ME1DtFim.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoPorFatura.SetVariable('DT_EMISSAO_FIM',null);

    if Trim(FNotaClassificacaoParam.ME1Produto.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoPorFatura.SetVariable('COD_PRODUTO',StrToInt(Trim(FNotaClassificacaoParam.ME1Produto.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoPorFatura.SetVariable('COD_PRODUTO',null);

    if Trim(FNotaClassificacaoParam.ME1Cadastro.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoPorFatura.SetVariable('COD_CADASTRO_DESTINO',StrToInt(Trim(FNotaClassificacaoParam.ME1Cadastro.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoPorFatura.SetVariable('COD_CADASTRO_DESTINO',null);

    if Trim(FNotaClassificacaoParam.ME1CadastroClassificacao.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoPorFatura.SetVariable('COD_CADASTRO_CLASSIFICACAO',StrToInt(Trim(FNotaClassificacaoParam.ME1CadastroClassificacao.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoPorFatura.SetVariable('COD_CADASTRO_CLASSIFICACAO',null);

    if Trim(FNotaClassificacaoParam.ME1Filial.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoPorFatura.SetVariable('COD_FILIAL',StrToInt(Trim(FNotaClassificacaoParam.ME1Filial.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoPorFatura.SetVariable('COD_FILIAL',null);

    DMNotaClassificacao.QRNotaClassificacaoPorFatura.open;

    if FRNotaClassificacaoPorFatura = nil then
      FRNotaClassificacaoPorFatura := TFRNotaClassificacaoPorFatura.create(application);

    if FNotaClassificacaoParam.RGPreview.ItemIndex = 0 then
      FRNotaClassificacaoPorFatura.QRPrimario.Preview
    else
      FRNotaClassificacaoPorFatura.QRPrimario.print;
  end;
end;

procedure TFNotaClassificacaoCad.NotasdeProdutosClassificadosBaixados1Click(
  Sender: TObject);
begin
  inherited;
  if FNotaClassificacaoParam = nil then
    FNotaClassificacaoParam := TFNotaClassificacaoParam.create(application);

  FNotaClassificacaoParam.PGRelatorio.Pages[2].TabVisible := True;
  if FNotaClassificacaoParam.showmodal = mrok then
  begin
    DMNotaClassificacao.QRNotaClassificacaoBaixado.close;

    if Trim(FNotaClassificacaoParam.ME2DtInicio.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoBaixado.SetVariable('DT_EMISSAO_INI',StrToDate(Trim(FNotaClassificacaoParam.ME2DtInicio.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoBaixado.SetVariable('DT_EMISSAO_INI',null);

    if Trim(FNotaClassificacaoParam.ME2DtFim.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoBaixado.SetVariable('DT_EMISSAO_FIM',StrToDate(Trim(FNotaClassificacaoParam.ME2DtFim.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoBaixado.SetVariable('DT_EMISSAO_FIM',null);

    if Trim(FNotaClassificacaoParam.ME2Produto.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoBaixado.SetVariable('COD_PRODUTO',StrToInt(Trim(FNotaClassificacaoParam.ME2Produto.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoBaixado.SetVariable('COD_PRODUTO',null);

    if Trim(FNotaClassificacaoParam.ME2Cadastro.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoBaixado.SetVariable('COD_CADASTRO_DESTINO',StrToInt(Trim(FNotaClassificacaoParam.ME2Cadastro.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoBaixado.SetVariable('COD_CADASTRO_DESTINO',null);

    if Trim(FNotaClassificacaoParam.ME2CadastroClassificacao.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoBaixado.SetVariable('COD_CADASTRO_CLASSIFICACAO',StrToInt(Trim(FNotaClassificacaoParam.ME2CadastroClassificacao.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoBaixado.SetVariable('COD_CADASTRO_CLASSIFICACAO',null);

    if Trim(FNotaClassificacaoParam.ME2Filial.Text) <> '' then
      DMNotaClassificacao.QRNotaClassificacaoBaixado.SetVariable('COD_FILIAL',StrToInt(Trim(FNotaClassificacaoParam.ME2Filial.Text)))
    else
      DMNotaClassificacao.QRNotaClassificacaoBaixado.SetVariable('COD_FILIAL',null);

    DMNotaClassificacao.QRNotaClassificacaoBaixado.open;

    if FRNotaClassificacaoBaixado = nil then
      FRNotaClassificacaoBaixado := TFRNotaClassificacaoBaixado.create(application);

    if FNotaClassificacaoParam.RGPreview.ItemIndex = 0 then
      FRNotaClassificacaoBaixado.QRPrimario.Preview
    else
      FRNotaClassificacaoBaixado.QRPrimario.print;
  end;
end;

end.
