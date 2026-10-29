unit UPatrimonioCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, DBDirceu, variants, ActnList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFPatrimonioCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    SBConsultaitens: TSpeedButton;
    RelaodePatrimnio1: TMenuItem;
    RelatriodeItensdePatrimnio1: TMenuItem;
    DSPatrimonioItem: TDataSource;
    DBGrid1: TDBGrid;
    Opes1: TMenuItem;
    GerarDepreciao1: TMenuItem;
    GerarCIAP1: TMenuItem;
    VoltaGerarDepreciao1: TMenuItem;
    VoltaGerarCIAP1: TMenuItem;
    DSIncorporacao: TDataSource;
    DSCIAPPatrimonio: TDataSource;
    DSDepreciacao: TDataSource;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    BtnFilialCons: TSpeedButton;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    BtnUsuario: TSpeedButton;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    BtnProduto: TSpeedButton;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    BtnMoeda: TSpeedButton;
    Label18: TLabel;
    DBEdit22: TDBEdit;
    btnLocalizacaoCons: TSpeedButton;
    Label11: TLabel;
    DBEVlrAquisicao: TDBEdit;
    Label26: TLabel;
    DBEVlrICMS: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label20: TLabel;
    DBEdit24: TDBEdit;
    btnNotaEntradaCons: TSpeedButton;
    Label10: TLabel;
    DBEPorcentagem: TDBEdit;
    DBEdit34: TDBEdit;
    Label31: TLabel;
    DBEdit35: TDBEdit;
    Label32: TLabel;
    DBEdit25: TDBEdit;
    btnNotaSaidaCons: TSpeedButton;
    Label21: TLabel;
    DBEdit15: TDBEdit;
    Label15: TLabel;
    DBEDtAquisicao: TDBEdit;
    Label13: TLabel;
    DBEVlrAtual: TDBEdit;
    Label12: TLabel;
    Label33: TLabel;
    DBEdit36: TDBEdit;
    Label17: TLabel;
    DBEDtInicioUso: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label25: TLabel;
    DBEdit29: TDBEdit;
    Label19: TLabel;
    DBMemo1: TDBMemo;
    Label30: TLabel;
    DBMemo2: TDBMemo;
    GroupBox1: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label23: TLabel;
    DBEdit27: TDBEdit;
    Label24: TLabel;
    DBEdit28: TDBEdit;
    Label35: TLabel;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    Label39: TLabel;
    Label42: TLabel;
    DBEdit43: TDBEdit;
    btnCreditoCIAP: TSpeedButton;
    DBDirceu2: TDBDirceu;
    DBEdit44: TDBEdit;
    Label43: TLabel;
    btnDebitoCIAP: TSpeedButton;
    DBDirceu5: TDBDirceu;
    Label44: TLabel;
    DBEdit45: TDBEdit;
    btnCreditoDiferencaCIAP: TSpeedButton;
    DBDirceu3: TDBDirceu;
    DBEdit46: TDBEdit;
    Label45: TLabel;
    DBDirceu6: TDBDirceu;
    Label46: TLabel;
    DBEdit47: TDBEdit;
    btnHistoricoContabil: TSpeedButton;
    DBDirceu7: TDBDirceu;
    btnDebitoDiferencaCIAP: TSpeedButton;
    DBNavigator2: TDBNavigator;
    Label34: TLabel;
    DBEdit37: TDBEdit;
    DBEdit39: TDBEdit;
    Label36: TLabel;
    Label37: TLabel;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    Label38: TLabel;
    btn5NumNota: TSpeedButton;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Label4: TLabel;
    Label22: TLabel;
    DBEdit4: TDBEdit;
    DBEdit26: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBDirceu8: TDBDirceu;
    DBDirceu9: TDBDirceu;
    DBDirceu10: TDBDirceu;
    DBDirceu11: TDBDirceu;
    DBDirceu12: TDBDirceu;
    N2: TMenuItem;
    BaixadoPatrimnio1: TMenuItem;
    FichadoCIAP1: TMenuItem;
    DBEdit17: TDBEdit;
    DBMemo3: TDBMemo;
    Label51: TLabel;
    DBEdit18: TDBEdit;
    Label52: TLabel;
    Label53: TLabel;
    N3: TMenuItem;
    Contbil1: TMenuItem;
    ControledeCrditodeICMSdoAtivoPermanente1: TMenuItem;
    ConferenciaICMSPerdidoEstornado1: TMenuItem;
    ConfirmarCadastro1: TMenuItem;
    VoltaCadastro1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    TransferirPatrimnio1: TMenuItem;
    VoltarTransferncia1: TMenuItem;
    MapadeClculoeMemriaAcumuladadeDepdoAtivoImobilizadoResumo1: TMenuItem;
    MapadeClceMemAcumdeDepdoAtivoImobBem1: TMenuItem;
    Label56: TLabel;
    DBEdit21: TDBEdit;
    btnContaContabil: TSpeedButton;
    DBDirceu19: TDBDirceu;
    DBEdit23: TDBEdit;
    Label57: TLabel;
    TabSheet3: TTabSheet;
    DBEdit20: TDBEdit;
    Label55: TLabel;
    btnDebitoICMS: TSpeedButton;
    DBDirceu18: TDBDirceu;
    DBEdit19: TDBEdit;
    btnCreditoICMS: TSpeedButton;
    DBDirceu17: TDBDirceu;
    Label54: TLabel;
    DBEdit13: TDBEdit;
    btnDebitoEstornoDepreciacao: TSpeedButton;
    DBDirceu16: TDBDirceu;
    DBEdit12: TDBEdit;
    btnCreditoEstornoDepreciacao: TSpeedButton;
    DBDirceu15: TDBDirceu;
    Label49: TLabel;
    Label50: TLabel;
    Label48: TLabel;
    DBEdit11: TDBEdit;
    btnDebitoBaixa: TSpeedButton;
    DBDirceu14: TDBDirceu;
    DBEdit10: TDBEdit;
    btnCreditoBaixa: TSpeedButton;
    DBDirceu13: TDBDirceu;
    Label47: TLabel;
    Label41: TLabel;
    DBEdit42: TDBEdit;
    btnDebitoDepreciacao: TSpeedButton;
    DBDirceu4: TDBDirceu;
    Label40: TLabel;
    DBEdit38: TDBEdit;
    btnCreditoDepreciacao: TSpeedButton;
    DBDirceu1: TDBDirceu;
    Label58: TLabel;
    DBEdit30: TDBEdit;
    btnHistoricoDepreciacao: TSpeedButton;
    DBDirceu20: TDBDirceu;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBDirceu21: TDBDirceu;
    btnHistoricoCIAP: TSpeedButton;
    Bevel3: TBevel;
    Label59: TLabel;
    DBEdit48: TDBEdit;
    btnHistoricoDifCIAP: TSpeedButton;
    DBDirceu22: TDBDirceu;
    Label60: TLabel;
    DBEdit49: TDBEdit;
    btnHistoricoBaixa: TSpeedButton;
    DBDirceu23: TDBDirceu;
    Label61: TLabel;
    DBEdit50: TDBEdit;
    Bevel4: TBevel;
    Label62: TLabel;
    DBEdit51: TDBEdit;
    btnHistoricoBaixaDep: TSpeedButton;
    DBDirceu24: TDBDirceu;
    Bevel5: TBevel;
    Label63: TLabel;
    DBEdit52: TDBEdit;
    btnHistoricoICMS: TSpeedButton;
    DBDirceu25: TDBDirceu;
    N6: TMenuItem;
    ImportarContasdoGrupo1: TMenuItem;
    DBGrid5: TDBGrid;
    Bevel6: TBevel;
    DSBaixa: TDataSource;
    SBVoltarBaixa: TBitBtn;
    Label64: TLabel;
    RelatrioPatrimnioNoConfirmado1: TMenuItem;
    TabSheet4: TTabSheet;
    DSPatrimonioConserto: TDataSource;
    Label65: TLabel;
    DBEdit53: TDBEdit;
    Label66: TLabel;
    DBEdit54: TDBEdit;
    Label67: TLabel;
    DBEdit55: TDBEdit;
    Label68: TLabel;
    Label69: TLabel;
    DBEdit57: TDBEdit;
    Label70: TLabel;
    DBEdit58: TDBEdit;
    SbBuscaCadastroConserto: TSpeedButton;
    DBDirceu26: TDBDirceu;
    DBMemo4: TDBMemo;
    DBGrid6: TDBGrid;
    DBNavigator3: TDBNavigator;
    TabSheet6: TTabSheet;
    DBLCPisIncorporacao: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    procedure BtnFilialConsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnProdutoClick(Sender: TObject);
    procedure BtnMoedaClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DSPatrimonioItemStateChange(Sender: TObject);
    procedure SBConsultaitensClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure RelaodePatrimnio1Click(Sender: TObject);
    procedure RelatriodeItensdePatrimnio1Click(Sender: TObject);
    procedure btnLocalizacaoConsClick(Sender: TObject);
    procedure btnNotaEntradaConsClick(Sender: TObject);
    procedure btnNotaSaidaConsClick(Sender: TObject);
    procedure BtnUsuarioClick(Sender: TObject);
    procedure GerarDepreciao1Click(Sender: TObject);
    procedure GerarCIAP1Click(Sender: TObject);
    procedure VoltaGerarDepreciao1Click(Sender: TObject);
    procedure VoltaGerarCIAP1Click(Sender: TObject);
    procedure DSIncorporacaoStateChange(Sender: TObject);
    procedure btnCreditoDepreciacaoClick(Sender: TObject);
    procedure btnCreditoCIAPClick(Sender: TObject);
    procedure btnCreditoDiferencaCIAPClick(Sender: TObject);
    procedure btnDebitoDepreciacaoClick(Sender: TObject);
    procedure btnDebitoCIAPClick(Sender: TObject);
    procedure btnDebitoDiferencaCIAPClick(Sender: TObject);
    procedure btnHistoricoContabilClick(Sender: TObject);
    procedure BaixadoPatrimnio1Click(Sender: TObject);
    procedure btnCreditoBaixaClick(Sender: TObject);
    procedure btnCreditoEstornoDepreciacaoClick(Sender: TObject);
    procedure btnDebitoBaixaClick(Sender: TObject);
    procedure btnDebitoEstornoDepreciacaoClick(Sender: TObject);
    procedure TabSheet9Show(Sender: TObject);
    procedure FichadoCIAP1Click(Sender: TObject);
    procedure ControledeCrditodeICMSdoAtivoPermanente1Click(
      Sender: TObject);
    procedure ConferenciaICMSPerdidoEstornado1Click(Sender: TObject);
    procedure Contbil1Click(Sender: TObject);
    procedure ConfirmarCadastro1Click(Sender: TObject);
    procedure VoltaCadastro1Click(Sender: TObject);
    procedure MapadeClculoeMemriaAcumuladadeDepdoAtivoImobilizadoResumo1Click(
      Sender: TObject);
    procedure btnCreditoICMSClick(Sender: TObject);
    procedure btnDebitoICMSClick(Sender: TObject);
    procedure MapadeClceMemAcumdeDepdoAtivoImobBem1Click(Sender: TObject);
    procedure btnContaContabilClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TransferirPatrimnio1Click(Sender: TObject);
    procedure VoltarTransferncia1Click(Sender: TObject);
    procedure btnHistoricoDepreciacaoClick(Sender: TObject);
    procedure btnHistoricoCIAPClick(Sender: TObject);
    procedure btnHistoricoBaixaClick(Sender: TObject);
    procedure btnHistoricoBaixaDepClick(Sender: TObject);
    procedure btnHistoricoICMSClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure BtCopiaClick(Sender: TObject);
    procedure ImportarContasdoGrupo1Click(Sender: TObject);
    procedure btnHistoricoDifCIAPClick(Sender: TObject);
    procedure btn5NumNotaClick(Sender: TObject);
    procedure SBVoltarBaixaClick(Sender: TObject);
    procedure RelatrioPatrimnioNoConfirmado1Click(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure SbBuscaCadastroConsertoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPatrimonioCad: TFPatrimonioCad;

implementation

uses UPatrimonio_cl, UFilial_cl, UFilialCons, UProdutoCons, UProduto_cl,
  UMoedaCons, UMoeda_cl, UPatrimonioCons, UPatrimonioItensCons,
  URRelacaoPatrimonio, UPatrimonioParam, URPatrimonioItens, UOracle_cl,
  UUsuario_cl, ULocalizacaoCons, ULocalizacao_cl, UNotaEntradaCons,
  UNotaEntrada_cl, UNotaSaidaCons, UNotaSaida_cl, UUsuarioCons,
  UDepreciacao_cl, UGerarParam, UCIAP_cl, UIncorporacao_cl,
  UParamSistema_cl, UPlanoContaCons, UPlanoConta_cl, UHistoricoCons,
  UHistorico_cl, UHistContabilCons, UHistContabil_cl, URFichaCIAP,
  URControle, URConferencia, URContabil, URDepMapaCalculo,
  URDepMapaCalculoBem, UGrupoConta_cl, URPatrimonioNaoConfirmado,
  UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFPatrimonioCad.BtnFilialConsClick(Sender: TObject);
begin
  inherited;
  If (FFilialCons = nil) Then
    FFilialCons := TFFilialCons.Create(Application);
  If (FFilialCons.ShowModal = mrOk) Then
    DMPatrimonio.QPatrimonioItemCOD_FILIAL.Value := DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFPatrimonioCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If DSPatrimonioItem.State in [dsEdit,dsInsert] Then
    DMPatrimonio.QPatrimonio.Edit;
  inherited;
  DMPatrimonio.QPatrimonio.Close;
  DMPatrimonio.QPatrimonioCons.Close;
  DMPatrimonio.QPatrimonioItem.Close;
  DMMoeda.QMoedaCons.Close;
  DMFilial.QFilialCons.Close;
  DMProduto.QProdutoCons.Close;
  Action := CaFree;
  FPatrimonioCad := nil;
end;

procedure TFPatrimonioCad.BtnProdutoClick(Sender: TObject);
begin
  inherited;
  If (FProdutoCons = nil) Then
    FProdutoCons := TFProdutoCons.Create(Application);
  If (FProdutoCons.ShowModal = mrOk) Then
    DMPatrimonio.QPatrimonioItemCOD_PRODUTO.Value := DMProduto.QProdutoConsCOD_PRODUTO.Value;
end;

procedure TFPatrimonioCad.BtnMoedaClick(Sender: TObject);
begin
  inherited;
  If (FMoedaCons = nil) Then
    FMoedaCons := TFMoedaCons.Create(Application);
  If (FMoedaCons.ShowModal = mrOk) Then
    DMPatrimonio.QPatrimonioItemCOD_MOEDA.Value := DMMoeda.QMoedaConsCOD_MOEDA.Value;
end;

procedure TFPatrimonioCad.PageControl1Change(Sender: TObject);
begin
  inherited;
  With DMPatrimonio do
  Begin
    If PageControl1.ActivePage = TabSheet2 Then
    Begin
      If DSPrimario.State in [dsInsert,dsEdit] Then
      Begin
        QPatrimonio.Post;
        QPatrimonio.Edit;
        QPatrimonio.close;
        QPatrimonio.open;
      end
      else
      begin
        QPatrimonioItem.Close;
        QPatrimonioItem.Open;
      end;
    End;
  End;
end;

procedure TFPatrimonioCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPatrimonioCons = nil Then
    FPatrimonioCons := TFPatrimonioCons.Create(Application);
  If FPatrimonioCons.ShowModal = mrOk Then
  Begin
    DMPatrimonio.QPatrimonio.Close;
    DMPatrimonio.QPatrimonio.SetVariable( ':PK', DMPatrimonio.QPatrimonioConsCOD_PATRIMONIO_CAB.Value );
    DMPatrimonio.QPatrimonio.Open;
  End;
  PageControl1Change(Self);
end;

procedure TFPatrimonioCad.DSPatrimonioItemStateChange(Sender: TObject);
begin
  inherited;
  If PageControl1.ActivePage = TabSheet2 Then
  Begin
    // Aba sped
    DBLCPisIncorporacao.Enabled := not (DSPatrimonioItem.State = DSBrowse);
    DBLookupComboBox1.Enabled := not (DSPatrimonioItem.State = DSBrowse);
    DBLookupComboBox2.Enabled := not (DSPatrimonioItem.State = DSBrowse);
    DBLookupComboBox3.Enabled := not (DSPatrimonioItem.State = DSBrowse);
    DBLookupComboBox4.Enabled := not (DSPatrimonioItem.State = DSBrowse);
    DBLookupComboBox5.Enabled := not (DSPatrimonioItem.State = DSBrowse);
    DBLookupComboBox6.Enabled := not (DSPatrimonioItem.State = DSBrowse);

    If (DSPatrimonioItem.State in [dsInsert,dsEdit]) Then
    Begin
      BtnFilialCons.Enabled    := True;
      BtnUsuario.Enabled       := True;
      BtnProduto.Enabled       := True;
      BtnMoeda.Enabled         := True;
      btnLocalizacaoCons.Enabled := True;
      btnNotaEntradaCons.Enabled := True;
      btnNotaSaidaCons.Enabled   := True;

      btnCreditoDepreciacao.Enabled        := True;
      btnDebitoDepreciacao.Enabled         := True;
      btnCreditoCIAP.Enabled               := True;
      btnDebitoCIAP.Enabled                := True;
      btnCreditoDiferencaCIAP.Enabled      := True;
      btnDebitoDiferencaCIAP.Enabled       := True;
      btnCreditoBaixa.Enabled              := True;
      btnDebitoBaixa.Enabled               := True;
      btnCreditoEstornoDepreciacao.Enabled := True;
      btnDebitoEstornoDepreciacao.Enabled  := True;
      btnCreditoICMS.Enabled               := True;
      btnDebitoICMS.Enabled                := True;
      btnContaContabil.Enabled             := True;
      btnHistoricoContabil.Enabled         := True;

      btnHistoricoDepreciacao.Enabled      := True;
      btnHistoricoCIAP.Enabled             := True;
      btnHistoricoDifCIAP.Enabled          := True;
      btnHistoricoBaixa.Enabled            := True;
      btnHistoricoBaixaDep.Enabled         := True;
      btnHistoricoICMS.Enabled             := True;
    End
    Else
    Begin
      btnFilialCons.Enabled    := False;
      btnUsuario.Enabled       := False;
      btnProduto.Enabled       := False;
      btnMoeda.Enabled         := False;
      btnLocalizacaoCons.Enabled := False;
      btnNotaEntradaCons.Enabled := False;
      btnNotaSaidaCons.Enabled   := False;

      btnCreditoDepreciacao.Enabled        := False;
      btnDebitoDepreciacao.Enabled         := False;
      btnCreditoCIAP.Enabled               := False;
      btnDebitoCIAP.Enabled                := False;
      btnCreditoDiferencaCIAP.Enabled      := False;
      btnDebitoDiferencaCIAP.Enabled       := False;
      btnCreditoBaixa.Enabled              := False;
      btnDebitoBaixa.Enabled               := False;
      btnCreditoEstornoDepreciacao.Enabled := False;
      btnDebitoEstornoDepreciacao.Enabled  := False;
      btnCreditoICMS.Enabled               := False;
      btnDebitoICMS.Enabled                := False;
      btnContaContabil.Enabled             := False;
      btnHistoricoContabil.Enabled         := False;

      btnHistoricoDepreciacao.Enabled      := False;
      btnHistoricoCIAP.Enabled             := False;
      btnHistoricoDifCIAP.Enabled          := False;
      btnHistoricoBaixa.Enabled            := False;
      btnHistoricoBaixaDep.Enabled         := False;
      btnHistoricoICMS.Enabled             := False;
    End;

    //NAO DEIXA ALTERAR OS CAMPOS ABAIXO
    {pois ao mudar essas informações poderão ocorrer erros
    nos calculos de depreciacao e CIAP}
    DBEVlrAquisicao.ReadOnly := false;
    DBEVlrAtual.ReadOnly     := false;
    DBEVlrICMS.ReadOnly      := false;
    DBEDtAquisicao.ReadOnly  := false;
    DBEDtInicioUso.ReadOnly  := false;
    DBEPorcentagem.ReadOnly  := false;

    if DMPatrimonio.QPatrimonioItemIND_CONFIRMADO.Value = 'SIM' then
    begin
      DBEVlrAquisicao.ReadOnly := true;
      DBEVlrAtual.ReadOnly     := true;
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GRASEL' then
        DBEVlrICMS.ReadOnly      := true;
      DBEDtAquisicao.ReadOnly  := true;
      DBEDtInicioUso.ReadOnly  := true;
      DBEPorcentagem.ReadOnly  := true;
    End;

    //TIRAR ESSA LINHA APÓS SEREM INFORMADOS OS DADOS CORRETAMENTE, LIBERADO APENAS PARA A AB
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AB' then
    begin
      DBEDtAquisicao.ReadOnly  := false;
      DBEDtInicioUso.ReadOnly  := false;
      DBEVlrICMS.ReadOnly      := false;
      DBEdit31.ReadOnly        := false;
      DBEdit32.ReadOnly        := false;
      DBEdit33.ReadOnly        := false;
      DBEdit24.ReadOnly        := false;
      DBEdit25.ReadOnly        := false;
    end;

    //----------------------------------------------------------------
  End;
end;

procedure TFPatrimonioCad.SBConsultaitensClick(Sender: TObject);
begin
  inherited;
  If FPatrimonioItensCons = nil Then
    FPatrimonioItensCons := TFPatrimonioItensCons.Create(Application);
  If FPatrimonioItensCons.ShowModal = mrOk Then
  Begin
    DMPatrimonio.QPatrimonio.Close;
    DMPatrimonio.QPatrimonio.SetVariable( ':PK', DMPatrimonio.QPatrimonioItemConsCOD_PATRIMONIO_CAB.Value );
    DMPatrimonio.QPatrimonio.Open;

    DMPatrimonio.QPatrimonioItem.Locate('COD_PATRIMONIO_ITEM', DMPatrimonio.QPatrimonioItemConsCOD_PATRIMONIO_ITEM.Value,[]);

    //PageControl1Change(Self);
  End;
end;

procedure TFPatrimonioCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If (DSPrimario.State in [dsInsert,dsEdit]) Then
    SBConsultaItens.Enabled := False
  Else
    SBConsultaItens.Enabled := True;
end;

procedure TFPatrimonioCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  DMPatrimonio.QPatrimonio.Close;
  DMPatrimonio.QPatrimonio.Open;
end;

procedure TFPatrimonioCad.RelaodePatrimnio1Click(Sender: TObject);
begin
  inherited;

  if FPatrimonioParam = Nil then
  Begin
    FPatrimonioParam := TFPatrimonioParam.Create(Application);
    FPatrimonioParam.ME0DtAquisicaoInicial.Text := DateToStr(Date);
    FPatrimonioParam.ME0DtAquisicaoFinal.Text   := DateToStr(Date);
  End;
  FPatrimonioParam.PGRelatorio.Pages[0].TabVisible:=True;


  If(FRRelacaoPatrimonio = nil)Then
    FRRelacaoPatrimonio := TFRRelacaoPatrimonio.create(Application);
  DMPatrimonio.QRRelacaoPatrimonio.Close;
  DMPatrimonio.QRRelacaoPatrimonio.open;
  FRRelacaoPatrimonio.QRPrimario.Preview;
  DMPatrimonio.QRRelacaoPatrimonio.Close;
end;


function ReplaceStr (Text,oldstring,newstring:string):string;
var atual, strtofind, originalstr:pchar;
NewText:string;
lenoldstring,lennewstring,m,index:integer;
begin //ReplaceStr
  NewText:=Text;
  originalstr:=pchar(Text);
  strtofind:=pchar(oldstring);
  lenoldstring:=length(oldstring);
  lennewstring:=length(newstring);
  Atual:=StrPos(OriginalStr,StrtoFind);
  index:=0;
  while Atual<>nil do
  begin //Atual<>nil
  m:=Atual - OriginalStr - index + 1;
  Delete(NewText,m,lenoldstring);
  Insert(newstring,NewText,m);
  inc(index,lenoldstring-lennewstring);
  Atual:=StrPos(Atual+lenoldstring,StrtoFind);
  end; //Atual<>nil
  Result:=NewText;
end; //ReplaceStr

procedure TFPatrimonioCad.RelatriodeItensdePatrimnio1Click(
  Sender: TObject);
begin
  inherited;
  if FPatrimonioParam = Nil then
  Begin
    FPatrimonioParam:= TFPatrimonioParam.Create(Application);
    FPatrimonioParam.ME0DtAquisicaoInicial.Text := DateToStr(Date);
    FPatrimonioParam.ME0DtAquisicaoFinal.Text := DateToStr(Date);
  End;
  FPatrimonioParam.PGRelatorio.Pages[0].TabVisible:=True;
  If FPatrimonioParam.ShowModal =  mrOk then
  Begin
    With DMPatrimonio do
    Begin
      DMUsuario.Checar_Filial_Usuario( FPatrimonioParam.ME0CodFilial.Text, 'PATRIMONIO');
      If(Trim(FPatrimonioParam.ME0DtAquisicaoInicial.Text) = '')OR
        (Trim(FPatrimonioParam.ME0DtAquisicaoFinal.Text) = '')Then
      Begin
        raise Exception.Create('É necessário Informar um período');
      End;

      QRPatrimonioItem.SetVariable('DT_AQUISICAO_INI',FPatrimonioParam.ME0DtAquisicaoInicial.Text);
      QRPatrimonioItem.SetVariable('DT_AQUISICAO_FIM',FPatrimonioParam.ME0DtAquisicaoFinal.Text);

      If(Trim(FPatrimonioParam.ME0CodPatrimonio.Text) <> '')Then
        QRPatrimonioItem.SetVariable('PATRIMONIO',FPatrimonioParam.ME0CodPatrimonio.Text)
      Else
        QRPatrimonioItem.SetVariable('PATRIMONIO',null);

      If(Trim(FPatrimonioParam.ME0CodFilial.Text) <> '')Then
        QRPatrimonioItem.SetVariable('FILIAL',FPatrimonioParam.ME0CodFilial.Text)
      Else
        QRPatrimonioItem.SetVariable('FILIAL',null);

      If(Trim(FPatrimonioParam.ME0CodProduto.Text) <> '')Then
        QRPatrimonioItem.SetVariable('PRODUTO',FPatrimonioParam.ME0CodProduto.Text)
      Else
        QRPatrimonioItem.SetVariable('PRODUTO',null);

      If(Trim(FPatrimonioParam.ME0CodLocalizacao.Text) <> '')Then
        QRPatrimonioItem.SetVariable('LOCALIZACAO',FPatrimonioParam.ME0CodLocalizacao.Text)
      Else
        QRPatrimonioItem.SetVariable('LOCALIZACAO',null);

      If(Trim(FPatrimonioParam.ME0CodNotaEntrada.Text) <> '')Then
        QRPatrimonioItem.SetVariable('NOTA_ENTRADA',FPatrimonioParam.ME0CodNotaEntrada.Text)
      Else
        QRPatrimonioItem.SetVariable('NOTA_ENTRADA',null);

      If(Trim(FPatrimonioParam.ME0CodNotaSaida.Text) <> '')Then
        QRPatrimonioItem.SetVariable('NOTA_SAIDA',FPatrimonioParam.ME0CodNotaSaida.Text)
      Else
        QRPatrimonioItem.SetVariable('NOTA_SAIDA',null);

      Case FPatrimonioParam.RG0Situacao.ItemIndex of
        0: QRPatrimonioItem.SetVariable('SITUACAO','ATIVO');
        1: QRPatrimonioItem.SetVariable('SITUACAO','VENDIDO');
        2: QRPatrimonioItem.SetVariable('SITUACAO','BAIXADO');
        3: QRPatrimonioItem.SetVariable('SITUACAO','ROUBADO');
        4: QRPatrimonioItem.SetVariable('SITUACAO','OBSOLETO');
        5: QRPatrimonioItem.SetVariable('SITUACAO',null);
      End;

      Case FPatrimonioParam.RG0CIAP.ItemIndex of
        0: QRPatrimonioItem.SetVariable('IND_GERA_CIAP', null);
        1: QRPatrimonioItem.SetVariable('IND_GERA_CIAP', 'SIM');
        2: QRPatrimonioItem.SetVariable('IND_GERA_CIAP', 'NAO');
      End;

      //QRPatrimonioItem.sql := ReplaceStr(QRPatrimonioItem.sql, ':ORDER_BY_CLAUSE', 'TB_PRODUTO.COD_PRODUTO');

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AB' then
        QRPatrimonioItem.sql.Text := ReplaceStr(QRPatrimonioItem.sql.Text, ':ORDER_BY_CLAUSE', 'TB_PRODUTO.COD_PRODUTO')
      else
        QRPatrimonioItem.sql.Text := ReplaceStr(QRPatrimonioItem.sql.Text, ':ORDER_BY_CLAUSE', 'TB_PATRIMONIO_CAB.COD_PATRIMONIO_CAB, TB_LOCALIZACAO.DESC_LOCALIZACAO, TB_PATRIMONIO_ITEM.COD_USUARIO, TB_PATRIMONIO_ITEM.COD_FILIAL, TB_USUARIO.NOME, TB_PRODUTO.DESC_PRODUTO, TB_PATRIMONIO_ITEM.IND_SITUACAO, TB_PATRIMONIO_ITEM.DT_AQUISICAO');

      QRPatrimonioItem.Close;
      QRPatrimonioItem.open;

      If(FRPatrimonioItens = nil)Then
        FRPatrimonioItens := TFRPatrimonioItens.Create(Application);

      FRPatrimonioItens.QRLBFilial.Caption  := 'Filial: ' + FPatrimonioParam.ME0Filial.Text;
      FRPatrimonioItens.QRLBPeriodo.Caption := 'Bens Adquiridos no Período de ' +
             FPatrimonioParam.ME0DtAquisicaoInicial.Text + ' até ' +
             FPatrimonioParam.ME0DtAquisicaoFinal.Text;

      If FPatrimonioParam.RGPreview.ItemIndex = 0 then
        FRPatrimonioItens.QRPrimario.Preview
      else
        FRPatrimonioItens.QRPrimario.Print;
      QRPatrimonioItem.Close;
    End;
  End;
end;

procedure TFPatrimonioCad.btnLocalizacaoConsClick(Sender: TObject);
begin
  inherited;
  If (FLocalizacaoCons = nil) Then
    FLocalizacaoCons := TFLocalizacaoCons.Create(Application);
  If (FLocalizacaoCons.ShowModal = mrOk) Then
    DMPatrimonio.QPatrimonioItemCOD_Localizacao.Value := DMLocalizacao.QLocalizacaoConsCOD_LOCALIZACAO.Value;
end;

procedure TFPatrimonioCad.btnNotaEntradaConsClick(Sender: TObject);
begin
  inherited;
  If(FNotaEntradaCons = nil)Then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  If(FNotaEntradaCons.showmodal = mrOk)Then
    DMPatrimonio.QPatrimonioItemCOD_NOTA_CAB_ENTRADA.Value := DMNotaEntrada.QNotaEntradaConsCOD_NOTA_CAB.Value;
end;

procedure TFPatrimonioCad.btnNotaSaidaConsClick(Sender: TObject);
begin
  inherited;
  If(FNotaSaidaCons = nil)Then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  If(FNotaSaidaCons.showmodal = mrOk)Then
    DMPatrimonio.QPatrimonioItemCOD_NOTA_CAB_SAIDA.Value := DMNotaSaida.QNotaSaidaConsCOD_NOTA_CAB.Value;
end;

procedure TFPatrimonioCad.BtnUsuarioClick(Sender: TObject);
begin
  inherited;
  If(FUsuarioCons = nil)Then
    FUsuarioCons := TFUsuarioCons.Create(Application);
  If(FUsuarioCons.showmodal = mrOk)Then
    DMPatrimonio.QPatrimonioItemCOD_USUARIO.Value := DMUsuario.QUsuarioConsCOD_USUARIO.Value;
end;

procedure TFPatrimonioCad.GerarDepreciao1Click(Sender: TObject);
begin
  inherited;

  if FGerarParam = nil then
    FGerarParam := TFGerarParam.create(application);

  FGerarParam.PGRelatorio.Pages[0].TabVisible := True;
  if FGerarParam.showmodal <> mrOk then
     Abort;

  try
    DMOracle.DBCemapa.StartTransaction;

    if trim(FGerarParam.ME0CodFilial.Text) = '' then
      DMPatrimonio.OPPatrimonio.CallProcedure(
         'GERAR_DEPRECIACAO',[FGerarParam.CB0Mes.ItemIndex+1,
                              strtoint(FGerarParam.ME0Ano.text)])
    else
      DMPatrimonio.OPPatrimonio.CallProcedure(
         'GERAR_DEPRECIACAO',[FGerarParam.CB0Mes.ItemIndex+1,
                              strtoint(FGerarParam.ME0Ano.text), strtoint(trim(FGerarParam.ME0CodFilial.Text))]);

    DMOracle.DBCemapa.Commit;

    DMPatrimonio.QPatrimonioItem.RefreshRecord;
    DMDepreciacao.QDepreciacaoPatrimonio.Refresh;

    MessageDlg( 'Depreciação gerada com sucesso para ' + FGerarParam.CB0Mes.Text +
                ' de ' + FGerarParam.ME0Ano.Text, mtInformation, [mbok], 0);
  except
    DMOracle.DBCemapa.RollBack;
    Raise;
  end;
end;

procedure TFPatrimonioCad.GerarCIAP1Click(Sender: TObject);
var
  wMes                  : integer;
  wMesExtenso           : string;
  wAno                  : integer;
  wCodFilial            : integer;
begin
  inherited;
  if FGerarParam = nil then
    FGerarParam := TFGerarParam.create(application);
  FGerarParam.PGRelatorio.Pages[1].TabVisible := True;
  if FGerarParam.showmodal <> mrOk then
    Abort;

  wMesExtenso := FGerarParam.CB1Mes.Text;
  wMes := FGerarParam.CB1Mes.ItemIndex + 1;
  wAno := StrToInt(FGerarParam.ME1Ano.text);

  if trim(FGerarParam.ME1CodFilial.Text) <> '' then
    wCodFilial := strtoint(trim(FGerarParam.ME1CodFilial.Text));

  try
    DMOracle.DBCemapa.StartTransaction;

    if trim(FGerarParam.ME1CodFilial.Text) = '' then
      DMPatrimonio.OPPatrimonio.CallProcedure('GERAR_CIAP',[wMes,wAno])
    else
      DMPatrimonio.OPPatrimonio.CallProcedure('GERAR_CIAP',[wMes,wAno, wCodFilial]);

    DMOracle.DBCemapa.Commit;
    DMPatrimonio.QPatrimonioItem.RefreshRecord;
    DMCIAP.QCIAPPatrimonio.Refresh;
    MessageDlg( 'CIAP gerado com sucesso para ' + wMesExtenso +
                ' de ' + inttostr(wAno), mtInformation, [mbok], 0);
  except
    DMOracle.DBCemapa.RollBack;
    Raise;
  end;
end;

procedure TFPatrimonioCad.VoltaGerarDepreciao1Click(Sender: TObject);
var
  wMes                  : integer;
  wMesExtenso           : string;
  wAno                  : integer;
  wCodFilial : integer;
begin
  inherited;

  if FGerarParam = nil then
    FGerarParam := TFGerarParam.create(application);

  FGerarParam.PGRelatorio.Pages[2].TabVisible := True;
  if FGerarParam.showmodal <> mrOk then
     Abort;

  wMesExtenso := FGerarParam.CB2Mes.Text;
  wMes        := FGerarParam.CB2Mes.ItemIndex + 1;
  wAno        := StrToInt(FGerarParam.ME2Ano.text);
  if trim(FGerarParam.ME2CodFilial.Text) <> '' then
    wCodFilial := strtoint(trim(FGerarParam.ME2CodFilial.Text));

  try
    DMOracle.DBCemapa.StartTransaction;

    //VOLTAR O QUE FOI GERADO NO MES QUE FOI PASSADO COMO PARAMETRO
    if trim(FGerarParam.ME2CodFilial.Text) = '' then
      DMPatrimonio.OPPatrimonio.CallProcedure('VOLTAR_DEPRECIACAO',[wMes, wAno])
    else
      DMPatrimonio.OPPatrimonio.CallProcedure('VOLTAR_DEPRECIACAO',[wMes, wAno, wCodFilial]);
    //-----------------------------------
    
    DMOracle.DBCemapa.Commit;
    DMPatrimonio.QPatrimonioItem.RefreshRecord;
    DMDepreciacao.QDepreciacaoPatrimonio.Refresh;
    MessageDlg( 'Voltou Depreciação com sucesso para ' + wMesExtenso +
                ' de ' + inttostr(wAno), mtInformation, [mbok], 0);
  except
    DMOracle.DBCemapa.RollBack;
    Raise;
  end;
end;

procedure TFPatrimonioCad.VoltaGerarCIAP1Click(Sender: TObject);
var
  wMes        : integer;
  wMesExtenso : string;
  wAno        : integer;
  wCodFilial  : integer;
begin
  inherited;
  if FGerarParam = nil then
    FGerarParam := TFGerarParam.create(application);
  FGerarParam.PGRelatorio.Pages[3].TabVisible := True;
  if FGerarParam.showmodal <> mrOk then
    Abort;

  wMesExtenso := FGerarParam.CB3Mes.Text;
  wMes        := FGerarParam.CB3Mes.ItemIndex + 1;
  wAno        := strtoint(FGerarParam.ME3Ano.text);
  if Trim(FGerarParam.ME3CodFilial.Text) <> '' then
    wCodFilial := strtoint(Trim(FGerarParam.ME3CodFilial.Text));

  try
    DMOracle.DBCemapa.StartTransaction;

    //VOLTAR O QUE FOI GERADO NO MES PASSADO COMO PARAMETRO
    if trim(FGerarParam.ME3CodFilial.Text) = '' then
      DMPatrimonio.OPPatrimonio.CallProcedure('VOLTAR_CIAP', [wMes, wAno])
    else
      DMPatrimonio.OPPatrimonio.CallProcedure('VOLTAR_CIAP', [wMes, wAno, wCodFilial]);

    DMOracle.DBCemapa.Commit;
    DMPatrimonio.QPatrimonioItem.RefreshRecord;
    DMCIAP.QCIAPPatrimonio.Refresh;
    MessageDlg( 'Voltou CIAP com sucesso para ' + wMesExtenso +
                ' de ' + IntToStr(wAno), mtInformation, [mbok], 0);
  except
    DMOracle.DBCemapa.RollBack;
    Raise;
  end;
end;

procedure TFPatrimonioCad.DSIncorporacaoStateChange(Sender: TObject);
begin
  inherited;
  if DSIncorporacao.State in [dsedit, dsInsert] then
    btn5NumNota.Enabled := true
  else
    btn5NumNota.Enabled := false;
end;

procedure TFPatrimonioCad.btnCreditoDepreciacaoClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCONTA_CREDITO_DEPRECIACAO.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFPatrimonioCad.btnCreditoCIAPClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCONTA_CREDITO_CIAP.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFPatrimonioCad.btnCreditoDiferencaCIAPClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCONTA_CREDITO_DIF_CIAP.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFPatrimonioCad.btnDebitoDepreciacaoClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCONTA_DEBITO_DEPRECIACAO.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFPatrimonioCad.btnDebitoCIAPClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCONTA_DEBITO_CIAP.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFPatrimonioCad.btnDebitoDiferencaCIAPClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCONTA_DEBITO_DIF_CIAP.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFPatrimonioCad.btnHistoricoContabilClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemHISTORICO_CONTABIL.Value := DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value;
end;

procedure TFPatrimonioCad.BaixadoPatrimnio1Click(Sender: TObject);
var
  wVal : string;
begin
  inherited;

  if DMPatrimonio.QPatrimonioItem.Eof then
    Raise Exception.Create('Não tem Nenhum Patimônio Selecionado!');

  if DMPatrimonio.QPatrimonioItemIND_SITUACAO.Value <> 'ATIVO' then
    Raise Exception.Create('Esse patrimonio já foi baixado!');

  if DMPatrimonio.QPatrimonioItemIND_CONFIRMADO.Value <> 'SIM' then
    Raise Exception.Create('Esse patrimonio não foi confirmado!');

  if FGerarParam = nil then
    FGerarParam := TFGerarParam.create(application);
  FGerarParam.PGRelatorio.Pages[4].TabVisible := True;
  FGerarParam.ME4ValBaixa.Text := floattostr(DMPatrimonio.QPatrimonioItemVAL_AQUISICAO.value);
  if FGerarParam.showmodal <> mrOk then
    Abort;

  if trim(FGerarParam.ME4DtBaixa.Text) = '' then
    raise Exception.Create('Informe a data de Baixa!');

  if trim(FGerarParam.ME4ValBaixa.Text) = '' then
    raise Exception.Create('Informe o valor da Baixa!');

  try
    DMOracle.DBCemapa.StartTransaction;

    DMPatrimonio.QPatrimonioItem.Edit;
    case FGerarParam.RG4Motivo.ItemIndex of
      0 : wVal := 'VENDIDO';
      1 : wVal := 'BAIXADO';
      2 : wVal := 'ROUBADO';
      3 : wVal := 'OBSOLETO';
    else Raise Exception.Create('Informe um motivo para a Baixa!');
    end;

    DMPatrimonio.OPPatrimonio.CallProcedure('BAIXA_PATRIMONIO',[DMPatrimonio.QPatrimonioItemCOD_PATRIMONIO_ITEM.value,wVal,strtodate(FGerarParam.ME4DtBaixa.Text), strtofloat(FGerarParam.ME4ValBaixa.Text)]);

    DMOracle.DBCemapa.Commit;
    DMPatrimonio.QPatrimonioItem.RefreshRecord;//atualiza os dados da tela
    MessageDlg('Patrimônio Baixado com Sucesso?',mtConfirmation,[mbok],0);
  except
    DMOracle.DBCemapa.Rollback;
    Raise;
  end;
end;

procedure TFPatrimonioCad.btnCreditoBaixaClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCONTA_CREDITO_BAIXA.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFPatrimonioCad.btnCreditoEstornoDepreciacaoClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCONTA_CREDITO_BAIXA_DEP.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFPatrimonioCad.btnDebitoBaixaClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCONTA_DEBITO_BAIXA.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFPatrimonioCad.btnDebitoEstornoDepreciacaoClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCONTA_DEBITO_BAIXA_DEP.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFPatrimonioCad.TabSheet9Show(Sender: TObject);
begin
  inherited;
  DMIncorporacao.QIncorporacao.open;
  DMIncorporacao.QIncorporacao.close;
  DMIncorporacao.QIncorporacao.open;
end;

procedure TFPatrimonioCad.FichadoCIAP1Click(Sender: TObject);
begin
  inherited;

  if FPatrimonioParam = Nil then
  Begin
    FPatrimonioParam:= TFPatrimonioParam.Create(Application);
    FPatrimonioParam.ME0DtAquisicaoInicial.Text := DateToStr(Date);
    FPatrimonioParam.ME0DtAquisicaoFinal.Text := DateToStr(Date);
  End;
  FPatrimonioParam.PGRelatorio.Pages[2].TabVisible:=True;
  If FPatrimonioParam.ShowModal = mrOk then
  begin
    DMCIAP.QRFichaCIAP.close;

    if trim(FPatrimonioParam.ME2CodFilial.Text) = '' then
      DMCIAP.QRFichaCIAP.SetVariable('COD_FILIAL',null)
    else
      DMCIAP.QRFichaCIAP.SetVariable('COD_FILIAL',StrToInt(trim(FPatrimonioParam.ME2CodFilial.Text)));

    if trim(FPatrimonioParam.ME2CodPatrimonio.Text) = '' then
      DMCIAP.QRFichaCIAP.SetVariable('COD_PATRIMONIO_CAB',null)
    else
      DMCIAP.QRFichaCIAP.SetVariable('COD_PATRIMONIO_CAB',StrToInt(trim(FPatrimonioParam.ME2CodPatrimonio.Text)));

    if trim(FPatrimonioParam.ME2CodProduto.Text) = '' then
      DMCIAP.QRFichaCIAP.SetVariable('COD_PRODUTO',null)
    else
      DMCIAP.QRFichaCIAP.SetVariable('COD_PRODUTO',StrToInt(trim(FPatrimonioParam.ME2CodProduto.Text)));

    if trim(FPatrimonioParam.ME2NumOrdem.Text) = '' then
      DMCIAP.QRFichaCIAP.SetVariable('NUM_ORDEM',null)
    else
      DMCIAP.QRFichaCIAP.SetVariable('NUM_ORDEM',StrToInt(trim(FPatrimonioParam.ME2NumOrdem.Text)));

    DMCIAP.QRFichaCIAP.open;

    if FRFichaCIAP = nil then
      FRFichaCIAP := TFRFichaCIAP.create(application);
    if FPatrimonioParam.RGPreview.ItemIndex = 0 then
      FRFichaCIAP.QRPrimario.Preview
    else
      FRFichaCIAP.QRPrimario.Print;
  end;
end;

procedure TFPatrimonioCad.ControledeCrditodeICMSdoAtivoPermanente1Click(
  Sender: TObject);
begin
  inherited;
  if FPatrimonioParam = Nil then
  Begin
    FPatrimonioParam:= TFPatrimonioParam.Create(Application);
    FPatrimonioParam.ME0DtAquisicaoInicial.Text := DateToStr(Date);
    FPatrimonioParam.ME0DtAquisicaoFinal.Text := DateToStr(Date);
  End;
  FPatrimonioParam.PGRelatorio.Pages[3].TabVisible:=True;

  If FPatrimonioParam.ShowModal = mrOk then
  begin
    DMCIAP.QRControle.close;

    if trim(FPatrimonioParam.ME3CodFilial.Text) = '' then
      DMCIAP.QRControle.SetVariable('COD_FILIAL',null)
    else
      DMCIAP.QRControle.SetVariable('COD_FILIAL',strtoint(Trim(FPatrimonioParam.ME3CodFilial.Text)));

    if trim(FPatrimonioParam.ME3Ano.Text) = '' then
      DMCIAP.QRControle.SetVariable('NUM_ANO',null)
    else
      DMCIAP.QRControle.SetVariable('NUM_ANO',strtoint(Trim(FPatrimonioParam.ME3Ano.Text)));

    DMCIAP.QRControle.open;

    if FRControle = nil then
      FRControle := TFRControle.create(application);
    FRControle.QRPrimario.Preview;
  end;
end;

procedure TFPatrimonioCad.ConferenciaICMSPerdidoEstornado1Click(
  Sender: TObject);
begin
  inherited;
  if FPatrimonioParam = Nil then
  Begin
    FPatrimonioParam:= TFPatrimonioParam.Create(Application);
    FPatrimonioParam.ME0DtAquisicaoInicial.Text := DateToStr(Date);
    FPatrimonioParam.ME0DtAquisicaoFinal.Text := DateToStr(Date);
  End;
  FPatrimonioParam.PGRelatorio.Pages[4].TabVisible:=True;

  If FPatrimonioParam.ShowModal = mrOk then
  begin
    DMCIAP.QRConferencia.close;

    if trim(FPatrimonioParam.ME4CodFilial.Text) = '' then
      DMCIAP.QRConferencia.SetVariable('COD_FILIAL',null)
    else
      DMCIAP.QRConferencia.SetVariable('COD_FILIAL',strtoint(Trim(FPatrimonioParam.ME4CodFilial.Text)));


    if trim(FPatrimonioParam.ME4Ano.Text) = '' then
      DMCIAP.QRConferencia.SetVariable('NUM_ANO',null)
    else
      DMCIAP.QRConferencia.SetVariable('NUM_ANO',strtoint(Trim(FPatrimonioParam.ME4Ano.Text)));

    DMCIAP.QRConferencia.open;

    if FRConferencia = nil then
      FRConferencia := TFRConferencia.create(application);
    FRConferencia.QRPrimario.Preview;
  end;
end;

procedure TFPatrimonioCad.Contbil1Click(Sender: TObject);
begin
  inherited;
  if FPatrimonioParam = Nil then
  Begin
    FPatrimonioParam := TFPatrimonioParam.Create(Application);

    FPatrimonioParam.ME0DtAquisicaoInicial.Text := DateToStr(Date);
    FPatrimonioParam.ME0DtAquisicaoFinal.Text   := DateToStr(Date);
  End;
  FPatrimonioParam.PGRelatorio.Pages[5].TabVisible:=True;

  If FPatrimonioParam.ShowModal = mrOk then
  begin

    if trim(FPatrimonioParam.ME5Ano.Text) = '' then
      raise Exception.Create('Informe o ano.');

    if trim(FPatrimonioParam.ME5DtBase.Text) = '' then
      raise Exception.Create('Informe a data Base');

    DMCIAP.QRContabil.close;
    DMCIAP.QRContabil.SetVariable('NUM_ANO',FPatrimonioParam.ME5Ano.Text);
    if trim(FPatrimonioParam.ME5CodFilial.Text) = '' then
      DMCIAP.QRContabil.SetVariable('COD_FILIAL',null)
    else
      DMCIAP.QRContabil.SetVariable('COD_FILIAL',StrToInt(trim(FPatrimonioParam.ME5CodFilial.Text)));

    DMCIAP.QRContabil.SetVariable('DT_BASE',StrToDate(trim(FPatrimonioParam.ME5DtBase.Text)));

    DMCIAP.QRContabil.open;

    if FRContabil = nil then
      FRContabil := TFRContabil.create(application);
    FRContabil.QRLAno.Caption := FPatrimonioParam.ME5Ano.Text;
    FRContabil.QRLDtBase.Caption := 'Dt. Base: ' + FPatrimonioParam.ME5DtBase.Text;
    if FPatrimonioParam.RGPreview.ItemIndex = 0 then
      FRContabil.QRPrimario.Preview
    else
      FRContabil.QRPrimario.Print;
  end;
end;

procedure TFPatrimonioCad.ConfirmarCadastro1Click(Sender: TObject);
begin
  inherited;

  if DMPatrimonio.QPatrimonioItem.Eof then
    Raise Exception.Create('Não tem Nenhum Patimônio Selecionado!');

  //TELA DE CONFIRMAÇÃO
  if MessageDlg('Deseja Realmente Confirmar esse Patrimônio?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    Abort;
  //---------------------------------------------------------------

  //VERIFICAR SE JA ESTÁ CONFIRMADO. RETORNAR ERRO.
  if DMPatrimonio.QPatrimonioItemIND_CONFIRMADO.Value = 'SIM' then
    raise Exception.Create('Esse Patrimônio já está Confirmado!');
  //--------------------------------------------------

  //VERIFICAR SE FOI LANCADO OS CAMPOS CONTABEIS PARA DEPRECIACAO.
  //só verifica se o patrimonio deprecia
  if (DMPatrimonio.QPatrimonioItemPERC_DEPRECIACAO.Text <> '') and
    (trim(DMPatrimonio.QPatrimonioItemCONTA_CREDITO_DEPRECIACAO.Value) = '') then
    raise Exception.Create('Não foi informado a Conta Crédito para a Depreciação!');

  if (DMPatrimonio.QPatrimonioItemPERC_DEPRECIACAO.Text <> '') and
    (trim(DMPatrimonio.QPatrimonioItemCONTA_DEBITO_DEPRECIACAO.Value) = '') then
    raise Exception.Create('Não foi informado a Conta Débito para a Depreciação!');

  if (DMPatrimonio.QPatrimonioItemPERC_DEPRECIACAO.Text <> '') and
    (trim(DMPatrimonio.QPatrimonioItemCONTA_CREDITO_BAIXA_DEP.Value) = '') then
    raise Exception.Create('Não foi informado a Conta Crédito para o Estorno da Depreciação!');

  if (DMPatrimonio.QPatrimonioItemPERC_DEPRECIACAO.Text <> '') and
    (trim(DMPatrimonio.QPatrimonioItemCONTA_DEBITO_BAIXA_DEP.Value) = '') then
    raise Exception.Create('Não foi informado a Conta Débito para o Estorno da Depreciação!');

  //historicos----
  if (DMPatrimonio.QPatrimonioItemPERC_DEPRECIACAO.Text <> '') and
    (trim(DMPatrimonio.QPatrimonioItemCOD_HISTORICO_DEPRECIACAO.Text) = '') then
    raise Exception.Create('Não foi informado o Histórico para a depreciação!');

  if (DMPatrimonio.QPatrimonioItemPERC_DEPRECIACAO.Text <> '') and
    (trim(DMPatrimonio.QPatrimonioItemCOD_HISTORICO_BAIXA_DEP.Text) = '') then
    raise Exception.Create('Não foi informado o Histórico para estorno da depreciação!');
  //------------------------------------------------------

  //VERIFICA SE FOI LANCADO OS CAMPOS CONTABEIS PARA O CIAP
  //só verifica se o patrimonio gera CIAP
  if (DMPatrimonio.QPatrimonioItemIND_GERA_CIAP.Value = 'SIM') and
     (trim(DMPatrimonio.QPatrimonioItemCONTA_CREDITO_CIAP.Text) = '') then
    raise Exception.Create('Não foi informado a Conta Crédito para o CIAP Utilizado!');

  if (DMPatrimonio.QPatrimonioItemIND_GERA_CIAP.Value = 'SIM') and
     (trim(DMPatrimonio.QPatrimonioItemCONTA_DEBITO_CIAP.Text) = '') then
    raise Exception.Create('Não foi informado a Conta Débito para o CIAP Utilizado!');

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GRASEL' then
  begin
    if (DMPatrimonio.QPatrimonioItemIND_GERA_CIAP.Value = 'SIM') and
       (trim(DMPatrimonio.QPatrimonioItemCONTA_CREDITO_DIF_CIAP.Text) = '') then
      raise Exception.Create('Não foi informado a Conta Crédito para o CIAP não Utilizado!');

    if (DMPatrimonio.QPatrimonioItemIND_GERA_CIAP.Value = 'SIM') and
       (trim(DMPatrimonio.QPatrimonioItemCONTA_DEBITO_DIF_CIAP.Text) = '') then
      raise Exception.Create('Não foi informado a Conta Débito para o CIAP não Utilizado!');
  end;

  //historicos:
  if (DMPatrimonio.QPatrimonioItemIND_GERA_CIAP.Value = 'SIM') and
     (trim(DMPatrimonio.QPatrimonioItemCOD_HISTORICO_CIAP.Text) = '') then
    raise Exception.Create('Não foi informado o Histórico para o CIAP!');

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GRASEL' then
  begin
    if (DMPatrimonio.QPatrimonioItemIND_GERA_CIAP.Value = 'SIM') and
       (trim(DMPatrimonio.QPatrimonioItemCOD_HISTORICO_DIF_CIAP.Text) = '') then
      raise Exception.Create('Não foi informado o Histórico para o CIAP não utilizado!');
  end;
  //--------------------------------------------------------

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'GRASEL' then //a pedido da Daniele 04/2015
  begin
    //VERIFICA SE FOI LANCADO AS CONTAS CONTABEIS PARA A BAIXA DO PATRIMONIO
    if trim(DMPatrimonio.QPatrimonioItemCONTA_CREDITO_BAIXA.Text) = '' then
      raise Exception.Create('Não foi informado a Conta Crédito para a Baixa do Patrimônio!');

    if trim(DMPatrimonio.QPatrimonioItemCONTA_DEBITO_BAIXA.Text) = '' then
      raise Exception.Create('Não foi informado a Conta Débito para a Baixa do Patrimônio!');

    //historico:
    if trim(DMPatrimonio.QPatrimonioItemCOD_HISTORICO_BAIXA.Text) = '' then
      raise Exception.Create('Não foi informado o Histórico para a Baixa do Patrimônio!');
    //-----------------------------------------------------
  end;

  //VERIFICA SE FOI LANCADO TODAS OU NENHUMA DAS CONTAS CONTABEIS PARA O VALOR DO ICMS
  if (trim(DMPatrimonio.QPatrimonioItemCONTA_CREDITO_ICMS.Text) = '') xor
     (trim(DMPatrimonio.QPatrimonioItemCONTA_DEBITO_ICMS.Text) = '') then
    raise Exception.Create('Deve ser informado a conta Crédito e a conta Débito para o ICMS ou Nenhuma Conta!');

  //historico:
  if (trim(DMPatrimonio.QPatrimonioItemCONTA_CREDITO_ICMS.Text) <> '') then //verifca se as contas foram informada
    if trim(DMPatrimonio.QPatrimonioItemCOD_HISTORICO_ICMS.Text) = '' then //se foram informadas as contas, verifica se foi informado o historico
      raise Exception.Create('Deve ser informado Histórico para o ICMS!');
//  if (Trim(DMPatrimonio.QPatrimonioItemVAL_ICMS.Text) <> '') and
//     (trim(DMPatrimonio.QPatrimonioItemCONTA_CREDITO_ICMS.Text) = '') then
//    raise Exception.Create('Não foi informado a conta Crédito para o ICMS');

//  if (Trim(DMPatrimonio.QPatrimonioItemVAL_ICMS.Text) <> '') and
//     (trim(DMPatrimonio.QPatrimonioItemCONTA_DEBITO_ICMS.Text) = '') then
//    raise Exception.Create('Não foi informado a conta Débito para o ICMS');
  //--------------------------------------------------------

  //VERIFICA SE FOI INFORMADO O HISTORICO CONTABIL PARA O PATRIMONIO
//  if trim(DMPatrimonio.QPatrimonioItemHISTORICO_CONTABIL.Text) = '' then
//    raise Exception.Create('Não foi informado o Histórico Contábil!');
  //----------------------------------------------------------

  //CONFIRMA O PATRIMONIO
  try
    DMOracle.DBCemapa.StartTransaction;

    DMPatrimonio.OPPatrimonio.CallProcedure('CONFIRMAR_PATRIMONIO',[DMPatrimonio.QPatrimonioItemCOD_PATRIMONIO_ITEM.value]);

    DMOracle.DBCemapa.Commit;
    DMPatrimonio.QPatrimonioItem.RefreshRecord;//atualiza os dados da tela
    MessageDlg('Confirmação efetuada com sucesso!',mtInformation,[mbok],0);
  except
    DMOracle.DBCemapa.Rollback;
    Raise;
  end;
  //-------------------------------------------------------------
end;

procedure TFPatrimonioCad.VoltaCadastro1Click(Sender: TObject);
begin
  inherited;

  //TELA DE CONFIRMAÇÃO
  if MessageDlg('Deseja Realmente Voltar a Confirmação para esse Patrimônio?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    Abort;
  //---------------------------------------------------------------

  //VERIFICAR SE JA ESTÁ CONFIRMADO. RETORNAR ERRO.
  if DMPatrimonio.QPatrimonioItemIND_CONFIRMADO.Value <> 'SIM' then
    raise Exception.Create('Esse Patrimônio ainda não foi Confirmado!');
  //--------------------------------------------------

  //VERIFICAR SE NAO FOI DADO BAIXA NO PATRIMONIO
  if DMPatrimonio.QPatrimonioItemIND_SITUACAO.Value <> 'ATIVO' then
    raise Exception.Create('Não é possível voltar a confirmação.'+ #13 +'Já foi dado baixa nesse Patrimônio.');
  //---------------------------------------------------------------

  //VOLTA CONFIRMAÇÃO DO PATRIMONIO
  try
    DMOracle.DBCemapa.StartTransaction;

    DMPatrimonio.OPPatrimonio.CallProcedure('VOLTAR_CONFIRMAR_PATRIMONIO',[DMPatrimonio.QPatrimonioItemCOD_PATRIMONIO_ITEM.value]);

    DMOracle.DBCemapa.Commit;
    DMPatrimonio.QPatrimonioItem.RefreshRecord;//atualiza os dados da tela
    MessageDlg('Confirmação voltou com sucesso!',mtInformation,[mbok],0);
  except
    DMOracle.DBCemapa.Rollback;
    Raise;
  end;
  //-------------------------------------------------------------
end;

procedure TFPatrimonioCad.MapadeClculoeMemriaAcumuladadeDepdoAtivoImobilizadoResumo1Click(
  Sender: TObject);
begin
  inherited;
  if FPatrimonioParam = Nil then
  Begin
    FPatrimonioParam := TFPatrimonioParam.Create(Application);
    FPatrimonioParam.ME0DtAquisicaoInicial.Text := DateToStr(Date);
    FPatrimonioParam.ME0DtAquisicaoFinal.Text   := DateToStr(Date);
  End;
  FPatrimonioParam.PGRelatorio.Pages[6].TabVisible:=True;

  If FPatrimonioParam.ShowModal = mrOk then
  begin

    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AB' then
      DMDepreciacao.QRMapaCalculo.sql.Text := ReplaceStr(DMDepreciacao.QRMapaCalculo.sql.Text, ':ORDER_BY', 'COD_REDUZIDO, :ORDER_BY')      //A VARIAVEL É COLOCADA NOVAMENTE PRA NAO DAR ERRO
    else
      DMDepreciacao.QRMapaCalculo.sql.Text := ReplaceStr(DMDepreciacao.QRMapaCalculo.sql.Text, ':ORDER_BY', 'DESC_PATRIMONIO, :ORDER_BY');

    //se for a ab a ordenação deve ser diferente do que no moinho
    //'ORDER_BY' é uma variavel definida na sql, que controla a ordenção
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AB' then
      DMDepreciacao.QRMapaCalculo.SetVariable(':ORDER_BY', 'COD_REDUZIDO')
    else
      DMDepreciacao.QRMapaCalculo.SetVariable(':ORDER_BY', 'DESC_PATRIMONIO');

    if trim(FPatrimonioParam.ME6Ano.Text) = '' then
      raise Exception.Create('Informe o ano.');

    if trim(FPatrimonioParam.ME6DtBase.Text) = '' then
      raise Exception.Create('Informe a data base.');

    DMDepreciacao.QRMapaCalculo.close;
    DMDepreciacao.QRMapaCalculo.SetVariable('NUM_ANO',FPatrimonioParam.ME6Ano.TEXT);
    if Trim(FPatrimonioParam.ME6CodFilial.TEXT) = '' then
      DMDepreciacao.QRMapaCalculo.SetVariable('COD_FILIAL',null)
    else
      DMDepreciacao.QRMapaCalculo.SetVariable('COD_FILIAL',FPatrimonioParam.ME6CodFilial.TEXT);

    if trim(FPatrimonioParam.ME6DtBase.Text) = '' then
      DMDepreciacao.QRMapaCalculo.SetVariable('DT_BASE',null)
    else
      DMDepreciacao.QRMapaCalculo.SetVariable('DT_BASE',TRIM(FPatrimonioParam.ME6DtBase.TEXT));

    DMDepreciacao.QRMapaCalculo.open;

    if FRDepMapaCalculo = nil then
      FRDepMapaCalculo := TFRDepMapaCalculo.create(application);

    FRDepMapaCalculo.QRLAnoPassado.Caption := '31/12/' + inttostr(strtoint(FPatrimonioParam.ME6Ano.TEXT)-1);
    FRDepMapaCalculo.QRLAnoAtual.Caption   := '31/12/' + FPatrimonioParam.ME6Ano.TEXT;
    FRDepMapaCalculo.QRLFilial.Caption     := FPatrimonioParam.ME6Filial.Text;
    FRDepMapaCalculo.QRLdtBase.Caption     := FPatrimonioParam.ME6DtBase.Text;

    if FPatrimonioParam.RGPreview.ItemIndex = 0 then
      FRDepMapaCalculo.QRPrimario.Preview
    else
      FRDepMapaCalculo.QRPrimario.Print;
  end;
end;

procedure TFPatrimonioCad.btnCreditoICMSClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCONTA_CREDITO_ICMS.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFPatrimonioCad.btnDebitoICMSClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCONTA_DEBITO_ICMS.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFPatrimonioCad.MapadeClceMemAcumdeDepdoAtivoImobBem1Click(
  Sender: TObject);
begin
  inherited;
  if FPatrimonioParam = Nil then
  Begin
    FPatrimonioParam := TFPatrimonioParam.Create(Application);
    FPatrimonioParam.ME0DtAquisicaoInicial.Text := DateToStr(Date);
    FPatrimonioParam.ME0DtAquisicaoFinal.Text := DateToStr(Date);
  End;
  FPatrimonioParam.PGRelatorio.Pages[7].TabVisible:=True;

  If FPatrimonioParam.ShowModal = mrOk then
  begin
    if trim(FPatrimonioParam.ME7CodPatrimonioItem.Text) = '' then
      raise Exception.Create('Informe o patrimônio.');

    if (trim(FPatrimonioParam.ME7DtInicio.Text) = '') or (trim(FPatrimonioParam.ME7DtFim.Text) = '') then
      raise Exception.Create('Informe o período.');

    DMDepreciacao.QRMapaCalculoBem.close;
    DMDepreciacao.QRMapaCalculoBem.SetVariable('COD_PATRIMONIO_ITEM',strtoint(trim(FPatrimonioParam.ME7CodPatrimonioItem.Text)));
    DMDepreciacao.QRMapaCalculoBem.SetVariable('DT_INICIO',strtodate(trim(FPatrimonioParam.ME7DtInicio.Text)));
    DMDepreciacao.QRMapaCalculoBem.SetVariable('DT_FIM',strtodate(trim(FPatrimonioParam.ME7DtFim.Text)));
    DMDepreciacao.QRMapaCalculoBem.open;

    if FRDepMapaCalculoBem = nil then
      FRDepMapaCalculoBem := TFRDepMapaCalculoBem.create(application);
    if FPatrimonioParam.RGPreview.ItemIndex = 0 then
      FRDepMapaCalculoBem.QRPrimario.Preview
    else
      FRDepMapaCalculoBem.QRPrimario.Print;
  end;
end;

procedure TFPatrimonioCad.btnContaContabilClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCONTA_CONTABIL_BEM.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFPatrimonioCad.FormCreate(Sender: TObject);
var wMask : string;
begin
  inherited;
  //--VERIFICA OS GRAUS CONTÁBEIS PARA APLICAR A MÁSCARA CORRETA------------
  wMask := '';
  Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
    4: wMask := '#.##.##.######;0;';
    5: wMask := '#.##.##.##.######;0;';
    6: wMask := '#.##.##.##.##.######;0;';
  End;
  DMPatrimonio.QPatrimonioItemCONTA_CREDITO_DEPRECIACAO.EditMask := wMask;
  DMPatrimonio.QPatrimonioItemCONTA_CREDITO_CIAP.EditMask        := wMask;
  DMPatrimonio.QPatrimonioItemCONTA_CREDITO_DIF_CIAP.EditMask    := wMask;
  DMPatrimonio.QPatrimonioItemCONTA_CREDITO_BAIXA.EditMask       := wMask;
  DMPatrimonio.QPatrimonioItemCONTA_CREDITO_BAIXA_DEP.EditMask   := wMask;
  DMPatrimonio.QPatrimonioItemCONTA_DEBITO_DEPRECIACAO.EditMask  := wMask;
  DMPatrimonio.QPatrimonioItemCONTA_DEBITO_CIAP.EditMask         := wMask;
  DMPatrimonio.QPatrimonioItemCONTA_DEBITO_DIF_CIAP.EditMask     := wMask;
  DMPatrimonio.QPatrimonioItemCONTA_DEBITO_BAIXA.EditMask        := wMask;
  DMPatrimonio.QPatrimonioItemCONTA_DEBITO_BAIXA_DEP.EditMask    := wMask;
  DMPatrimonio.QPatrimonioItemCONTA_CREDITO_ICMS.EditMask        := wMask;
  DMPatrimonio.QPatrimonioItemCONTA_DEBITO_ICMS.EditMask         := wMask;
  DMPatrimonio.QPatrimonioItemCONTA_CONTABIL_BEM.EditMask        := wMask;

  //--FIM VERIFICA GRAUS

  DMPatrimonio.QPatrimonio.Close;
  DMPatrimonio.QPatrimonioItem.Close;
  DMPatrimonio.QPatrimonio.Open;
  DMPatrimonio.QPatrimonioItem.Open;

  DMIncorporacao.QIncorporacao.Close;
  DMIncorporacao.QIncorporacao.Open;

  DMIncorporacao.QBaixa.Close;
  DMIncorporacao.QBaixa.Open;

  DMCIAP.QCIAPPatrimonio.close;
  DMCIAP.QCIAPPatrimonio.open;

  DMDepreciacao.QDepreciacaoPatrimonio.close;
  DMDepreciacao.QDepreciacaoPatrimonio.open;

  DMPatrimonio.QPatrimonioBaixa.Close;
  DMPatrimonio.QPatrimonioBaixa.Open;

  DMPatrimonio.QPatrimonioConserto.Close;
  DMPatrimonio.QPatrimonioConserto.open;

  PageControl1.ActivePage := TabSheet1;
  PageControl2.ActivePage := TabSheet5;
end;

procedure TFPatrimonioCad.TransferirPatrimnio1Click(Sender: TObject);
begin
  inherited;

  if DMPatrimonio.QPatrimonioItem.Eof then
    Raise Exception.Create('Não tem Nenhum Patimônio Selecionado!');

  if DMPatrimonio.QPatrimonioItemIND_SITUACAO.Value <> 'ATIVO' then
    Raise Exception.Create('Esse Patrimônio não está Ativo. Não é possível transferí-lo!');

  if DMPatrimonio.QPatrimonioItemIND_CONFIRMADO.Value <> 'SIM' then
    Raise Exception.Create('Esse Patrimônio não foi confirmado!');

  if FGerarParam = nil then
    FGerarParam := TFGerarParam.create(application);
  FGerarParam.PGRelatorio.Pages[5].TabVisible := True;
  if FGerarParam.showmodal <> mrOk then
    Abort;

  if trim(FGerarParam.ME5CodFilial.Text) = '' then
    raise exception.Create('Informe a Filial de Destino!');

  if trim(FGerarParam.ME5Filial.Text) = '' then
    raise exception.Create('Informe uma Filial de Destino Válida!');

  if trim(FGerarParam.ME5CodFilial.Text) = Trim(DMPatrimonio.QPatrimonioItemCOD_FILIAL.Text) then
    raise exception.Create('A Filial de Origem é a mesma de Destino!');

  if Trim(FGerarParam.ME5CodBemPrincipal.Text) = '' then
    raise exception.Create('Informe o Bem Principal do Patrimônio!');

  if Trim(FGerarParam.ME5BemPrincipal.Text) = '' then
    raise exception.Create('Informe um Bem Principal Válido!');

  if Trim(FGerarParam.ME5NotaSaida.Text) = '' then
    raise exception.Create('Informe a Nota de Saída!');

  if Trim(FGerarParam.ME5NotaEntrada.Text) = '' then
    raise exception.Create('Informe a Nota de Entrada!');

  if Trim(FGerarParam.ME5CodResponsavel.Text) = '' then
    raise exception.Create('Informe um Responsável pelo Patrimônio!');

  if Trim(FGerarParam.ME5Responsavel.Text) = '' then
    raise exception.Create('Informe um Responsável Válido pelo Patrimônio!');

  if Trim(FGerarParam.ME5CodLocalizacao.Text) = '' then
    raise exception.Create('Informe a Localização do Patrimônio na nova Filial!');

  if Trim(FGerarParam.ME5Localizacao.Text) = '' then
    raise exception.Create('Informe uma Localização Válida para o Patrimônio na nova Filial!');

  if Trim(FGerarParam.ME5DtTransferencia.text) = '' then
    raise exception.create('Informe a data de transferência');

  try
    DMOracle.DBCemapa.StartTransaction;

    DMPatrimonio.OPPatrimonio.CallProcedure('TRANSFERIR_PATRIMONIO',
     [DMPatrimonio.QPatrimonioItemCOD_PATRIMONIO_ITEM.value,
      StrToInt(trim(FGerarParam.ME5CodFilial.text)),
      StrToInt(trim(FGerarParam.ME5CodBemPrincipal.text)),
      StrToInt(trim(FGerarParam.ME5CodResponsavel.text)),
      StrToInt(trim(FGerarParam.ME5CodLocalizacao.text)),
      StrToInt(trim(FGerarParam.ME5NotaSaida.text)),
      StrToInt(trim(FGerarParam.ME5NotaEntrada.text)),
      StrToDate(Trim(FGerarParam.ME5DtTransferencia.text))]);

    DMOracle.DBCemapa.Commit;
    DMPatrimonio.QPatrimonioItem.RefreshRecord;//atualiza os dados da tela
    MessageDlg('Transferência Executada com Sucesso!',mtInformation,[mbok],0);
  except
    DMOracle.DBCemapa.Rollback;
    Raise;
  end;
end;

procedure TFPatrimonioCad.VoltarTransferncia1Click(Sender: TObject);
begin
  inherited;

  if DMPatrimonio.QPatrimonioItem.Eof then
    Raise Exception.Create('Não tem Nenhum Patimônio Selecionado!');

//  if DMPatrimonio.QPatrimonioItemIND_SITUACAO.Value <> 'TRANSF' then
//    Raise Exception.Create('Esse Patrimônio não foi transferido!');

  if MessageDlg('Deseja Realmente Volar a Trasferência desse Patrimônio?',mtConfirmation,[mbyes,mbno],0) <> mryes then
    Abort;

  try
    DMOracle.DBCemapa.StartTransaction;

    DMPatrimonio.OPPatrimonio.CallProcedure(
      'VOLTAR_TRANSFERIR_PATRIMONIO',[DMPatrimonio.QPatrimonioItemCOD_PATRIMONIO_ITEM.value]);

    DMOracle.DBCemapa.Commit;
    DMPatrimonio.QPatrimonioItem.RefreshRecord;
    MessageDlg('Trasnferência Voltada com Sucesso!',mtInformation,[mbok],0)
  except
    DMOracle.DBCemapa.Rollback;
    raise;
  end;
end;

procedure TFPatrimonioCad.btnHistoricoDepreciacaoClick(
  Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCOD_HISTORICO_DEPRECIACAO.Value := DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value;
end;

procedure TFPatrimonioCad.btnHistoricoCIAPClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCOD_HISTORICO_CIAP.Value := DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value;
end;

procedure TFPatrimonioCad.btnHistoricoBaixaClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCOD_HISTORICO_BAIXA.Value := DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value;
end;

procedure TFPatrimonioCad.btnHistoricoBaixaDepClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCOD_HISTORICO_BAIXA_DEP.Value := DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value;
end;

procedure TFPatrimonioCad.btnHistoricoICMSClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCOD_HISTORICO_ICMS.Value := DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value;
end;

procedure TFPatrimonioCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(1);
end;

procedure TFPatrimonioCad.BtCopiaClick(Sender: TObject);
begin
  inherited;
  DMPatrimonio.QPatrimonioCOD_PATRIMONIO_CAB.Clear;
end;

procedure TFPatrimonioCad.ImportarContasdoGrupo1Click(Sender: TObject);
begin
  inherited;
  if DMPatrimonio.QPatrimonioItem.Eof then
    raise Exception.Create('Não existe nenhum bem selecionado.');

  if FGerarParam = nil then
    FGerarParam := TFGerarParam.create(application);

  FGerarParam.PGRelatorio.Pages[6].TabVisible := True;
  if FGerarParam.showmodal <> mrOk then
    Abort;

  if trim(FGerarParam.ME6CodGrupoConta.Text) = '' then
    raise Exception.Create('É necessário informar o código do grupo.');

  DMGrupoConta.QGrupoContaCons.Close;
  DMGrupoConta.QGrupoContaCons.SetVariable('COD_PATRIMONIO_GRUPO_CONTA', StrToInt(trim(FGerarParam.ME6CodGrupoConta.Text)));
  DMGrupoConta.QGrupoContaCons.SetVariable('DESC_PATRIMONIO_GRUPO_CONTA', '0');
  DMGrupoConta.QGrupoContaCons.open;

  if DMGrupoConta.QGrupoContaCons.Eof then
    raise Exception.Create('Não existe Grupo Com o código informado');


  DMPatrimonio.QPatrimonioItemCOD_PATRIMONIO_GRUPO_CONTA.Value := DMGrupoConta.QGrupoContaConsCOD_PATRIMONIO_GRUPO_CONTA.value;

  DMPatrimonio.QPatrimonioItemCONTA_CONTABIL_BEM.text        := DMGrupoConta.QGrupoContaConsCONTA_CONTABIL_BEM.text;
  DMPatrimonio.QPatrimonioItemHISTORICO_CONTABIL.text        := DMGrupoConta.QGrupoContaConsHISTORICO_CONTABIL.text;
  DMPatrimonio.QPatrimonioItemCONTA_DEBITO_DEPRECIACAO.text  := DMGrupoConta.QGrupoContaConsCONTA_DEBITO_DEPRECIACAO.text;
  DMPatrimonio.QPatrimonioItemCONTA_CREDITO_DEPRECIACAO.text := DMGrupoConta.QGrupoContaConsCONTA_CREDITO_DEPRECIACAO.text;
  DMPatrimonio.QPatrimonioItemCOD_HISTORICO_DEPRECIACAO.text := DMGrupoConta.QGrupoContaConsCOD_HISTORICO_DEPRECIACAO.text;
  DMPatrimonio.QPatrimonioItemCONTA_DEBITO_CIAP.text         := DMGrupoConta.QGrupoContaConsCONTA_DEBITO_CIAP.text;
  DMPatrimonio.QPatrimonioItemCONTA_CREDITO_CIAP.text        := DMGrupoConta.QGrupoContaConsCONTA_CREDITO_CIAP.text;
  DMPatrimonio.QPatrimonioItemCOD_HISTORICO_CIAP.text        := DMGrupoConta.QGrupoContaConsCOD_HISTORICO_CIAP.text;
  DMPatrimonio.QPatrimonioItemCONTA_DEBITO_DIF_CIAP.text     := DMGrupoConta.QGrupoContaConsCONTA_DEBITO_DIF_CIAP.text;
  DMPatrimonio.QPatrimonioItemCONTA_CREDITO_DIF_CIAP.text    := DMGrupoConta.QGrupoContaConsCONTA_CREDITO_DIF_CIAP.text;
  DMPatrimonio.QPatrimonioItemCOD_HISTORICO_DIF_CIAP.text    := DMGrupoConta.QGrupoContaConsCOD_HISTORICO_DIF_CIAP.text;
  DMPatrimonio.QPatrimonioItemCONTA_DEBITO_BAIXA.text        := DMGrupoConta.QGrupoContaConsCONTA_DEBITO_BAIXA.text;
  DMPatrimonio.QPatrimonioItemCONTA_CREDITO_BAIXA.text       := DMGrupoConta.QGrupoContaConsCONTA_CREDITO_BAIXA.text;
  DMPatrimonio.QPatrimonioItemCOD_HISTORICO_BAIXA.text       := DMGrupoConta.QGrupoContaConsCOD_HISTORICO_BAIXA.text;
  DMPatrimonio.QPatrimonioItemCONTA_DEBITO_BAIXA_DEP.text    := DMGrupoConta.QGrupoContaConsCONTA_DEBITO_BAIXA_DEP.text;
  DMPatrimonio.QPatrimonioItemCONTA_CREDITO_BAIXA_DEP.text   := DMGrupoConta.QGrupoContaConsCONTA_CREDITO_BAIXA_DEP.text;
  DMPatrimonio.QPatrimonioItemCOD_HISTORICO_BAIXA_DEP.text   := DMGrupoConta.QGrupoContaConsCOD_HISTORICO_BAIXA_DEP.text;
  DMPatrimonio.QPatrimonioItemCONTA_DEBITO_ICMS.text         := DMGrupoConta.QGrupoContaConsCONTA_DEBITO_ICMS.text;
  DMPatrimonio.QPatrimonioItemCONTA_CREDITO_ICMS.text        := DMGrupoConta.QGrupoContaConsCONTA_CREDITO_ICMS.text;
  DMPatrimonio.QPatrimonioItemCOD_HISTORICO_ICMS.text        := DMGrupoConta.QGrupoContaConsCOD_HISTORICO_ICMS.text;

  if not (DSPatrimonioItem.State in [dsInsert, dsEdit]) then
    DMPatrimonio.QPatrimonioItem.Edit;
end;

procedure TFPatrimonioCad.btnHistoricoDifCIAPClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMPatrimonio.QPatrimonioItemCOD_HISTORICO_DIF_CIAP.Value := DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value;
end;

procedure TFPatrimonioCad.btn5NumNotaClick(Sender: TObject);
begin
  inherited;
  If (FNotaEntradaCons = nil) Then
    FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  If (FNotaEntradaCons.showmodal = mrOk) Then
    DMPatrimonio.QPatrimonioItemCOD_NOTA_CAB_ENTRADA.Value := DMNotaEntrada.QNotaEntradaConsCOD_NOTA_CAB.Value;
end;

procedure TFPatrimonioCad.SBVoltarBaixaClick(Sender: TObject);
begin
  inherited;
  //VERIRIFICAR SE O BEM POSSUI MAIS DE UMA BAIXA, CASO POSSUA, DEVE ABRIR OUTRO
  //CONTROLE PARA VOLTAR ESSAS BAIXAS

  if DMPatrimonio.QPatrimonioItemIND_SITUACAO.Value = 'TRANSF' then
    Raise Exception.Create('Esse Patrimônio foi Transferido. Não é possível voltar essa baixa dessa forma!');

  if DMIncorporacao.Qbaixa.RecordCount <= 0 then
    Raise Exception.Create('Não há nenhuma baixa selecionada.');

  if MessageDlg('Deseja Voltar a Baixa desse Patrimônio?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    Abort;

  try
    DMOracle.DBCemapa.StartTransaction;

    DMPatrimonio.OPPatrimonio.CallProcedure('VOLTA_BAIXA_PATRIMONIO',[DMIncorporacao.QBaixaCOD_PATRIMONIO_BAIXA.value]);

    DMOracle.DBCemapa.Commit;
    DMPatrimonio.QPatrimonioItem.RefreshRecord;
    MessageDlg('Voltou Baixa com sucesso?',mtConfirmation,[mbok],0);
  except
    DMPatrimonio.QPatrimonioItem.cancel;
    DMOracle.DBCemapa.Rollback;
    Raise;
  end;
end;

procedure TFPatrimonioCad.RelatrioPatrimnioNoConfirmado1Click(
  Sender: TObject);
begin
  inherited;
  with DMPatrimonio do
  begin
    QRPatrimonioNaoConfirmado.Close;
    QRPatrimonioNaoConfirmado.Open;
  end;

  if FRPatrimonioNaoConfirmado = Nil then
    FRPatrimonioNaoConfirmado := TFRPatrimonioNaoConfirmado.Create(Application);
  FRPatrimonioNaoConfirmado.QRPrimario.Preview;
end;

procedure TFPatrimonioCad.TabSheet4Show(Sender: TObject);
begin
  inherited;
  DMPatrimonio.QPatrimonioConserto.open;
  DMPatrimonio.QPatrimonioConserto.Close;
  DMPatrimonio.QPatrimonioConserto.open;
end;

procedure TFPatrimonioCad.SbBuscaCadastroConsertoClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
    DMPatrimonio.QPatrimonioConsertoCOD_CADASTRO.Value := DMCadastro.QCadastroConsCOD_CADASTRO.Value;
end;

end.
