{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE ON}
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_CAST ON}
unit UContratoCad_GP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, QuickRpt, ComObj, variants,
  ActnList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TFContratoCad_GP = class(TFTCadSimples)
    ContratoGarantiadePreo1: TMenuItem;
    Opes1: TMenuItem;
    GeraContasaPagar1: TMenuItem;
    VoltaContasaPagar1: TMenuItem;
    RelaodeContratoGarantia1: TMenuItem;
    BaixaContrato1: TMenuItem;
    N2: TMenuItem;
    Contratoscomsaldosemaberto1: TMenuItem;
    QRCompositeReport1: TQRCompositeReport;
    BaixaCttGPporDescumprimento1: TMenuItem;
    PgControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    BTFilial: TSpeedButton;
    BTCliente: TSpeedButton;
    BtProduto: TSpeedButton;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    BtCadastroParceiro: TSpeedButton;
    Label23: TLabel;
    SBCidadeEntrega: TSpeedButton;
    DBEdit1: TDBEdit;
    MeFilial: TDBEdit;
    DBEdit3: TDBEdit;
    MeProduto: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    MeValUnitario: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBFilial: TDBDirceu;
    DBCliente: TDBDirceu;
    DBProduto: TDBDirceu;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBMemo1: TDBMemo;
    GroupBox1: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit15: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    DBEdit22: TDBEdit;
    BTExcluiLanc: TSpeedButton;
    BTGeraCV: TSpeedButton;
    BTExcluiCV: TSpeedButton;
    DBGrid1: TDBGrid;
    Label24: TLabel;
    DBEdit23: TDBEdit;
    Label25: TLabel;
    DBEdit24: TDBEdit;
    Label26: TLabel;
    DBEdit25: TDBEdit;
    Label27: TLabel;
    DBEdit26: TDBEdit;
    Label28: TLabel;
    DBEdit27: TDBEdit;
    Label29: TLabel;
    DBEdit28: TDBEdit;
    Label30: TLabel;
    DBEdit29: TDBEdit;
    BtAvalista: TSpeedButton;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    DBEdit32: TDBEdit;
    btTestemunha1: TSpeedButton;
    btTestemunha2: TSpeedButton;
    DBRadioGroup4: TDBRadioGroup;
    LiberaContratoPFechamento1: TMenuItem;
    AlterarObservao1: TMenuItem;
    RelResumoContratoGP1: TMenuItem;
    RelResumoContratoGdePreo21: TMenuItem;
    Label37: TLabel;
    DBEdit2: TDBEdit;
    BtOperacao: TBitBtn;
    DBDirceu2: TDBDirceu;
    BaixaContabil1: TMenuItem;
    Label34: TLabel;
    DBEdit4: TDBEdit;
    LiberaPagamentoAntecipado1: TMenuItem;
    DBRadioGroup5: TDBRadioGroup;
    DBEdit9: TDBEdit;
    Label35: TLabel;
    DBRadioGroup10: TDBRadioGroup;
    TsNota: TTabSheet;
    GroupBox2: TGroupBox;
    SpeedButton2: TSpeedButton;
    Label42: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    SbTributacao: TSpeedButton;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    SbFilial: TSpeedButton;
    Label51: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    MECodOperacao: TMaskEdit;
    MEOperacao: TMaskEdit;
    MeSerie: TMaskEdit;
    MeQuantidade: TMaskEdit;
    DBEdit33: TDBEdit;
    MECodTribProd: TMaskEdit;
    MeTribut: TMaskEdit;
    MeDtEmissao: TMaskEdit;
    MeNrNota: TMaskEdit;
    MeCodFilial: TMaskEdit;
    RgCondicaoPagto: TRadioGroup;
    BtConsMens: TBitBtn;
    MeCodMens: TMaskEdit;
    MeDtEntrada: TMaskEdit;
    MeObs1: TMaskEdit;
    MeObs2: TMaskEdit;
    MeValTotal: TMaskEdit;
    Label36: TLabel;
    SbTransportadora: TSpeedButton;
    Label38: TLabel;
    Label66: TLabel;
    SbMotorista: TSpeedButton;
    Label39: TLabel;
    Label65: TLabel;
    SbParceria: TSpeedButton;
    Label128: TLabel;
    Label40: TLabel;
    MECodTransportadora: TMaskEdit;
    METransportadora: TMaskEdit;
    MEPlaca: TMaskEdit;
    RgTipoFrete: TRadioGroup;
    MeMotorista: TMaskEdit;
    MeQtChegada: TMaskEdit;
    MeParceiro: TMaskEdit;
    MeCreditoSemente: TMaskEdit;
    vALUE: TBitBtn;
    Button1: TButton;
    MeNfProdutor: TMaskEdit;
    Label41: TLabel;
    DBGrid2: TDBGrid;
    LblQuantidade: TLabel;
    Label43: TLabel;
    MeTransporte: TMaskEdit;
    SbTransporte: TSpeedButton;
    Label52: TLabel;
    MeDespesas: TMaskEdit;
    Label56: TLabel;
    MeMensagem: TMemo;
    AlteraCdigoProduto1: TMenuItem;
    MeModelo: TMaskEdit;
    Label57: TLabel;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox4: TGroupBox;
    Label58: TLabel;
    SpeedButton9: TSpeedButton;
    Label59: TLabel;
    Label60: TLabel;
    MeArquivo: TMaskEdit;
    BitBtn3: TBitBtn;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    OpenDialog: TOpenDialog;
    DsContrato_Gp_Doc: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure BTFilialClick(Sender: TObject);
    procedure BTClienteClick(Sender: TObject);
    procedure BtProdutoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure ContratoGarantiadePreo1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure GeraContasaPagar1Click(Sender: TObject);
    procedure VoltaContasaPagar1Click(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure RelaodeContratoGarantia1Click(Sender: TObject);
    procedure BaixaContrato1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BTExcluiLancClick(Sender: TObject);
    procedure BTGeraCVClick(Sender: TObject);
    procedure BTExcluiCVClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Contratoscomsaldosemaberto1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBAlterarClick(Sender: TObject);
    procedure BtCadastroParceiroClick(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure SBCidadeEntregaClick(Sender: TObject);
    procedure BaixaCttGPporDescumprimento1Click(Sender: TObject);
    procedure BtAvalistaClick(Sender: TObject);
    procedure btTestemunha1Click(Sender: TObject);
    procedure btTestemunha2Click(Sender: TObject);
    procedure LiberaContratoPFechamento1Click(Sender: TObject);
    procedure AlterarObservao1Click(Sender: TObject);
    procedure RelResumoContratoGP1Click(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure RelResumoContratoGdePreo21Click(Sender: TObject);
    procedure BtOperacaoClick(Sender: TObject);
    procedure BaixaContabil1Click(Sender: TObject);
    procedure LiberaPagamentoAntecipado1Click(Sender: TObject);
    procedure SbParceriaClick(Sender: TObject);
    procedure SbMotoristaClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SbFilialClick(Sender: TObject);
    procedure SbTributacaoClick(Sender: TObject);
    procedure BtConsMensClick(Sender: TObject);
    procedure vALUEClick(Sender: TObject);
    procedure MECodOperacaoExit(Sender: TObject);
    procedure MECodTribProdExit(Sender: TObject);
    procedure SbTransportadoraClick(Sender: TObject);
    procedure MECodTransportadoraExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PgControlChange(Sender: TObject);
    procedure SbTransporteClick(Sender: TObject);
    procedure AlteraCdigoProduto1Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
  private
    { Private declarations }
    procedure Gera_NF_Contrato_GP(pOperacao: Integer; pUnitario,pQuantidade: Real; pCod_Nota_Cab: String);

  public
    { Public declarations }
    procedure ChamaGeraMov(Origem,Docto:String);
  end;

var
  FContratoCad_GP: TFContratoCad_GP;
  WinWord, Docs, Doc: Variant;

implementation

uses Ucontrato_cl, UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl,
  UProdutoCons, UProduto_cl, UContrato_GPCons, UProdutoAgricola_cl, UBiblioteca,
  UOracle_cl, UContrato_CP, UContrato_Param, URContrato_GP,
  URomaneioAgricola_cl, UNotaEntrada_cl, UParamSistema_cl,
  UNotaEntrada_Confirma, UGeraCVenda, UExcluiMovVend_GP, UBaixaMovGP,
  URContratoGP_Aberto, UReciboFixar, USequencia_cl,
  URReciboNFA, UUsuario_cl, UNotaSaida_cl, UCidadeCons, UCidade_cl,
  UrReciboAB, URResumoContrato_GP, UPrecoAgricola_cl, URResumoContrato_GP2,
  UFmFilial, UFmProduto, UOperacao_cl, UPlanilha_cl, UOperacaoCons,
  UContasPagarBaixa, UContasPagar_cl, UContrato_Gp_Ajuste, UTributacaoCons,
  UTributacao_cl, UMensagemCons, UNotaAgricolaConf, UMensagem_cl,
  UTransporteCons, UTransporte_cl, UAlteraProduto, UPDFViewer;

{$R *.DFM}

procedure TFContratoCad_GP.FormActivate(Sender: TObject);
begin
  inherited;
  DMContrato.QContrato_GP.Open;
  DMContrato.QContratoGP_Mov.Open;
  DMContrato.QContratoGP_Doc.Open;
end;

procedure TFContratoCad_GP.BTFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.Showmodal = mrOk then
    DMContrato.QContrato_GPCod_filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFContratoCad_GP.BTClienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil  then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk  then
    DMContrato.QContrato_GPCod_Cadastro.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFContratoCad_GP.BtProdutoClick(Sender: TObject);
begin
  inherited;
  if FprodutoCons = Nil  then
    FprodutoCons := TFprodutoCons.Create(Application);
  if FprodutoCons.ShowModal = mrOk  then
    DMContrato.QContrato_GPCod_Produto.Value:=Trunc(DMProduto.QProdutoConsCod_Produto.Value);
end;

procedure TFContratoCad_GP.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FContrato_GPCons = Nil then
    FContrato_GPCons := TFContrato_GPCons.Create(Application);
  if FContrato_GPCons.ShowModal = mrOK then
    begin
      DMContrato.QContrato_GP.Close;
      DMContrato.QContrato_GP.SetVariable('PK',DMContrato.QContrato_GPConsCOD_CONTRATO_GP.Value);
      DMContrato.QContrato_GP.Open;
      DMContrato.QContrato_GPCons.Close;
    end;
end;

procedure TFContratoCad_GP.ContratoGarantiadePreo1Click(Sender: TObject);
var
  Path,campo : String;
  wTotal, wQt_DPI, wVl_DPI, wVl_Pagar : Real;
begin
  if DMContrato.QContrato_GPCOD_CONTRATO_GP.value <> 0 then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContrato_GPCOD_FILIAL.Text),'AGRICOLA');
      Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',DMContrato.QContrato_GPCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMContrato.QContrato_GPCOD_CADASTRO.Value);
      DMCadastro.QCadastro.Open;
      DMProduto.QProduto.Close;
      DMProduto.QProduto.SetVariable('PK',DMContrato.QContrato_GPCOD_PRODUTO.Value);
      DMProduto.QProduto.Open;
      DMProdutoAgricola.QProdutoAgricola.Close;
      DMProdutoAgricola.QProdutoAgricola.SetVariable('PK',DMContrato.QContrato_GPCOD_PRODUTO.Value);
      DMProdutoAgricola.QProdutoAgricola.Open;
      // Cria objeto principal de controle
      WinWord := CreateOleObject('Word.Application');
      // Mostra o Word
      WinWord.Visible := true;
      // Pega uma interface para o objeto que manipula documentos
      Docs := WinWord.Documents;
      // Abre um Documento
      Doc := Docs.Open(Path+'ContratoGP2.Doc');
      wTotal := (DMContrato.QContrato_GPQT_QUANTIDADE.value*DMContrato.QContrato_GPPRECO.value/DMProduto.QProdutoNUM_EMBALAGEM.Value)-
                (DMContrato.QContrato_GPQT_QUANTIDADE.value*DMContrato.QContrato_GPPRECO.value/DMProduto.QProdutoNUM_EMBALAGEM.Value)*(DMContrato.QContrato_GPPERC_FUNRURAL.value)/100;
      campo:=DMContrato.QContrato_GPLocal_Entrega.Value;
      // Substitui texto via "name parameters"
      Doc.Content.Find.Execute(FindText := '%local_entrega',ReplaceWith := campo,Replace:=2);

      //---dentro deste bloco serão impressos campos existentes apenas no contrato GP do moinho--
      //-----criado por fabio 28/06/2003---------------------------------------------------------
      if (DMParamSistema.QParamSistemaCod_Empresa.Text = 'MOINHO') then
      begin
        campo := Bib.extenso(DMContrato.QContrato_GPQT_QUANTIDADE.Value, 'KG');
        Doc.Content.Find.Execute(FindText := '%quant_ext',ReplaceWith := campo,Replace:=2);
        campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_QUEBRADOS_CONTRATO.Value);
        Doc.Content.Find.Execute(FindText := '%max.quebra',ReplaceWith := campo,Replace:=2);
//        campo := DMCadastro.QCadastroDESC_CEP.Text;
//        Doc.Content.Find.Execute(FindText := '%cep',ReplaceWith := campo,Replace:=2);
        If DMContrato.QContrato_GPDesc_Tipo_Preco.Value = 'REAL' Then
           campo:=Bib.extenso(wTotal,'REAL')
        else
           campo:=Bib.extenso(wTotal,'DOLAR');
        Doc.Content.Find.Execute(FindText := '%extenso',ReplaceWith := campo,Replace:=2);
        campo:=DMFilial.QFilialDESC_INSCRICAO.Value;
        Doc.Content.Find.Execute(FindText := '%insc_filial',ReplaceWith := campo,Replace:=2);
        campo:=DMFilial.QFilialDesc_Endereco.Value;
        Doc.Content.Find.Execute(FindText := '%end_filial',ReplaceWith := campo,Replace:=2);
        campo:=DMFilial.QFilialDesc_Cep.Value;
        Doc.Content.Find.Execute(FindText := '%cep_filial',ReplaceWith := campo,Replace:=2);
        campo:=FormatDateTime(', dd "de" MMMM "de" yyyy.',DMContrato.QContrato_GPDT_CONTRATO.Value);
        Doc.Content.Find.Execute(FindText := '%dt_emis_extenso',ReplaceWith := campo,Replace:=2);
        campo:=DMContrato.QContrato_GPdesc_cidade_entrega.Text;
        Doc.Content.Find.Execute(FindText := '%cidade_entrega',ReplaceWith := campo,Replace:=2);
      end;
      //--------fim do bloco de impressao do moinho

      If DMContrato.QContrato_GPDesc_Tipo_Preco.Value = 'REAL' Then
         campo:='R$ '+FormatFloat('#,##0.00',wTotal)
      Else
         campo:='U$ '+FormatFloat('#,##0.00',wTotal);
      Doc.Content.Find.Execute(FindText := '%total',ReplaceWith := campo,Replace:=2);
      If DMContrato.QContrato_GPDesc_Tipo_Preco.Value = 'REAL' Then
         campo:=Bib.extenso(DMContrato.QContrato_GPPRECO.Value*60,'REAL')
      Else
         campo:=Bib.extenso(DMContrato.QContrato_GPPRECO.Value*60,'DOLAR');
      Doc.Content.Find.Execute(FindText := '%preco_extenso',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPDT_PAGTO.Text;
      Doc.Content.Find.Execute(FindText := '%dt_pagto',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPDESC_ACONDICIONAMENTO.Value;
      Doc.Content.Find.Execute(FindText := '%acondicionamento',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0',DMProduto.QProdutoNUM_EMBALAGEM.Value);
      Doc.Content.Find.Execute(FindText := '%embalagem',ReplaceWith := campo,Replace:=2);
      If DMContrato.QContrato_GPDesc_Tipo_Preco.Value = 'REAL' Then
         campo:='R$ ' + FormatFloat('#,##0.00',DMContrato.QContrato_GPPRECO.Value*60)
      Else
         campo:='U$ ' + FormatFloat('#,##0.00',DMContrato.QContrato_GPPRECO.Value*60);
      Doc.Content.Find.Execute(FindText := '%preco',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0',DMContrato.QContrato_GPQT_QUANTIDADE.Value);
      Doc.Content.Find.Execute(FindText := '%quantidade',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPDT_ENTREGA.Text;
      Doc.Content.Find.Execute(FindText := '%dt_entrega',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_VERDES_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%verdes',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_AVARIADO_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%avariados',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_IMPUREZA_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%impureza',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_UMIDADE_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%max_umidade',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_QUEBRADOS_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%max_quebrado',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPIND_TIPO_BASE.Value;
      Doc.Content.Find.Execute(FindText := '%tipo_base',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPDT_SAFRA.Value;
      Doc.Content.Find.Execute(FindText := '%dt_safra',ReplaceWith := campo,Replace:=2);
      campo:=DMProduto.QProdutoDESC_PRODUTO.Value;
      Doc.Content.Find.Execute(FindText := '%desc_produto',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDESC_CEP.Value;
      Doc.Content.Find.Execute(FindText := '%cep_cadastro',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroCOD_ESTADO.Value;
      Doc.Content.Find.Execute(FindText := '%desc_estado',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDESC_CIDADE.Value;
      Doc.Content.Find.Execute(FindText := '%desc_cidade',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDESC_INSCRICAO_MUNICIPAL.Value;
      Doc.Content.Find.Execute(FindText := '%insc_mun',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDESC_ENDERECO.Value;
      Doc.Content.Find.Execute(FindText := '%desc_endereco',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNOME.Value;
      Doc.Content.Find.Execute(FindText := '%nome',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialNUM_CGC.Value;
      Doc.Content.Find.Execute(FindText := '%cgc_filial',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPNUM_CONTRATO.Text;
      Doc.Content.Find.Execute(FindText := '%num_contrato',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialDESC_CIDADE.Value;
      Doc.Content.Find.Execute(FindText := '%cidade_filial',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialDESC_FILIAL.Value;
      Doc.Content.Find.Execute(FindText := '%desc_filial',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialCOD_ESTADO.Value;
      Doc.Content.Find.Execute(FindText := '%uf_filial',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNUM_CGC_CPF.Value;
      Doc.Content.Find.Execute(FindText := '%cgc_cpf',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNUM_INSCRICAO.Value;
      Doc.Content.Find.Execute(FindText := '%desc_inscricao',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDESC_ORGAO_EMISSOR.Value;
      Doc.Content.Find.Execute(FindText := '%desc_orgao_emissor',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroCod_Cadastro.Text;
      Doc.Content.Find.Execute(FindText := '%cod_cadastro',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPDesc_Observacao.Value;
      Doc.Content.Find.Execute(FindText := '%observacao',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPDesc_Testemunha1.Value;
      Doc.Content.Find.Execute(FindText := '%testemunha1',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPDesc_Testemunha2.Value;
      Doc.Content.Find.Execute(FindText := '%testemunha2',ReplaceWith := campo,Replace:=2);


      campo:=DMContrato.QContrato_GPnum_cpf_Testemunha1.Value;
      Doc.Content.Find.Execute(FindText := '%num_cpf_testemunha1',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPnum_cpf_Testemunha2.Value;
      Doc.Content.Find.Execute(FindText := '%num_cpf_testemunha2',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPQT_HECTARES.AsString;
      Doc.Content.Find.Execute(FindText := '%qt_hectares',ReplaceWith := campo,Replace:=2);

      campo:=DMContrato.QContrato_GPDT_VENCTO_PROMISSORIA.Text;
      if (DMParamSistema.QParamSistemaCod_Empresa.Text = 'MOINHO')then
        Doc.Content.Find.Execute(FindText := '%dt_vencto',ReplaceWith := campo,Replace:=2)
      else
        Doc.Content.Find.Execute(FindText := '%vencto_promis',ReplaceWith := campo,Replace:=2);
      campo:=Bib.extenso(DMContrato.QContrato_GPVAL_PROMISSORIA.Value,'REAL');
      Doc.Content.Find.Execute(FindText := '%val_extenso_promissoria',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPVAL_PROMISSORIA.Text;
      Doc.Content.Find.Execute(FindText := '%val_promissoria',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPdesc_cidade_entrega.Text;
      Doc.Content.Find.Execute(FindText := '%cidade_entrega',ReplaceWith := campo,Replace:=2);

      campo:=DMContrato.QContrato_GPqt_penhor.Text;
      Doc.Content.Find.Execute(FindText := '%qt_penhor',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPdesc_area_penhor.Text;
      Doc.Content.Find.Execute(FindText := '%desc_area_penhor',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPdesc_endereco_penhor.Text;
      Doc.Content.Find.Execute(FindText := '%penhor_endereco',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPdesc_matricula_penhor.Text;
      Doc.Content.Find.Execute(FindText := '%desc_matricula_penhor',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPdesc_cartorio_penhor.Text;
      Doc.Content.Find.Execute(FindText := '%desc_cartorio_penhor',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContrato_GPdesc_armazens_penhor.Text;
      Doc.Content.Find.Execute(FindText := '%desc_armazens_penhor',ReplaceWith := campo,Replace:=2);
      If DMContrato.QContrato_GPCod_Avalista.Text <> '' Then
       Begin
        DmCadastro.QCadastro.Close;
        DmCadastro.QCadastro.SetVariable('Pk',DMContrato.QContrato_GPCod_Avalista.Value);
        DmCadastro.QCadastro.Open;
        campo := DmCadastro.QCadastroNOME.Value;
        Doc.Content.Find.Execute(FindText := '%avalista',ReplaceWith := campo,Replace:=2);
        campo := DmCadastro.QCadastroDesc_Endereco.Value;
        Doc.Content.Find.Execute(FindText := '%end_avalista',ReplaceWith := campo,Replace:=2);
        campo := DmCadastro.QCadastroDesc_Cidade.Value;
        Doc.Content.Find.Execute(FindText := '%cid_avalista',ReplaceWith := campo,Replace:=2);
        campo := DmCadastro.QCadastroNum_Cgc_Cpf.Value;
        Doc.Content.Find.Execute(FindText := '%Cpf_avalista',ReplaceWith := campo,Replace:=2);
        campo := DmCadastro.QCadastroNum_Inscricao.Value;
        Doc.Content.Find.Execute(FindText := '%Identidade_avalista',ReplaceWith := campo,Replace:=2);
        campo := DmCadastro.QCadastroDesc_Orgao_Emissor.Value;
        Doc.Content.Find.Execute(FindText := '%Orgao_Emissao_Aval',ReplaceWith := campo,Replace:=2);
        campo := DmCadastro.QCadastroCod_Estado.Value;
        Doc.Content.Find.Execute(FindText := '%Uf_avalista',ReplaceWith := campo,Replace:=2);
        campo := DmCadastro.QCadastroNome_Conjuge.Value;
        Doc.Content.Find.Execute(FindText := '%Conjuge',ReplaceWith := campo,Replace:=2);
       End
      Else
       Begin
        campo:= '.';
        Doc.Content.Find.Execute(FindText := '%avalista',ReplaceWith := campo,Replace:=2);
        Doc.Content.Find.Execute(FindText := '%end_avalista',ReplaceWith := campo,Replace:=2);
        Doc.Content.Find.Execute(FindText := '%cid_avalista',ReplaceWith := campo,Replace:=2);
        Doc.Content.Find.Execute(FindText := '%Cpf_avalista',ReplaceWith := campo,Replace:=2);
        Doc.Content.Find.Execute(FindText := '%Identidade_avalista',ReplaceWith := campo,Replace:=2);
        Doc.Content.Find.Execute(FindText := '%Uf_avalista',ReplaceWith := campo,Replace:=2);
        Doc.Content.Find.Execute(FindText := '%Conjuge',ReplaceWith := campo,Replace:=2);
        Doc.Content.Find.Execute(FindText := '%Orgao_Emissor_Aval',ReplaceWith := campo,Replace:=2);
       End;
      campo := DMContrato.QContrato_GPDESC_TIPO_PRECO.Value;
      Doc.Content.Find.Execute(FindText := '%Moeda',ReplaceWith := campo,Replace:=2);
      If DMContrato.QContrato_GPDesc_Tipo_Preco.Value = 'DOLAR' Then
         campo:=', que será convertido para pagamento em moeda nacional - REAL - pela taxa média de fechamento do dólar comercial PTAX (SISBACEN) do dia útil imediatamente anterior ao dia do pagamento.'
      Else
         campo:='.';
      Doc.Content.Find.Execute(FindText := '%complemento',ReplaceWith := campo,Replace:=2);
      wTotal := (DMContrato.QContrato_GPQT_QUANTIDADE.value*DMContrato.QContrato_GPPRECO.value/DMProduto.QProdutoNUM_EMBALAGEM.Value);
      campo:=FormatFloat('#,##0.00',wTotal);
      Doc.Content.Find.Execute(FindText := '%vlr_mercadoria',ReplaceWith := campo,Replace:=2);
      wVl_Pagar := wTotal;

      wTotal := wTotal * DMContrato.QContrato_GPPERC_FUNRURAL.value / 100;
      campo:=FormatFloat('#,##0.00',wTotal);
      Doc.Content.Find.Execute(FindText := '%vlr_funrural',ReplaceWith := campo,Replace:=2);
      wVl_Pagar := wVl_Pagar - wTotal;

      wQt_DPI := DMContrato.QContrato_GPQT_QUANTIDADE.value;
      wVl_Dpi := 0;
      If (wQt_DPI > 0) And (DMProdutoAgricola.QProdutoAgricolaPERC_DPI_TRANSGENICOS.Value <> 0)  Then
         wVl_Dpi := DMContrato.QContrato_GPPRECO.value * wQt_DPI / DMProduto.QProdutoNUM_EMBALAGEM.Value * DMProdutoAgricola.QProdutoAgricolaPERC_DPI_TRANSGENICOS.Value / 100;
      campo:=FormatFloat('#,##0.00',wVl_Dpi);
      Doc.Content.Find.Execute(FindText := '%vlr_dpi',ReplaceWith := campo,Replace:=2);
      wVl_Pagar := wVl_Pagar - wVl_Dpi;
      campo:=FormatFloat('#,##0.00',wVl_Pagar);
      Doc.Content.Find.Execute(FindText := '%vlr_pagar',ReplaceWith := campo,Replace:=2);

      // Grava documento
      Doc.SaveAs(Path+'ContratoGP21.Doc');
      // Imprime
      //Doc.PrintOut(false);
      // Fecha o Word
//      WinWord.Quit;
    end
  else
    Showmessage('Erro! Não há nenhum contrato selecionado.');
end;

procedure TFContratoCad_GP.SBConfirmarClick(Sender: TObject);
var wPreco, wMenor, wMaior : Real;
  x,y:Integer;
begin
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then
   Begin
     If DbEdit21.Text = '' then
        if MessageDlg('Confirma Contrato sem Parceiro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
           Raise Exception.Create('Parceiro não Informado');
     If DMContrato.QContrato_GPCod_Operacao.Text = ''  Then
        Raise exception.Create('Informar operação para inclusão contabil');
   End;
  DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContrato_GPCOD_FILIAL.Text),'AGRICOLA');
  If DMContrato.QContrato_GPDT_PAGTO.Value < DMContrato.QContrato_GPDT_CONTRATO.Value Then
     Raise Exception.Create('Data de Pagamento Menor que Data Do Contrato');
  If DMContrato.QContrato_GPDT_ENTREGA.Value < DMContrato.QContrato_GPDT_CONTRATO.Value Then
     Raise Exception.Create('Data de Entrega Menor que Data Do Contrato');

  DMPrecoAgricola.QPrecoAgricola_Cons.Close;
  DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('Cod_Produto',Trim(MeProduto.text));
  DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('Cod_Filial',Trim(MeFilial.text));
  DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('Dt_Preco_Agricola',DMContrato.QContrato_GPDT_CONTRATO.Value);
  DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('Cod_Lote_Tipo','1');
  DMPrecoAgricola.QPrecoAgricola_Cons.Open;
  If DMPrecoAgricola.QPrecoAgricola_Cons.Eof Then
     Raise Exception.Create ('Não Foi Cadastrado Preço Produto Agricola para esta Data');
  If DMContrato.QContrato_GPDESC_TIPO_PRECO.Value = 'REAL' Then
    wPreco := DMPrecoAgricola.QPrecoAgricola_ConsVal_Preco_Gp_Real.Value
  Else
    wPreco := DMPrecoAgricola.QPrecoAgricola_ConsVal_Preco_Gp_Dolar.Value;
  If wPreco <> StrToFloat(Trim(MeValUnitario.Text)) Then
   Begin
     wMenor := wPreco - (wPreco * DMPrecoAgricola.QPrecoAgricola_ConsPerc_Abaixo_Contratos.Value / 100);
     wMaior := wPreco + (wPreco * DMPrecoAgricola.QPrecoAgricola_ConsPerc_Acima_Contratos.Value / 100);
     If (StrToFloat(Trim(MeValUnitario.Text)) < wMenor) OR
        (StrToFloat(Trim(MeValUnitario.Text)) > wMaior) Then
         Raise exception.Create('Preço Informado Está fora dos limites estabelicidos pela empresa');
   End;
  MeFilial.SetFocus;
  if DMContrato.QContrato_GP.State = dsInsert then
    x:=1
  else
    x:=0;

  DMContrato.QContrato_GPQTDE_SALDO.Value:=DMContrato.QContrato_GPQT_QUANTIDADE.Value;
  inherited;
  Try
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.RollBack;
    Raise Exception.Create('Erro Valores Inconsistentes.');
  end;
  if x=1 then
    Begin
      y:=DMContrato.QContrato_GPCOD_CONTRATO_GP.Value;
      DMContrato.QContrato_GP.Close;
      DMContrato.QContrato_GP.SetVariable('PK',Y);
      DMContrato.QContrato_GP.Open;
      GeraContasaPagar1Click(Self);
    End;
end;

procedure TFContratoCad_GP.GeraContasaPagar1Click(Sender: TObject);
Var wValor,wVal_Dpi,wQt_DPI : Real;
    wAux, wNome,wValor_Titulos,wPerc_Dpi : String;
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContrato_GPCOD_FILIAL.Text),'AGRICOLA');
  if DMContrato.QContrato_GPCOD_CONTRATO_GP.Value<>0 then
    begin
      If DMContrato.QContrato_GPInd_CP.Value=0 then
        begin
          Try
            If not(DMOracle.DBcemapa.InTransaction) then
              DMOracle.DBCemapa.StartTransaction;
            if FContrato_CP = Nil then
              FContrato_CP := TFContrato_CP.Create(Application);
            If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
             Begin
//               FContrato_Cp.MeCodFinalidade.Text := '39';
               FContrato_Cp.MeCodDepartamento.Text := '19';
               FContrato_Cp.SbDepartamento.Enabled := False;
               FContrato_Cp.MeCodDepartamento.Enabled := False;
             End;
            FContrato_CP.pTipo:='GP';
            wValor := DMContrato.QContrato_GPPRECO.value;
            If DMContrato.QContrato_GPDesc_Tipo_Preco.Value = 'DOLAR' Then
             Begin
               wAux := DMOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO','COD_MOEDA=2 AND DT_COTACAO=' + Chr(39) + DateToStr(DMContrato.QContrato_GPDt_Contrato.Value) +chr(39));
               If wAux = '' Then
                  Raise Exception.Create('Dólar Não Cadastrado - para data de hoje');
               wValor := wValor * StrToFloat(wAux);
             End;
            DMProduto.QProduto.Close;
            DMProduto.QProduto.SetVariable('PK',DMContrato.QContrato_GPCOD_Produto.Value);
            DMProduto.QProduto.Open;
            wVal_Dpi := 0;
            If DMContrato.QContrato_GPIND_BAIXA_CREDITO_MONSANTO.Value = 'SIM' Then
              If DMContrato.QContrato_GPQT_CREDITO_TRANSGENICOS.Text <> '' Then
               Begin
                 wQt_DPI := DMContrato.QContrato_GPQT_QUANTIDADE.Value - DMContrato.QContrato_GPQT_CREDITO_TRANSGENICOS.Value;
                 If wQt_DPI > 0 Then
                  Begin
                    wPerc_Dpi := DMOracle.BuscaNome('SELECT PERC_DPI_TRANSGENICOS FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO='+Trim(DMContrato.QContrato_GPCod_Produto.Text));
                    If (Trim(wPerc_Dpi) <> '') And (Trim(wPerc_Dpi) <> '0')  Then
                       wVal_Dpi := DMContrato.QContrato_GPPRECO.value * wQt_DPI / DMProduto.QprodutoNum_Embalagem.Value * StrToFloat(Trim(wPerc_Dpi)) / 100;
                       wVal_Dpi := Trunc(wVal_Dpi * 100) / 100;
                  End;
               End;
            FContrato_CP.MeValTotal.Text := FloatToStr(Trunc(((DMContrato.QContrato_GPQT_QUANTIDADE.Value/DMProduto.QprodutoNum_Embalagem.Value)*
                                                      wValor*((100-DMContrato.QContrato_GPPerc_FunRural.Value)/100) - wVal_Dpi)*100)/100);
            FContrato_CP.MEDataCP.Text := DMContrato.QContrato_GPDT_PAGTO.Text;
            FContrato_CP.MEValorCP.Text := FContrato_CP.MeValTotal.Text;
            FContrato_CP.ShowModal;
            If DMOracle.DBcemapa.InTransaction then
            begin
              DMOracle.DBcemapa.Rollback;
              Raise Exception.Create('Atenção! Este Contrato não gerou um Contas a Pagar.');
            end;
            wNome := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+DMContrato.QContrato_GPCod_Cadastro.Text);
            wValor_Titulos := DMOracle.BuscaNome('SELECT SUM(VAL_TITULO) FROM TB_CONTA_PAGAR_CAB','COD_CONTRATO_GP = '+DMContrato.QContrato_GPCod_Contrato_GP.Text);
            DMOperacao.QOperacao.Close;
            DMOperacao.QOperacao.SetVariable('Pk',DMContrato.QContrato_GPCod_Operacao.Value);
            DMOperacao.QOperacao.Open;
            If Not(DMOperacao.QOperacao.Eof) Then
            Begin
              DMPlanilha.GravaLanc('CGPRECO',
                                   DMContrato.QContrato_GPCOD_CONTRATO_GP.Value,
                                   FloatToStr(DMContrato.QContrato_GPNUM_CONTRATO.Value)+'-'+wNome,
                                   DMContrato.QContrato_GPCod_Filial.Value,
                                   DMOperacao.QOperacaoCOD_CONTABIL_CONTRATO_INC_DEB.Value,
                                   'DEBITO',
                                   DMContrato.QContrato_GPCod_Cadastro.Value,
                                   DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                                   StrToFloat(wValor_Titulos),
                                   DMContrato.QContrato_GPDt_Contrato.Value,
                                   DMOperacao.QOperacaoCOD_CONTABIL_CONTRATO_INC_CRED.Value);
              DMPlanilha.GravaLanc('CGPRECO',
                                   DMContrato.QContrato_GPCOD_CONTRATO_GP.Value,
                                   FloatToStr(DMContrato.QContrato_GPNUM_CONTRATO.Value)+'-'+wNome,
                                   DMContrato.QContrato_GPCod_Filial.Value,
                                   DMOperacao.QOperacaoCOD_CONTABIL_CONTRATO_INC_CRED.Value,
                                   'CREDITO',
                                   DMContrato.QContrato_GPCod_Cadastro.Value,
                                   DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                                   StrToFloat(wValor_Titulos),
                                   DMContrato.QContrato_GPDt_Contrato.Value,
                                   DMOperacao.QOperacaoCOD_CONTABIL_CONTRATO_INC_DEB.Value);
              DMOracle.DBcemapa.Commit;
            End;

          except
            DMOracle.DBcemapa.Rollback;
            Raise Exception.Create('Erro! Este Contrato não gerou um Contas a Pagar.');
          end;
        end
      else
        ShowMessage('Erro! Este Contrato já gerou um Contas a Pagar.');
    end
  else
    ShowMessage('Erro! Contrato em branco, Selecione um contrato.');
end;

procedure TFContratoCad_GP.VoltaContasaPagar1Click(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContrato_GPCOD_FILIAL.Text),'AGRICOLA');
  if DMContrato.QContrato_GPInd_CP.Value<>0 then
    begin
        DMOracle.DBCemapa.StartTransaction;
        Try
          with DMContrato do
            begin
              QContasPagar_GP.Close;
              QContasPagar_GP.Open;
              QContasPagarMov_GP.Close;
              QContasPagarMov_GP.Open;
              While not QContasPagar_GP.Eof do
                Begin
                  If QContasPagarMov_GPInd_Tipo_Movimento.Value <> '' Then
                    Begin
                      If (QContasPagarMov_GPInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
                        Raise Exception.Create('Conta a Pagar com baixas!')
                      Else
                        QContasPagarMov_GP.Delete;
                    End;
                  QContasPagar_GP.Delete;
                End;
              QContrato_GP.Edit;
              QContrato_GPInd_CP.Value:=0;
              QCOntrato_gp.Post;
              DMPlanilha.DesContabiliza(QContrato_GPCOD_CONTRATO_GP.Value,'CGPRECO');
              DMOracle.DBCemapa.Commit;
           end;
        Except
          DMContrato.QContasPagarMov_GP.Cancel;
          DMContrato.QContrato_GP.Cancel;
          DMOracle.DBCemapa.Rollback;
          Raise Exception.Create('Contas a Pagar C/Baixas - Não foi possível voltar Contas a Pagar!');
        End;
    end;
end;

procedure TFContratoCad_GP.SBCancelarClick(Sender: TObject);
begin
  inherited;
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;
end;

procedure TFContratoCad_GP.RelaodeContratoGarantia1Click(Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam:= TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[3].TabVisible:=True;
  FContratoParam.Me3DtBase.Text := DateToStr(Date);
  if FContratoParam.ShowModal =  mrOk then
    begin
      with DMContrato do
        begin
          DmUsuario.Checar_Filial_Usuario( Trim(FContratoParam.ME3CodFilial.Text),'AGRICOLA');
          if FRContrato_GP = Nil then
            FRContrato_GP := TFRContrato_GP.Create(Application);
          QRContrato_GP.Close;
          if Trim(FContratoParam.ME3CodFilial.text)<>'' then
            QRContrato_GP.SetVariable('COD_FILIAL',FContratoParam.ME3CodFilial.Text)
          else
            QRContrato_gp.SetVariable('COD_FILIAL',Null);

          if Trim(FContratoParam.ME3CodProduto.Text)<>'' then
            QRContrato_GP.SetVariable('COD_PRODUTO',FContratoParam.ME3CodProduto.Text)
          else
            QRContrato_GP.SetVariable('COD_PRODUTO',Null);

          if Trim(FContratoParam.ME3CodCliente.Text)<>'' then
            QRContrato_GP.SetVariable('COD_CADASTRO',FContratoParam.ME3CodCliente.Text)
          else
            QRContrato_GP.SetVariable('COD_CADASTRO',Null);

          if Trim(FContratoParam.FmCadastro3.MeCadastro.Text)<>'' then
            QRContrato_GP.SetVariable('COD_CADASTRO_PARCEIRO',FContratoParam.FmCadastro3.MeCadastro.Text)
          else
            QRContrato_GP.SetVariable('COD_CADASTRO_PARCEIRO',Null);
          if Trim(FContratoParam.FmCidade3.MeCidade.Text)<>'' then
            QRContrato_GP.SetVariable('COD_CIDADE_ENTREGA',FContratoParam.FmCidade3.MeCidade.Text)
          else
            QRContrato_GP.SetVariable('COD_CIDADE_ENTREGA',Null);

          if Trim(FContratoParam.ME3CodVendedor.Text)<>'' then
            QRContrato_GP.SetVariable('COD_VENDEDOR',FContratoParam.ME3CodVendedor.Text)
          else
            QRContrato_GP.SetVariable('COD_VENDEDOR',Null);
          if Trim(FContratoParam.ME3DtInicial.Text) <> '' then
           Begin
            FRContrato_GP.QRLPeriodo.Caption := 'Data Entrega:'+FContratoParam.ME3DtInicial.Text + ' Ate ' + FContratoParam.ME3DtFinal.Text;
            QRContrato_GP.SetVariable('DT_INICIAL',StrToDate(FContratoParam.ME3DtInicial.Text));
           End
          else
            QRContrato_GP.SetVariable('DT_INICIAL',Null);
          if Trim(FContratoParam.ME3DtFinal.Text) <> '' then
            QRContrato_GP.SetVariable('DT_FINAL',StrToDate(FContratoParam.ME3DtFinal.Text))
          else
            QRContrato_GP.SetVariable('DT_FINAL',Null);

          if Trim(FContratoParam.Me3DtContrato_Inic.Text) <> '' then
           Begin
            FRContrato_GP.QRLPeriodo.Caption := 'Data Emissão:'+FContratoParam.ME3DtContrato_Inic.Text + ' Ate ' + FContratoParam.ME3DtContrato_Fim.Text;
            QRContrato_GP.SetVariable('DT_CONTRATO_INICIAL',StrToDate(FContratoParam.Me3DtContrato_Inic.Text));
           End
          else
            QRContrato_GP.SetVariable('DT_CONTRATO_INICIAL',Null);
          if Trim(FContratoParam.Me3DtContrato_Fim.Text) <> '' then
            QRContrato_GP.SetVariable('DT_CONTRATO_FINAL',StrToDate(FContratoParam.Me3DtContrato_Fim.Text))
          else
            QRContrato_GP.SetVariable('DT_CONTRATO_FINAL',Null);
          if Trim(FContratoParam.Me3DtPagto_Inic.Text) <> '' then
           Begin
            FRContrato_GP.QRLPeriodo.Caption := 'Data Pagamento:'+FContratoParam.Me3DtPagto_Inic.Text + ' Ate ' + FContratoParam.Me3DtPagto_Fim.Text;
            QRContrato_GP.SetVariable('DT_PAGTO_INICIAL',StrToDate(FContratoParam.Me3DtPagto_Inic.Text));
           End
          else
            QRContrato_GP.SetVariable('DT_PAGTO_INICIAL',Null);
          if Trim(FContratoParam.Me3DtPagto_Fim.Text) <> '' then
            QRContrato_GP.SetVariable('DT_PAGTO_FINAL',StrToDate(FContratoParam.Me3DtPagto_Fim.Text))
          else
            QRContrato_GP.SetVariable('DT_PAGTO_FINAL',Null);
          Case FContratoParam.RG3Situacao.ItemIndex of
             0:QRContrato_GP.SetVariable('IND_SITUACAO','ABERTO');
             1:QRContrato_GP.SetVariable('IND_SITUACAO','FECHADO');
             2:QRContrato_GP.SetVariable('IND_SITUACAO','N.CUMPRIDO');
             3:QRContrato_GP.SetVariable('IND_SITUACAO',Null);
          end;
          Case FContratoParam.RG3TipoPreco.ItemIndex of
             0:QRContrato_GP.SetVariable('DESC_TIPO_PRECO','REAL');
             1:QRContrato_GP.SetVariable('DESC_TIPO_PRECO','DOLAR');
             2:QRContrato_GP.SetVariable('DESC_TIPO_PRECO',Null);
          end;
          Case FContratoParam.Rg3Tipo.ItemIndex of
             0:QRContrato_GP.SetVariable('IND_RETIRAR_ENTREGUE','ENTREGUE');
             1:QRContrato_GP.SetVariable('IND_RETIRAR_ENTREGUE','RETIRAR');
             2:QRContrato_GP.SetVariable('IND_RETIRAR_ENTREGUE',Null);
           end;  

          QRContrato_GP.SQL[QRContrato_GP.SQL.Count - 1] := '';
          Case FContratoParam.RG3Ordem.ItemIndex of
            0 : QRContrato_GP.SQL.Add(' TB_CONTRATO_GP.COD_FILIAL, TB_CADASTRO.NOME');
            1 : QRContrato_GP.SQL.Add(' TB_CONTRATO_GP.COD_FILIAL, TB_CONTRATO_GP.NUM_CONTRATO');
          End;
          wDtBase_Contrato := StrToDate(FContratoParam.Me3DtBase.Text);  // passado para variavel para nao usar o formulario de parametros no data modulo
          QRContrato_GP.Open;
          FRContrato_GP.QRLTitulo.Caption := 'Contrato Garantia de Preco - ';
          Case FContratoParam.RG3TipoPreco.ItemIndex of
             0:FRContrato_GP.QRLTitulo.Caption := 'Contrato Garantia de Preco - em Real ';
             1:FRContrato_GP.QRLTitulo.Caption := 'Contrato Garantia de Preco - em Dolar ';
             2:FRContrato_GP.QRLTitulo.Caption := 'Contrato Garantia de Preco - Real e Dolar ';
          End;
          FRContrato_GP.QRLVendedor.Caption := 'Vendedor:'+FContratoParam.ME3Vendedor.Text;
          if FContratoParam.RGPreview.ItemIndex = 0 then
            FRContrato_GP.QRPrimario.Preview
          else
            FRContrato_GP.QRPrimario.Print;
          QRContrato_GP.Close;
        end;
    end;
end;

Procedure TFContratoCad_GP.BaixaContrato1Click(Sender: TObject);
var wTotalMov, wBaixa,wPreco :Real;
    wNumAcerto,wNumRecibo, wOperacao : Integer;
    wVal : String;
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam := TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[5].TabVisible:=True;
  if FContratoParam.ShowModal = mrOK then
  begin
    If Trim(FContratoParam.Me5DtPagto.Text) <> '' Then
      If StrToDate(FContratoParam.Me5DtPagto.Text) < Date Then
         Raise exception.Create('Data de pagamento menor que data atual');
    Try
      with DMContrato do
      begin
        if Trim(FContratoParam.ME5CodContrato.text) <> '' then
        begin
          QContrato_GP.Close;
          QContrato_GP.SetVariable('PK',Trim(FContratoParam.ME5CodContrato.text));
          QContrato_GP.Open;
          If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
             If QContrato_GPInd_Liberado.Value = 'NAO' Then
                Raise Exception.Create('Contrato não liberado para fechamento - Falar com gerência');
{          If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then  foi conversado com o Vilson para retirar dia 12/12/2008 - César
          Begin
            QContasPagar_GP.Close;
            QContasPagar_GP.Open;
            QContasPagarMov_GP.Close;
            QContasPagarMov_GP.Open;
            QContrato_GP.Edit;
            QContrato_GPInd_CP.Value := 0;
            QCOntrato_gp.Post;

            While not QContasPagar_GP.Eof do
            Begin
              If QContasPagarMov_GPInd_Tipo_Movimento.Value <> '' Then
              Begin
                If (QContasPagarMov_GPInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
                  Raise Exception.Create('Conta a Pagar com baixas!')
                Else
                  QContasPagarMov_GP.Delete;
              End;
              QContasPagar_GP.Delete;
            End;
          End;   }
          DMProduto.QProduto.Close;
          DMProduto.QProduto.SetVariable('PK',QContrato_GPCod_Produto.Value);
          DMProduto.QProduto.Open;
          DMRomaneioAgricola.QRomConsFixar.Close;
          DMRomaneioAgricola.QRomConsFixar.SetVariable('CADASTRO',Trim(FContratoParam.Me5CodCliente.text));
          DMRomaneioAgricola.QRomConsFixar.SetVariable('PRODUTO',QContrato_GPCOD_PRODUTO.Value);
          DMRomaneioAgricola.QRomConsFixar.SetVariable('FILIAL',QContrato_GPCOD_FILIAL.Value);
//          DMRomaneioAgricola.QRomConsFixar.SetVariable('DATAI',StrToDate('01/01/1999'));
//          DMRomaneioAgricola.QRomConsFixar.SetVariable('DATAF',Date);
          DMRomaneioAgricola.QRomConsFixar.SetVariable('TIPO_FIXAR','EMPRESA');
          If Trim(FContratoParam.Me5Parceiro.text) <> '' Then
             DMRomaneioAgricola.QRomConsFixar.setVariable('COD_PARCEIRO',Trim(FContratoParam.Me5Parceiro.Text))
          Else
             DMRomaneioAgricola.QRomConsFixar.setVariable('COD_PARCEIRO',Null);
          DMRomaneioAgricola.QRomConsFixar.Open;
          QContratoGP_Mov.Open;
          QContratoGP_Mov.First;
          wTotalMov:=0;
          While not(QContratoGP_Mov.Eof) do
          Begin
            wTotalMov:=wTotalMov + QContratoGP_MovQT_Quantidade.value;
            QContratoGP_Mov.Next;
          End;
          If FContratoParam.Me5Quantidade.Text <> '' Then
          Begin
            If (StrToFloat(FContratoParam.Me5Quantidade.Text) + wTotalMov) > QContrato_GPQT_Quantidade.Value Then
              Raise Exception.Create('Quantidade Informada Maior que Saldo em aberto');
            wTotalMov := StrToFloat(FContratoParam.Me5Quantidade.Text);
          End
          Else
            wTotalMov := QContrato_GPQT_Quantidade.Value - wTotalMov;
          If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' Then
            If (QContrato_GPIND_BAIXA_CREDITO_MONSANTO.Value = 'NAO') And (Trim(FContratoParam.Me5PercDPI.Text) <> '0') Then
             Begin
               If Trim(FContratoParam.Me5Quantidade.Text) <> '' Then
                Begin
                 If StrToFloat(Trim(FContratoParam.Me5Quantidade.Text)) > StrToFloat(Trim(FContratoParam.Me5QtCredito.Text)) Then
                    Raise Exception.Create ('Quantidade crédito MONSANTO deve ser igual a quantidade da baixa');
                End
               Else
                 If wTotalMov > StrToFloat(Trim(FContratoParam.Me5QtCredito.Text)) Then
                    Raise Exception.Create ('Quantidade crédito MONSATO deve ser igual a quantidade da baixa');
             End;
          If (DMRomaneioAgricola.QRomConsFixarSaldo_Fixar.Value > 0) and (wTotalMov > 0) then
          begin
            if DMRomaneioAgricola.QRomConsFixarSaldo_Fixar.Value >= wTotalMov  then
              wBaixa:= wTotalMov
            else
              wBaixa:= DMRomaneioAgricola.QRomConsFixarSaldo_Fixar.Value;
            with DMNotaEntrada do
            begin
              PContabiliza_Extra := 'N';
              QNotaEntrada.Open;
              QItemNF.Open;
              wOperacao := StrToInt('0'+DMOracle.BuscaNome('SELECT COD_OPERACAO_DEVOLUCAO FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO = '+FloatToStr(QContrato_GPCOD_PRODUTO.Value)));
              wPreco := StrToFloat('0'+DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QContrato_GPCOD_PRODUTO.Value)));

              If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' Then
                 Gera_NF_Contrato_GP(wOperacao,wPreco,wBaixa,'');

              If QContrato_GPDESC_TIPO_PRECO.Value = 'REAL' Then
                 wOperacao := StrToInt(DMOracle.BuscaNome('SELECT COD_OPERACAO_FIXACAO_CONTRATO FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO = '+FloatToStr(QContrato_GPCOD_PRODUTO.Value)))
              Else
                 wOperacao := StrToInt(DMOracle.BuscaNome('SELECT COD_OPERACAO_FIXACAO_GP_US FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO = '+FloatToStr(QContrato_GPCOD_PRODUTO.Value)));
              Gera_NF_Contrato_GP(wOperacao,StrToFloat(FContratoParam.Me5Preco.Text),wBaixa,DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Text);

//            Rotina para verificar se todo o contrato foi baixado 'fechar contrato'
              QContratoGP_Mov.Close;
              QContratoGP_Mov.Open;
              QContratoGP_Mov.First;
              wTotalMov := 0;

              while not(QContratoGP_Mov.Eof) do
              Begin
                wTotalMov := wTotalMov + QContratoGP_MovQT_Quantidade.value;
                QContratoGP_Mov.Next;
              End;

              If wTotalMov = QContrato_GPQT_Quantidade.Value Then
              Begin
                QContrato_GP.Edit;
                QContrato_GPIND_SITUACAO.Value := 'FECHADO';
                QContrato_GP.Post;
              End;
              If FContratoParam.Me5ValorDesconto.Text = '' Then
                 FContratoParam.Me5ValorDesconto.Text := '0';
//              If (FContratoParam.Me5ValorDesconto.Text <> '') Or (FContratoParam.Me5ValorDesconto.Text <> '0') then
//              begin
                wVal := DMOracle.BuscaNome('SELECT SQPAGAMENTO_FIXACAO.NEXTVAL FROM DUAL','1=1');
                wNumAcerto := DMSequencia.Sequencia(StrToInt(Trim(MEFilial.text)),'ACERTO');
                wNumRecibo := DMSequencia.Sequencia(StrToInt(Trim(MEFilial.text)),'RECIBO');
                wVal := DMOracle.BuscaNome('SELECT SQPAGAMENTO_FIXACAO.NEXTVAL FROM DUAL','1=1');
                DMOracle.QExecSQL.Close;
                DMOracle.QExecSQL.SQL.Clear;
                DMOracle.QExecSQL.SQL.Add('INSERT INTO TB_PAGAMENTO_FIXACAO (');
                DMOracle.QExecSQL.SQL.Add('  COD_PAGAMENTO_FIXACAO, ');
                DMOracle.QExecSQL.SQL.Add('  VAL_PAGAMENTO_FIXACAO, ');
                DMOracle.QExecSQL.SQL.Add('  DESC_PAGAMENTO_FIXACAO, ');
                DMOracle.QExecSQL.SQL.Add('  DESC_OBSERVACAO, ');
                DMOracle.QExecSQL.SQL.Add('  DT_PAGAMENTO_FIXACAO, ');
                DMOracle.QExecSQL.SQL.Add('  COD_NOTA_CAB, NUM_RECIBO,NUM_ACERTO, COD_USUARIO, ');
                DMOracle.QExecSQL.SQL.Add('  DESC_CONTA_CORRENTE) ');
                DMOracle.QExecSQL.SQL.Add('VALUES (');
                DMOracle.QExecSQL.SQL.Add(   wVal + ', ');
                DMOracle.QExecSQL.SQL.Add('  TO_NUMBER(''' + FContratoParam.Me5ValorDesconto.Text + '''),  ');
                DMOracle.QExecSQL.SQL.Add('  ''' + FContratoParam.Ed5ObsDesconto.Text + ''', ' );
                DMOracle.QExecSQL.SQL.Add('  ''' + FContratoParam.Ed5Observacao.Text + ''', ' );
                DMOracle.QExecSQL.SQL.Add('  ''' + FContratoParam.Me5DtPagto.Text + ''', ' );
                DMOracle.QExecSQL.SQL.Add(   QNotaEntradaCOD_NOTA_CAB.Text + ',' + IntToStr(wNumRecibo) + ',' + IntToStr(wNumAcerto) + ',' + IntToStr(DMUsuario.CodUsuarioCorrente) + ',');
                DMOracle.QExecSQL.SQL.Add('  ''' +  FContratoParam.Me5ContaCorrente.Text + ''' ' + ')');
                DMOracle.QExecSQL.ExecSQL;
//              End;
              Try
                If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' Then
                Begin
                  DMNotaEntrada.QNotaEntrada.AutoCalcFields  := False;
                  DMNotaEntrada.QItemNF.AutoCalcFields       := False;
                  DMNotaEntrada.QSomaItemNota.AutoCalcFields := False;
                  DMNotaEntrada.QItemNF.DisableControls;

                  If DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '2' Then
                    Raise Exception.Create('Nota Fiscal já confirmada!');
                  If DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '3' Then
                    Raise Exception.Create('Não é possível confirmar uma Nota Fiscal Cancelada!');

                  DMNotaEntrada.pOperacaoInterna := 3;

                  If FNotaEntrada_Confirma = Nil then
                    FNotaEntrada_Confirma := TFNotaEntrada_Confirma.Create(Application);
                  FNotaEntrada_Confirma.pContrato := True;
                  FNotaEntrada_Confirma.ShowModal;

                  DMNotaEntrada.pOperacaoInterna             := 0;
                  DMNotaEntrada.QNotaEntrada.AutoCalcFields  := True;
                  DMNotaEntrada.QItemNF.AutoCalcFields       := True;
                  DMNotaEntrada.QSomaItemNota.AutoCalcFields := True;
                  DMNotaEntrada.QItemNF.EnableControls;
                End
                Else
                  DMNotaEntrada.QNotaEntrada.Post;
                if DMOracle.DBCemapa.InTransaction then
                  DMOracle.DBCemapa.Commit;
                close;
                DMFilial.QFilial.Close;
                DMFilial.QFilial.SetVariable('PK',QContrato_GPCOD_FILIAL.Value);
                DMFilial.QFilial.Open;

                if FReciboFixar = nil then
                  FReciboFixar := TFReciboFixar.Create(Application);

                FReciboFixar.pCodCadastro           := StrToInt(Trim(FContratoParam.Me5CodCliente.text));
                FReciboFixar.pCodFilial             := QContrato_GPCOD_FILIAL.Value;
                FReciboFixar.QRLProduto.Caption     := DMProduto.QProdutoDESC_PRODUTO.Text;
                FReciboFixar.QRLValOutros.Caption   := FormatFloat('#,##0.00', StrToFloat(Trim(FContratoParam.Me5ValorDesconto.text)));
                FReciboFixar.QRLNumero.Caption      := IntToStr(wNumAcerto);
                FReciboFixar.QRLDtPagto.Caption     := FContratoParam.Me5DtPagto.Text;
                FReciboFixar.QRLObservacao.Caption  := FContratoParam.Ed5Observacao.Text;
                FReciboFixar.QRLContaCorrente.Caption:=FContratoParam.Me5ContaCorrente.Text;
                FReciboFixar.QRLDataExtenso.Caption := DMFilial.QFilialDESC_CIDADE.text+FormatDateTime('"," dd "de" mmmm "de" yyyy"."',Date);
                FReciboFixar.QRLOutros.Caption      := Trim(FContratoParam.Ed5ObsDesconto.Text);
                if FRReciboNFA = Nil then
                  FRReciboNFA:=TFRReciboNFA.Create(Application);
                FRReciboNFA.pCodCadastro            := StrToInt(Trim(FContratoParam.Me5CodCliente.text));
                FRReciboNFA.QRLDt_Recibo.Caption    := FContratoParam.Me5DtPagto.Text;
                FRReciboNFA.pCodFilial              := QContrato_GPCOD_FILIAL.Value;
                FRReciboNFA.QRLValorExtenso.Caption := bib.extenso(DmNotaEntrada.QItemNFVAL_TOTAL.value - DmNotaEntrada.QNotaEntradaVAL_FUNRURAL.value - QNotaEntradaVAL_DESCONTO_FITAS.Value - QItemNFVAL_DPI_TRANSGENICOS.value - QItemNFVal_Facs.Value - QItemNfVal_Fethab.Value,'REAL');
                FRReciboNFA.QRLValor.Caption        := FormatFloat('#,##0.00',(DmNotaEntrada.QItemNFVAL_TOTAL.value - DmNotaEntrada.QNotaEntradaVAL_FUNRURAL.value - QNotaEntradaVAL_DESCONTO_FITAS.Value - QItemNFVAL_DPI_TRANSGENICOS.value - QItemNFVal_Facs.Value - QItemNfVal_Fethab.Value));
                FRReciboNFA.QRLData.Caption         := DMFilial.QFilialDESC_CIDADE.text+FormatDateTime('"," dd "de" mmmm "de" yyyy"."',StrToDate(FContratoParam.Me5DtPagto.Text));
                FRReciboNFA.QRLNRRECIBO.Caption     := IntToStr(wNumRecibo);
                FRReciboNFA.QRLComplemento.Caption  := 'Referente a Venda de '+FloatToStr(wBaixa)+' Kgs de ' +Trim(DMProduto.QProdutoDesc_Produto.Text);
                FRReciboNFA.QRLUsuario.Caption   := 'Usuário:'+DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO','COD_USUARIO = '+IntToStr(DMUsuario.CodUsuarioCorrente),True);
                QRCompositeReport1.Preview;
                ShowMessage('Geração de Nota e Movimento efetuado com sucesso.');
              Except
                DMNotaEntrada.QNotaEntrada.EnableControls;
                DMNotaEntrada.QItemNF.EnableControls;
                DMNotaEntrada.QNotaEntrada.Cancel;
                DMNotaEntrada.QItemNF.Cancel;
                DMContrato.QContratoGP_Mov.Cancel;
                if DMOracle.DBCemapa.InTransaction then
                  DMOracle.DBCemapa.Rollback;
                Raise exception.Create('Erro ! Não foi possível gerar a nota ou o movimento do contrato.');
              End;
            End;
          End
          else
          Begin
            QContrato_GP.Cancel;
            DMNotaEntrada.QNotaEntrada.Cancel;
            DMNotaEntrada.QItemNF.Cancel;
            DMContrato.QContratoGP_Mov.Cancel;
            If DMOracle.DBCemapa.InTransaction then
               DMOracle.DBCemapa.Rollback;
            ShowMessage('Não há saldo a fixar para este Cliente / Produto.');
          End;
        End;
      End;
    except
      DMNotaEntrada.QNotaEntrada.Cancel;
      DMNotaEntrada.QItemNF.Cancel;
      DMContrato.QContratoGP_Mov.Cancel;
      if DMOracle.DBCemapa.InTransaction then
        DMOracle.DBCemapa.Rollback;
      Raise;
    End;
  End;
  SBRefreshClick(Self);
end;


procedure TFContratoCad_GP.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DsInsert,DsEdit] then
    begin
      BTFilial.Enabled:=true;
      BTCliente.Enabled:=True;
      BtProduto.Enabled:=True;
      BtCadastroParceiro.Enabled:=True;
      BtAvalista.Enabled:=True;
      BTExcluiLanc.Enabled:=False;
      BTExcluiCV.Enabled:=False;
      BTGeraCV.Enabled:=False;
      btTestemunha1.enabled:=true;
      btTestemunha2.enabled:=true;
      SBCidadeEntrega.Enabled:=True;
      BtOperacao.enabled:=true;
    end
  else
    begin
      BTFilial.Enabled:=False;
      BTCliente.Enabled:=False;
      BtProduto.Enabled:=False;
      BtCadastroParceiro.Enabled:=False;
      BtAvalista.Enabled:=False;
      BTExcluiLanc.Enabled:=True;
      BTExcluiCV.Enabled:=True;
      BTGeraCV.Enabled:=True;
      btTestemunha1.enabled:=false;
      btTestemunha2.enabled:=false;
      SBCidadeEntrega.Enabled:=False;
      BtOperacao.enabled:=false;
    end;
end;

procedure TFContratoCad_GP.BTExcluiLancClick(Sender: TObject);
var
  x:string;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContrato_GPCOD_FILIAL.Text),'AGRICOLA');
  If DMContrato.QContratoGP_MovCOD_CONTRATO_GP_MOV.Value = 0 then
    ShowMessage('Não existem Movimentos a serem excluídos.')
  else
    begin
      Try
        DMOracle.DBCemapa.StartTransaction;
        x := DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_CAB','COD_CONTRATO_GP_MOV = '+FloatToStr(DMContrato.QContratoGP_MovCod_Contrato_GP_Mov.value));
        if x <> '' then
          begin
            DMNotaEntrada.pContratoAgricola:=true;
            DMNotaEntrada.QNotaEntrada.Close;
            DMNotaEntrada.QNotaEntrada.SetVariable('PK',StrToInt(x));
            DMNotaEntrada.QNotaEntrada.Open;
            If DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaEntrada.QNotaEntradaDt_Recebimento.Value Then
               Raise Exception.Create('Não é Permitido Voltar Confirmação - Período Contábil');
            DMNotaEntrada.QItemNF.Open;
            DMNotaEntrada.VoltaConfirmacao(DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value,'N', '1');
            DMNotaEntrada.QNotaEntrada.Edit;
            DMNotaEntrada.QItemNF.First;
            while not(DMNotaEntrada.QItemNF.Eof) do
              DMNotaEntrada.QItemNF.Delete;

            DMOracle.QExecSQL.Close;
            DMOracle.QExecSQL.SQL.Clear;
            DMOracle.QExecSQL.SQL.Add('DELETE FROM TB_PAGAMENTO_FIXACAO ');
            DMOracle.QExecSQL.SQL.Add('  WHERE COD_NOTA_CAB = ' + DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.Text);
            DMOracle.QExecSQL.ExecSQL;

            DMNotaEntrada.QNotaEntrada.Delete;
          end;
        DMContrato.QContrato_GP.Edit;
        If DMContrato.QContratoGP_MovQT_QUANTIDADE.Value < 0 Then
           DMContrato.QContrato_GPQT_AJUSTE.Value:=0;
        DMContrato.QContrato_GPIND_SITUACAO.Value:='ABERTO';
        DMContrato.QContrato_GP.Post;
        DMContrato.QContratoGP_Mov.Delete;
        DMOracle.DBCemapa.Commit;
        DMNotaEntrada.pContratoAgricola:=False;
        ShowMessage('Exclusão de Movimentos efetuada com sucesso.');
      except
          DMOracle.DBCemapa.RollBack;
          DMNotaEntrada.pContratoAgricola:=False;
        Raise;
      end;
    end;
end;

procedure TFContratoCad_GP.ChamaGeraMov(Origem, Docto: String);
var
  SaldoAplicar, Valor, Embalagem,wPreco :Real;
  wClasse,wSubClasse,wCodClasse : Integer;
  wDolar : String;
begin
  inherited;
  with DMContrato do
    begin
      QContratoMovVend_Mov_GP.Open;
      if (QContrato_GPQtde_Saldo.Value > 0) Or (Docto = 'CGP1') then
        Begin
          If QContrato_GPQtde_Saldo.Value > 0 Then //(Docto = 'CGP') Then
           Begin
             SaldoAplicar:=QContrato_GPQtde_Saldo.Value;
             SaldoAplicar :=Trunc(SaldoAplicar*100)/100;
             Embalagem:=StrToFloat(DMOracle.Buscanome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+QContrato_GPCod_produto.text));
             If QContrato_GPDesc_Tipo_Preco.Value = 'REAL' Then
                wPreco := QContrato_GPPRECO.Value
             Else
               Begin
                wDolar := DmOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO','COD_MOEDA = 2 AND DT_COTACAO = ' + chr(39) + DateToStr(Date) + chr(39));
                If wDolar = '' Then
                   Raise Exception.Create ('Dolar Não Cadastrado Para Esta Data');
                wPreco := QContrato_GPPreco.Value * StrToFloat(wDolar);
               End;
             Valor := SaldoAplicar*wPreco/Embalagem;
           End
          Else
            Begin  // vai localizar um valor negativo nos movimentos que representa o ajuste contabil
              QContratoGP_Mov.Close;
              QContratoGP_Mov.Open;
              QContratoGP_Mov.First;
              While not(QContratoGP_Mov.Eof) Do
               Begin
                 If (QContratoGP_MovQt_Quantidade.Value < 0) And (QContratoGP_MovInd_Aplicado_Ajuste.Value = 'NAO') Then
                  Begin
                    SaldoAplicar:=QContratoGP_MovQt_Quantidade.Value;
                    Valor := QContratoGP_MovVal_Movimento.Value;
                    Break;
                  End;
                 QContratoGP_Mov.Next;
               End;
            End;
          wCodClasse:=StrToInt(DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_PRODUTO','COD_PRODUTO = '+QContrato_GPCod_produto.text));
          wClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_CLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
          wSubClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_SUBCLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
          MontaSql(wClasse,wSubClasse,0,2,'','','','','','','',4);
          if QContrato_VendConsCOD_CONTRATO_VEND.Value <> 0 then
            begin
              if FGeraMovCVenda = nil then
                FGeraMovCVenda := TFGeraMovCVenda.Create(Application);
              if not(DMOracle.DBCemapa.inTransaction) then
                DMOracle.DBCemapa.StartTransaction;
              FGeraMovCVenda.LQuantidade.caption:=FormatFloat('#,##0',SaldoAplicar);
              FGeraMovCVenda.LValor.caption:=FormatFloat('#,##0.00',Valor);
              FGeraMovCVenda.pValor:=Valor;
              FGeraMovCVenda.pQtde:=SaldoAplicar;
              FGeraMovCVenda.MeBaixa.Text:=FloatToStr(SaldoAplicar);
              FGeraMovCVenda.pOrigem:=Origem;
              FGeraMovCVenda.pDocumento := Docto;
              FGeraMovCVenda.ShowModal;
            end
          else
            ShowMessage('Não existem Contratos de Venda Abertos para este Produto e Filial');
        end
      else
        ShowMessage('Não há mais saldo a aplicar neste movimento');
      QContratoMovVend_Mov_GP.Close;
      QContrato_VendCons.Close;
    end;
end;

procedure TFContratoCad_GP.BTGeraCVClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContrato_GPCOD_FILIAL.Text),'AGRICOLA');
  If DMContrato.QContrato_GPQTDE_Saldo.Value > 0 Then
     ChamaGeraMov('Vend','CGP');
  If DMContrato.QContratoGP_MovQT_Quantidade.Value <> 0 Then
     ChamaGeraMov('Vend','CGP1');
End;

procedure TFContratoCad_GP.BTExcluiCVClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContrato_GPCOD_FILIAL.Text),'AGRICOLA');
  if FExcluiMovVend_GP=nil then
    FExcluiMovVend_GP := TFExcluiMovVend_GP.Create(Application);
  FExcluiMovVend_GP.ShowModal;
End;

procedure TFContratoCad_GP.N2Click(Sender: TObject);
begin
  inherited;
  if FBaixaMovGP = nil then
    FBaixaMovGP := TFBaixaMovGP.Create(Application);
  DMOracle.DBCemapa.StartTransaction;
  FBaixaMovGp.ShowModal;
  DMContrato.QContrato_Vend.Close;
  DMContrato.QContrato_Vend.Open;
  SBRefreshClick(Self);
end;

procedure TFContratoCad_GP.Contratoscomsaldosemaberto1Click(
  Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam:= TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[7].TabVisible:=True;
  if FContratoParam.ShowModal =  mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContratoParam.ME7CodFilial.Text),'AGRICOLA');
      with DMContrato do
        begin
          QRContratoGP_Aberto.Close;
          if Trim(FContratoParam.ME7CodFilial.Text)<>'' then
            QRContratoGP_Aberto.SetVariable('COD_FILIAL',FContratoParam.ME7CodFilial.text)
          else
            QRContratoGP_Aberto.SetVariable('COD_FILIAL',Null);

          if Trim(FContratoParam.ME7CodCliente.text)<>'' then
            QRContratoGP_Aberto.SetVariable('COD_CADASTRO',FContratoParam.ME7CodCliente.text)
          else
            QRContratoGP_Aberto.SetVariable('COD_CADASTRO',Null);
          if Trim(FContratoParam.Me7CodProduto.text)<>'' then
            QRContratoGP_Aberto.SetVariable('COD_PRODUTO',FContratoParam.ME7CodProduto.text)
          else
            QRContratoGP_Aberto.SetVariable('COD_PRODUTO',Null);
          if Trim(FContratoParam.Me7DtInicial.text)<>'' then
            QRContratoGP_Aberto.SetVariable('DT_CONTRATO_INIC',FContratoParam.Me7DtInicial.text)
          else
            QRContratoGP_Aberto.SetVariable('DT_CONTRATO_INIC',Null);
          if Trim(FContratoParam.Me7DtFinal.text)<>'' then
            QRContratoGP_Aberto.SetVariable('DT_CONTRATO_FIM',FContratoParam.Me7DtFinal.text)
          else
            QRContratoGP_Aberto.SetVariable('DT_CONTRATO_FIM',Null);
          Case FContratoParam.RG7TipoPreco.ItemIndex of
             0:QRContratoGP_Aberto.SetVariable('DESC_TIPO_PRECO','REAL');
             1:QRContratoGP_Aberto.SetVariable('DESC_TIPO_PRECO','DOLAR');
             2:QRContratoGP_Aberto.SetVariable('DESC_TIPO_PRECO',Null);
          end;

          if FContratoParam.RG7Ordem.ItemIndex = 0 then
            QRContratoGP_Aberto.SetVariable('ORDER_BY','NOME');
          if FContratoParam.RG7Ordem.ItemIndex = 1 then
            QRContratoGP_Aberto.SetVariable('ORDER_BY','NUM_CONTRATO');

          QRContratoGP_Aberto.Open;
          if FRContratoGP_Aberto = nil then
            FRContratoGP_Aberto := TFRContratoGP_Aberto.Create(Application);
          Case FContratoParam.RG7TipoPreco.ItemIndex of
             0:FRContratoGP_Aberto.QRLTitulo.Caption := 'Contrato Garantia de Preço (Posição Comprada) - em Real  ';
             1:FRContratoGP_Aberto.QRLTitulo.Caption := 'Contrato Garantia de Preço (Posição Comprada) - em Dolar ';
             2:FRContratoGP_Aberto.QRLTitulo.Caption := 'Contrato Garantia de Preço (Posição Comprada) - Real e Dolar ';
          end;
          if FContratoParam.RGPreview.ItemIndex = 0 then
            FRContratoGP_Aberto.QRPrimario.Preview
          else
            FRContratoGP_Aberto.QRPrimario.Print;
          QRContratoGP_Aberto.Close;
        end;
    end;
end;

procedure TFContratoCad_GP.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (35);
end;

procedure TFContratoCad_GP.SBExcluirClick(Sender: TObject);
Var wCodigo : String;
begin
 {inherited;}
  wCodigo := DMOracle.BuscaNome('SELECT COD_CONTRATO_GP_MOV FROM TB_CONTRATO_VEND_MOV','COD_CONTRATO_GP_MOV=' +IntToStr(DMContrato.QContrato_GPCOD_CONTRATO_GP.VALUE));
  If wCodigo <> '' Then
     Raise Exception.Create('Para Excluir Voltar Movimento do Contrato');
  wCodigo := DMOracle.BuscaNome('SELECT COD_CONTRATO_GP FROM TB_CONTA_PAGAR_CAB','COD_CONTRATO_GP=' +IntToStr(DMContrato.QContrato_GPCOD_CONTRATO_GP.VALUE));
  If wCodigo <> '' Then
     Raise Exception.Create('Para Excluir Voltar Movimento do Contas a Pagar');
  if not DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.StartTransaction;
  try
    DSPrimario.DataSet.Delete;
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    raise exception.Create('Erro na tentativa de excluir registro-CONTRATO!');
  end;
end;

procedure TFContratoCad_GP.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FReciboFixar.QuickRep1);
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
    QRCompositeReport1.Reports.Add(FRReciboAB.QuickRep1)
  Else
    QRCompositeReport1.Reports.Add(FRReciboNFA.QuickRep1);
  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('PK',FReciboFixar.pCodCadastro);
  DMCadastro.QCadastro.Open;
  FReciboFixar.QRLEmpresa.Caption := 'EMPRESA: '+DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
  FReciboFixar.QRLEndereco.Caption := 'ENDEREÇO: '+DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
  FReciboFixar.QRLCep_Cidade_UF.Caption := 'CEP: '+DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_CEP||'+#39+' '+#39+'||TB_FILIAL.DESC_CIDADE||'+#39+' '+#39+'||TB_FILIAL.COD_ESTADO FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
  FReciboFixar.QRLTelefone.Caption := 'TELEFONE: '+DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_TELEFONE FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));

end;

procedure TFContratoCad_GP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMContrato.QContrato_GP.Close;
  DMContrato.QContratoGP_Mov.Close;
  DMContrato.QContratoGP_Doc.Close;
  Action := CaFree;
  FContratoCad_GP := Nil;
end;

procedure TFContratoCad_GP.SBAlterarClick(Sender: TObject);
Var wCodigo : String;
begin
  wCodigo := DMOracle.BuscaNome('SELECT COD_CONTRATO_GP_MOV FROM TB_CONTRATO_VEND_MOV','COD_CONTRATO_GP_MOV=' +IntToStr(DMContrato.QContrato_GPCOD_CONTRATO_GP.VALUE));
  If (wCodigo <> '') Or (DMContrato.QContrato_GPInd_CP.Value = 1) Then
     Raise Exception.Create('Para Alterar Voltar Movimento do Contrato e Contas a Pagar');
  inherited;

end;

procedure TFContratoCad_GP.BtCadastroParceiroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil  then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk  then
    DMContrato.QContrato_GPCod_Cadastro_Parceiro.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFContratoCad_GP.DBEdit3Change(Sender: TObject);
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB') And
     (Trim(DbEdit3.Text) <> '') Then
     DMNotaSaida.MostraMsg(StrToInt(Trim(DbEdit3.Text)));

end;

procedure TFContratoCad_GP.SBCidadeEntregaClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = Nil  then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.ShowModal = mrOk  then
    DMContrato.QContrato_GPCod_Cidade_Entrega.Value:=DMCidade.QCidadeConsCod_Cidade.Value;

end;

procedure TFContratoCad_GP.BaixaCttGPporDescumprimento1Click(
  Sender: TObject);
begin
  inherited;
  if DMContrato.QContrato_GPCOD_CONTRATO_GP.value <> 0 then
   Begin
     DMContrato.QContrato_GP.Edit;
     DMContrato.QContrato_GPIND_SITUACAO.Value := 'N.CUMPRIDO';
     Showmessage('É Preciso Confirmar este Contrato!')
   end
  else
    Showmessage('Erro! Não há nenhum contrato selecionado.');
end;

procedure TFContratoCad_GP.BtAvalistaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil  then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk  then
    DMContrato.QContrato_GPCod_Avalista.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFContratoCad_GP.btTestemunha1Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil  then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk  then
  begin
    DMContrato.QContrato_GPDESC_TESTEMUNHA1.Value := DMCadastro.QCadastroConsNOME.Value;
    DMContrato.QContrato_GPNUM_CPF_TESTEMUNHA1.Value := DMCadastro.QCadastroConsNUM_CGC_CPF.Value;
  end;
end;

procedure TFContratoCad_GP.btTestemunha2Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil  then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk  then
  begin
    DMContrato.QContrato_GPDESC_TESTEMUNHA2.Value := DMCadastro.QCadastroConsNOME.Value;
    DMContrato.QContrato_GPNUM_CPF_TESTEMUNHA2.Value := DMCadastro.QCadastroConsNUM_CGC_CPF.Value;
  end;
end;

procedure TFContratoCad_GP.LiberaContratoPFechamento1Click(
  Sender: TObject);
begin
  inherited;
  if DMContrato.QContrato_GPCOD_CONTRATO_GP.value <> 0 then
   Begin
     DMContrato.QContrato_GP.Edit;
     DMContrato.QContrato_GPIND_LIBERADO.Value := 'SIM';
     Showmessage('É Preciso Confirmar este Contrato!')
   end
  else
    Showmessage('Erro! Não há nenhum contrato selecionado.');

end;

procedure TFContratoCad_GP.AlterarObservao1Click(Sender: TObject);
Var wobs : String;
    ClickedOK: Boolean;
begin
  inherited;
  If DMContrato.QContrato_GPCod_Contrato_Gp.Text <> '' Then
   Begin
     wObs := DMContrato.QContrato_GPDesc_Observacao.Value;
     ClickedOK := InputQuery('Digite Observacao', 'Obs:', wObs);
     If ClickedOK Then
     Begin
       DMContrato.QContrato_GP.Edit;
       DMContrato.QContrato_GPDesc_Observacao.Value := wObs;
       DMContrato.QContrato_GP.Post;
       DMOracle.DBCemapa.Commit;
     End;
   End;
end;

procedure TFContratoCad_GP.RelResumoContratoGP1Click(Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam := TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[21].TabVisible := true;
  if FContratoParam.ShowModal = mrOk then
  begin
    with DMContrato do
    begin
      QRResumoContrato_GP.Close;
      if Trim(FContratoParam.FmFilial22.MeFilial.Text) <> '' then
        QRResumoContrato_GP.SetVariable('FILIAL',Trim(FContratoParam.FmFilial22.MeFilial.Text))
      else
        QRResumoContrato_GP.SetVariable('FILIAL', NULL);
      if Trim(FContratoParam.FmProduto22.MeProduto.Text) <> '' then
        QRResumoContrato_GP.SetVariable('PRODUTO', Trim(FContratoParam.FmProduto22.MeProduto.Text))
      else
        QRResumoContrato_GP.SetVariable('PRODUTO', NULL);

      if (Trim(FContratoParam.ME22Dt_Pagto_I.Text)   = '') and  (Trim(FContratoParam.ME22Dt_Pagto_F.Text)   = '') and
         (Trim(FContratoParam.ME22Dt_Entrega_I.Text) = '') and  (Trim(FContratoParam.ME22Dt_Entrega_F.Text) = '') then
        Raise Exception.Create('Informar período para o relatório')
      else
      begin
        if Trim(FContratoParam.ME22Dt_Pagto_I.Text) <> '' then
          QRResumoContrato_GP.SetVariable('DT_PAGTO_I', Trim(FContratoParam.ME22Dt_Pagto_I.Text))
        else
          QRResumoContrato_GP.SetVariable('DT_PAGTO_I', NULL);
        if Trim(FContratoParam.ME22Dt_Pagto_F.Text) <> '' then
          QRResumoContrato_GP.SetVariable('DT_PAGTO_F', Trim(FContratoParam.ME22Dt_Pagto_F.Text))
        else
          QRResumoContrato_GP.SetVariable('DT_PAGTO_F', NULL);
        if Trim(FContratoParam.ME22Dt_Entrega_I.Text) <> '' then
          QRResumoContrato_GP.SetVariable('DT_ENTREGA_I', Trim(FContratoParam.ME22Dt_Entrega_I.Text))
        else
          QRResumoContrato_GP.SetVariable('DT_ENTREGA_I', NULL);
        if Trim(FContratoParam.ME22Dt_Entrega_F.Text) <> '' then
          QRResumoContrato_GP.SetVariable('DT_ENTREGA_F', Trim(FContratoParam.ME22Dt_Entrega_F.Text))
        else
          QRResumoContrato_GP.SetVariable('DT_ENTREGA_F', NULL);
      end;
      QRResumoContrato_GP.open;
    end;
    if FRResumoContrato_GP = Nil then
      FRResumoContrato_GP := TFRResumoContrato_GP.Create(Application);
    if Trim(FContratoParam.FmFilial22.EdFilial.Text) <> '' then
      FRResumoContrato_GP.QrlFilial.Caption := Trim(FContratoParam.FmFilial22.EdFilial.Text);
    if Trim(FContratoParam.ME22Dt_Pagto_I.Text) <> '' then
      FRResumoContrato_GP.QrlPeriodo.Caption := 'Período: ' + Trim(FContratoParam.ME22Dt_Pagto_I.Text) + ' até ' +
                                                Trim(FContratoParam.ME22Dt_Pagto_F.Text);
    if Trim(FContratoParam.ME22Dt_Entrega_I.Text) <> '' then
      FRResumoContrato_GP.QrlPrazo.Caption := 'Entrega: ' + Trim(FContratoParam.ME22Dt_Entrega_I.Text) + ' até ' +
                                                Trim(FContratoParam.ME22Dt_Entrega_F.Text)
    else
      FRResumoContrato_GP.QrlPrazo.Caption := '';

    if FContratoParam.RGPreview.ItemIndex = 0 then
      FRResumoContrato_GP.QrPrimario.Preview
    else
      FRResumoContrato_GP.QrPrimario.Print;
  end;
end;

procedure TFContratoCad_GP.SBIncluirClick(Sender: TObject);
begin
  If DMOracle.BuscaNome('SELECT Ind_Bloqueio_Fixacao FROM TB_PARAM_SISTEMA','COD_FILIAL >= 0 ') = 'B' then
     Raise Exception.Create('Neste Momento o Sistema Encontra-se Fechado Para Realizar Contratos');
  inherited;

end;

procedure TFContratoCad_GP.RelResumoContratoGdePreo21Click(
  Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam := TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[22].TabVisible := True;
  if FContratoParam.ShowModal = MrOk then
  begin
    with DMContrato do
    begin
      QRResumoContrato_GP2.Close;

      if (Trim(FContratoParam.ME23DtPagamentoI.Text)   = '') and  (Trim(FContratoParam.ME23DtPagamentoF.Text)   = '') and
         (Trim(FContratoParam.ME23DtEntregaI.Text) = '') and  (Trim(FContratoParam.ME23DtEntregaF.Text) = '') then
        Raise Exception.Create('Informar período para o relatório');

      if FContratoParam.ME23DtPagamentoI.Text <> '' then
        QRResumoContrato_GP2.SetVariable('DT_PAGTO_INICIAL', FContratoParam.ME23DtPagamentoI.Text)
      else
        QRResumoContrato_GP2.SetVariable('DT_PAGTO_INICIAL', null);
      if FContratoParam.ME23DtPagamentoF.Text <> '' then
        QRResumoContrato_GP2.SetVariable('DT_PAGTO_FINAL', FContratoParam.ME23DtPagamentoF.Text)
      else
        QRResumoContrato_GP2.SetVariable('DT_PAGTO_FINAL', null);
      if FContratoParam.ME23DtEntregaI.Text <> '' then
        QRResumoContrato_GP2.SetVariable('DT_INICIAL', FContratoParam.ME23DtEntregaI.Text)
      else
        QRResumoContrato_GP2.SetVariable('DT_INICIAL', null);
      if FContratoParam.ME23DtEntregaF.Text <> '' then
        QRResumoContrato_GP2.SetVariable('DT_FINAL', FContratoParam.ME23DtEntregaF.Text)
      else
        QRResumoContrato_GP2.SetVariable('DT_FINAL', null);

      if Trim(FContratoParam.FmFilial23.MeFilial.Text) <> '' then
        QRResumoContrato_GP2.SetVariable('COD_FILIAL', StrToInt(Trim(FContratoParam.FmFilial23.MeFilial.Text)))
      else
        QRResumoContrato_GP2.SetVariable('COD_FILIAL', null);
      if Trim(FContratoParam.FmProduto23.MeProduto.Text) <> '' then
        QRResumoContrato_GP2.SetVariable('COD_PRODUTO', StrToInt(Trim(FContratoParam.FmProduto23.MeProduto.Text)))
      else
        QRResumoContrato_GP2.SetVariable('COD_PRODUTO', null);

      QRResumoContrato_GP2.open;

      if FRResumoContrato_GP2 = Nil then
        FRResumoContrato_GP2 := TFRResumoContrato_GP2.Create(Application);
      FRResumoContrato_GP2.QRLCodFilial.Caption := FContratoParam.FmFilial23.MeFilial.Text;
      FRResumoContrato_GP2.QRLDescFilial.Caption := FContratoParam.FmFilial23.EdFilial.Text;
      FRResumoContrato_GP2.QRLCodProduto.Caption := FContratoParam.FmProduto23.MeProduto.Text;
      FRResumoContrato_GP2.QRLDescProduto.Caption := FContratoParam.FmProduto23.EdProduto.Text;

      FRResumoContrato_GP2.QRLDtPagamento.Caption := FContratoParam.ME23DtPagamentoI.Text
                                                    +' até '
                                                    +FContratoParam.ME23DtPagamentoF.Text;
      FRResumoContrato_GP2.QRLDtEntrega.Caption := FContratoParam.ME23DtEntregaI.Text
                                                  +' até '
                                                  +FContratoParam.ME23DtEntregaF.Text;
      FRResumoContrato_GP2.QRGroup1.Enabled := (FContratoParam.RGAgruparFilial.ItemIndex = 0);
      if FContratoParam.RGPreview.ItemIndex = 0 then
        FRResumoContrato_GP2.QRPrimario.Preview
      else
        FRResumoContrato_GP2.QRPrimario.Print;
    end;
  end;
end;

procedure TFContratoCad_GP.BtOperacaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = Nil then
    FOperacaoCons:=TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = mrOk then
    DMContrato.QContrato_GPCod_Operacao.Value:=DMOperacao.QOperacaoConsCod_Operacao.Value;

end;

procedure TFContratoCad_GP.BaixaContabil1Click(Sender: TObject);
begin
  inherited;
  if DMContrato.QContrato_GPCOD_CONTRATO_GP.Text = Null then
     Raise exception.Create('Selecionar um contrato para efetuar a baixa');
  If FContaPagarBaixa = Nil Then
     FContaPagarBaixa := TFContaPagarBaixa.Create(application);
  FContaPagarBaixa.Tag := 1;
  FContaPagarBaixa.MECodFornecedor.Text := DMContrato.QContrato_GPCod_Cadastro.Text;
  FContaPagarBaixa.MeCodFilial.Text := DMContrato.QContrato_GPCod_Filial.Text;
  FContaPagarBaixa.MeNumero.Text := DMContrato.QContrato_GPNum_Contrato.Text;
  FContaPagarBaixa.SbProcuraClick(Self);
  DMContasPagar.QContasPagar_Mov.Open;
  FContaPagarBaixa.ShowModal;
  DMContasPagar.QContasPagar_Mov.Close;
  If FContrato_Gp_Ajuste = Nil Then
     FContrato_Gp_Ajuste := TFContrato_Gp_Ajuste.Create(Application);
  If FContrato_Gp_Ajuste.ShowModal = MrOk Then
   Begin
     DMContrato.QContrato_GP.Edit;
     DMContrato.QContrato_GPQt_Ajuste.Value := StrToFloat(FContrato_Gp_Ajuste.MeQuantidade.Text);
     If DMContrato.QContrato_GPQt_Ajuste.Value = DMContrato.QContrato_GPQt_Quantidade.Value Then
        DMContrato.QContrato_GPIND_SITUACAO.Value := 'FECHADO';
//     Else
//        DMContrato.QContrato_GPIND_SITUACAO.Value := 'N.CUMPRIDO';
     DMContrato.QContrato_GP.Post;
     DMContrato.QContratoGP_Mov.Insert;
     DMContrato.QContratoGP_MovCOD_CONTRATO_GP.Value := DMContrato.QContrato_GPCOD_CONTRATO_GP.Value;
     DMContrato.QContratoGP_MovDATA.Value            := DMOracle.DataServ;
     DMContrato.QContratoGP_MovQT_QUANTIDADE.Value   := StrToFloat(FContrato_Gp_Ajuste.MeQuantidade.Text) * -1;
     DMContrato.QContratoGP_MovVAL_MOVIMENTO.Value   := StrToFloat(FContrato_Gp_Ajuste.MeValor.Text) * -1;
     DMContrato.QContratoGP_MovDESC_OBSERVACAO.Value := 'Referente a Nota ajuste quantidade';
     DMContrato.QContratoGP_MovIND_SALDO_ZERO.Value  := 'N';
     DMContrato.QContratoGP_Mov.Post;
     if DMOracle.DBCemapa.InTransaction then
       DMOracle.DBCemapa.Commit;
   End;
   ChamaGeraMov('Vend','CGP1');
end;

procedure TFContratoCad_GP.LiberaPagamentoAntecipado1Click(
  Sender: TObject);
begin
  inherited;
  if DMContrato.QContrato_GPCOD_CONTRATO_GP.value <> 0 then
   Begin
     DMContrato.QContrato_GP.Edit;
     DMContrato.QContrato_GPIND_PAGAMENTO_ANTECIPADO.Value := 'SIM';
     Showmessage('É Preciso Confirmar este Contrato!')
   end
  else
    Showmessage('Erro! Não há nenhum contrato selecionado.');

end;

procedure TFContratoCad_GP.Gera_NF_Contrato_GP(pOperacao: Integer; pUnitario,pQuantidade: Real; pCod_Nota_Cab: String);
Var wFunrural, wQt_DPI, wEmbalagem : Real;
    wInd_Fixar_Empresa, wInd_Compras : String;
Begin
  With DMNotaEntrada Do
  Begin
    QNotaEntrada.Insert;
    QNotaEntradaCOD_FILIAL.Value         := DMContrato.QContrato_GPCOD_FILIAL.Value;
    QNotaEntradaCOD_OPERACAO.Value       := pOperacao;
    QNotaEntradaCOD_CADASTRO.Value       := StrToInt(Trim(FContratoParam.Me5CodCliente.text));
    QNotaEntradaCOD_SERIE.Value          := DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(DMContrato.QContrato_GPCOD_FILIAL.Value));
    QNotaEntradaNum_Nota.Value           := 0;
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
      If pCod_Nota_Cab <> '' Then
       Begin
         QNotaEntradaCOD_NOTA_CAB_DEV_FIXAR.Value := StrToInt(pCod_Nota_Cab);  // grava o codigo da nota fiscal de devolucao que foi gerado
         QNotaEntradaNum_Nota.Value        := 999999;
       End;
    QNotaEntradaDt_Recebimento.Value     := DMOracle.DataServ;
    QNotaEntradaDt_Emissao.Value         := DMOracle.DataServ;
    If DMOracle.BuscaNome('SELECT IND_CONTA_PAGAR FROM TB_OPERACAO','COD_OPERACAO = '+IntToStr(pOperacao)) = 'S' Then
       QNotaEntradaInd_Condicao_Pagto.Value := '2'
    Else
       QNotaEntradaInd_Condicao_Pagto.Value := '1';
    QNotaEntradaOBS.Value                := 'Ref Cont.Nr.:'+DMContrato.QContrato_GPNum_Contrato.Text+' de '+DateToStr(DMContrato.QContrato_GPDt_Contrato.Value);
    QNotaEntradaOBS_COMPLEMENTO.Value    := Trim(FContratoParam.Ed5Observacao.Text);
    If (Trim(FContratoParam.Me5Parceiro.Text) <> '0') And
       (Trim(FContratoParam.Me5Parceiro.Text) <> '')  Then
       QNotaEntradaCod_Cadastro_Parceiro.Text := Trim(FContratoParam.Me5Parceiro.Text);
    QItemNF.Insert;
    QItemNFCod_Produto.Value       := DMContrato.QContrato_GPCOD_PRODUTO.value;
    QItemNFQT_QUANTIDADE.Value     := pQuantidade;
    QItemNFVAL_UNITARIO.Value      := pUnitario;
    QItemNFIND_BX_CONTR_VEND.Value := 'S';

    QItemNFVAL_DPI_TRANSGENICOS.Value := 0;
    QItemNFQT_CREDITO_TRANSGENICOS.Value := 0;
    wInd_Fixar_Empresa := DMOracle.BuscaNome('SELECT Ind_Fixar_Empresa FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(QNotaEntradaCOD_OPERACAO.Value),True);
    wInd_Compras := DMOracle.BuscaNome('SELECT IND_COMPRAS FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(QNotaEntradaCOD_OPERACAO.Value),True);
    If (wInd_Fixar_Empresa = 'F') Or // somente desconta transgenicos para fixacao nao tem na devolucao
       (wIND_COMPRAS = 'C') Then  // para moinho testa o compras porque faz nota devolucao e um nota de compra
     Begin
       If Trim(FContratoParam.Me5QtCredito.Text) <> '' Then
          QItemNFQT_CREDITO_TRANSGENICOS.Value := StrToFloat(Trim(FContratoParam.Me5QtCredito.Text));
       wQt_DPI := QItemNFQT_QUANTIDADE.Value - QItemNFQT_CREDITO_TRANSGENICOS.Value;
       wEmbalagem :=StrToFloat(DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO',
                    'COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value),True));
       If (Trim(FContratoParam.Me5PercDpi.Text) <> '') And (Trim(FContratoParam.Me5PercDpi.Text) <> '0') And (wQt_DPI > 0) Then
           QItemNFVAL_DPI_TRANSGENICOS.Value := QItemNFVal_Unitario.Value * wQt_DPI / wEmbalagem * StrToFloat(Trim(FContratoParam.Me5PercDpi.Text)) / 100;
      End;
    QItemNF.Post;
    wFunRural := 0;
    If (wInd_Fixar_Empresa = 'F') Or
       (wIND_COMPRAS = 'C') Then
       wFunRural := CalculaFunrural(QItemNFCOD_PRODUTO.value,
                                    QNotaEntradaCOD_OPERACAO.value,
                                    QNotaEntradaCod_Cadastro.value,
                                    QItemNFVAL_TOTAL.value);
    QNotaEntradaVAL_FUNRURAL.value := wFunRural;

    If (wInd_Fixar_Empresa = 'F') Or // somente desconta transgenicos para fixacao nao tem na devolucao
       (wIND_COMPRAS = 'C') Then  // para moinho testa o compras porque faz nota devolucao e um nota de compra
     Begin
       DMContrato.QContratoGP_Mov.Insert;
       DMContrato.QContratoGP_MovCOD_CONTRATO_GP.Value := DMContrato.QContrato_GPCOD_CONTRATO_GP.Value;
       DMContrato.QContratoGP_MovDATA.Value            := DMOracle.DataServ;
       DMContrato.QContratoGP_MovQT_QUANTIDADE.Value   := pQuantidade;
       DMContrato.QContratoGP_MovVAL_MOVIMENTO.Value   := ((pQuantidade*pUnitario)*(100-DMContrato.QContrato_GPPERC_FUNRURAL.value)/100)/DMProduto.QProdutoNUM_EMBALAGEM.Value;
       DMContrato.QContratoGP_MovDESC_OBSERVACAO.Value := 'Referente a Nota : Cod:'+FloatTostr(DMNotaEntrada.QNotaEntradaCod_Nota_cab.value);
       DMContrato.QContratoGP_MovIND_SALDO_ZERO.Value  := 'N';
       DMContrato.QContratoGP_Mov.Post;
     End;
//            ChamaGeraMov('BaixaProd','CGP');

    QNotaEntradaCOD_CONTRATO_GP_MOV.Value:=DMContrato.QContratoGP_MovCOD_CONTRATO_GP_MOV.Value;
    If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' Then
       DMNotaEntrada.CalculaDesconto(DMNotaEntrada.QNotaEntradaCOD_CADASTRO.Value,DMNotaEntrada.QNotaEntradaCOD_FILIAL.Value,DMNotaEntrada.QNotaEntradaCOD_OPERACAO.Value,DMNotaEntrada.QItemNFCOD_NOTA_ITEM.Value,DMNotaEntrada.QItemNFCOD_PRODUTO.Value,DMNotaEntrada.QItemNFQT_QUANTIDADE.Value,'E',DMNotaEntrada.QNotaEntradaCOD_CADASTRO_PARCEIRO.Text);  // calcula desconto do a fixar

 //O rateio não é mais feito pelo código
 {   QItemNF.Edit;
    QItemNFVal_Desconto.Value := QNotaEntradaVal_Desconto.Value;
    QItemNF.Post;       }
  End;
End;

procedure TFContratoCad_GP.SbParceriaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     MeParceiro.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;

end;

procedure TFContratoCad_GP.SbMotoristaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     MeMotorista.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;

end;

procedure TFContratoCad_GP.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons:=TFOperacaoCons.Create(Application);
  FoperacaoCons.RGTipoOperacao.ItemIndex :=  1;
  if FOperacaoCons.ShowModal = mrOk then
   begin
     MECodOperacao.Text:=DMOperacao.QOperacaoConsCOD_OPERACAO.Text;
     MECodOperacaoExit(Self);
   end;

end;

procedure TFContratoCad_GP.SbFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     MECodFilial.text:=DMFilial.QFilialConsCOD_FILIAL.text;

end;

procedure TFContratoCad_GP.SbTributacaoClick(Sender: TObject);
begin
  inherited;
  if FTributacaoCons = Nil then
    FTributacaoCons := TFtributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal  = MrOk then
    begin
      MECodTribProd.text:=DMtributacao.QtributacaoConsCod_Tributacao.text;
      MECodTribProdExit(Self);
    end;

end;

procedure TFContratoCad_GP.BtConsMensClick(Sender: TObject);
begin
  inherited;
  If FMensagemCons = Nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  If FMensagemCons.ShowModal = mrOk then
    MeCodMens.Text := FloatToStr(DMMensagem.QMensagemConsCod_Mensagem.Value);

end;

procedure TFContratoCad_GP.ValueClick(Sender: TObject);
Var wTotalMov,wQt_DPI,wEmbalagem,wPercDpi : Real;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MeCodFilial.Text),'AGRICOLA');
  If Trim(MeQuantidade.Text) = '' Then
     Raise Exception.Create('Informar Quantidade');
  If Trim(MeCodFilial.Text) = '' Then
     Raise Exception.Create('Informar código filial');
  If Trim(MECodTribProd.Text) = '' Then
     Raise Exception.Create('Informar código tributação');
  If Trim(MeValTotal.Text) = '' Then
     Raise Exception.Create('Informar valor total');
  If Trim(MECodOperacao.Text) = '' Then
     Raise Exception.Create('Informar operação');
  If Trim(MeNrNota.Text) = '' Then
     Raise Exception.Create('Informar número da nota');
  If Trim(MeSerie.Text) = '' Then
     Raise Exception.Create('Informar série da nota');
  If Trim(MeModelo.Text) = '' Then
     Raise Exception.Create('Informar modelo da nota');

  DMContrato.QContratoGP_Mov.Close;
  DMContrato.QContratoGP_Mov.Open;
  DMContrato.QContratoGP_Mov.First;
  wTotalMov:=0;
  while not(DMContrato.QContratoGP_Mov.Eof) do
    Begin
      If DMOracle.BuscaNome('SELECT IND_FUTURA_FORNECEDOR FROM TB_NOTA_CAB,TB_OPERACAO',' TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO AND TB_NOTA_CAB.COD_CONTRATO_GP_MOV = '+DMContrato.QContratoGP_MovCOD_CONTRATO_GP_MOV.Text) <> 'C' Then
         wTotalMov:=wTotalMov+DMContrato.QContratoGP_MovQT_Quantidade.value;
      DMContrato.QContratoGP_Mov.Next;
    End;
  wTotalMov:=DMContrato.QContrato_GPQT_Quantidade.Value - wTotalMov;
  If StrToFloat(Trim(MeQuantidade.Text)) > wTotalMov Then
     Raise Exception.Create ('Quantidade Informada Maior que Quantidade Aberto do Contrato');

  with DMNotaEntrada do
    Begin
      PContabiliza_Extra := 'N';
      pTipoNota := 'NORMAL';
      QNotaEntrada.Open;
      QItemNF.Open;
      wEmbalagem :=StrToFloat(DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DMContrato.QContrato_GPCOD_PRODUTO.value)));
     Try
      QNotaEntrada.Insert;
      QNotaEntradanum_nota.Value:=StrToInt(Trim(MeNrNota.Text));
      QNotaEntradaCOD_CADASTRO.Value:=DMContrato.QContrato_GPCOD_CADASTRO.Value;
      QNotaEntradaCOD_SERIE.Value:=Trim(MeSerie.Text);
      QNotaEntradaCOD_SERIE_MODELO.Value:=Trim(MeModelo.Text);
      QNotaEntradaCOD_FILIAL.Value:=StrToInt(Trim(MeCodFilial.Text));
      QNotaEntradaCOD_OPERACAO.Value:=StrToInt(Trim(MECodOperacao.Text));
      QNotaEntradaDt_Recebimento.Value := StrToDate(MeDtEntrada.Text);
      QNotaEntradaDt_Emissao.Value := StrToDate(MeDtEmissao.Text);
      QNotaEntradaObs.Value := Trim(MeObs1.Text);
      QNotaEntradaObs_Complemento.Value := Trim(MeObs2.Text);
      if Trim(MeTransporte.Text) <> '' Then
         QNotaEntradaCod_Transporte.Value := StrToInt(Trim(MeTransporte.Text));
      Case RgCondicaoPagto.ItemIndex of
         0 : QNotaEntradaInd_Condicao_Pagto.Value := '1';
         1 : QNotaEntradaInd_Condicao_Pagto.Value := '2';
      End;
      If (Trim(MeParceiro.Text) <> '0') And
         (Trim(MeParceiro.Text) <> '') Then
         QNotaEntradaCod_Cadastro_Parceiro.Value := StrToInt(Trim(MeParceiro.Text));
      DMNotaEntrada.pOperacaoInterna := 0; // Confirmando a Nota
      If Trim(MeCodMens.Text) <> '' Then
         QNotaEntradaCod_Mensagem.Value := StrToInt(Trim(MeCodMens.Text));

      if Trim(MECodTransportadora.Text) <> '' then
         QNotaEntradaCOD_TRANSPORTADOR.Value:=StrToInt(Trim(MECodTransportadora.Text))
      else
         QNotaEntradaDESC_TRANSPORTADORA.Value:=Trim(MeTransportadora.Text);
      If RgTipoFrete.ItemIndex = 0 Then
         QNotaEntradaIND_TIPO_FRETE.Value := 'CIF'
      Else
         QNotaEntradaIND_TIPO_FRETE.Value := 'FOB';
      If (Trim(MeParceiro.Text) <> '') And (Trim(MeParceiro.Text) <> '0') Then
         QNotaEntradaCod_Cadastro_Parceiro.Value := StrToInt(Trim(MeParceiro.Text));
      If Trim(MeMotorista.Text) <> '' Then
         QNotaEntradaCod_Motorista.Value := StrToInt(Trim(MeMotorista.Text));
      If Trim(MePlaca.Text) <> '' Then
         QNotaEntradaDesc_Placa.Value := Trim(MePlaca.Text);
      If Trim(MeDespesas.Text) <> '' Then
         QNotaEntradaVal_Despesas.Value := StrToFloat(Trim(MeDespesas.Text));
      If Trim(MeMensagem.Text) <> '' Then
         QNotaEntradaDESC_OBS_CORPO_NOTA.Value := Trim(MeMensagem.Text);
      QItemNF.Insert;
      QItemNFCod_produto.Value:=DMContrato.QContrato_GPCOD_PRODUTO.value;
      QItemNFQT_QUANTIDADE.Value:=StrToFloat(Trim(MeQuantidade.Text));
      If StrToFloat(Trim(MeQuantidade.Text)) > 0 Then
         QItemNFVAL_UNITARIO.Value:=StrToFloat(Trim(MeValTotal.Text)) / StrToFloat(Trim(MeQuantidade.Text)) * wEmbalagem
      Else
         QItemNFVAL_UNITARIO.Value:=StrToFloat(Trim(MeValTotal.Text));
      If Trim(MeDespesas.Text) <> '' Then
         QItemNFVal_Despesas.Value := StrToFloat(Trim(MeDespesas.Text));
      QItemNFVAL_TOTAL.Value:=StrToFloat(MeValTotal.Text);;
      QItemNFNUM_NOTA_PRODUTOR.Text := Trim(MeNfProdutor.Text);
      QItemNFCOD_TRIBUTACAO.Value := StrToInt(Trim(MECodTribProd.Text));
      QItemNFIND_BX_CONTR_VEND.Value:='S';
      QItemNFCod_Lote_Tipo.Value := 1;
      QItemNFVAL_DPI_TRANSGENICOS.Value := 0;
      If Trim(MeCreditoSemente.Text) <> '' Then
         QItemNFQT_CREDITO_TRANSGENICOS.Value := StrToFloat(Trim(MeCreditoSemente.Text))
      Else
         QItemNFQT_CREDITO_TRANSGENICOS.Value := 0;
      If DMOracle.BuscaNome('SELECT IND_SOJICULTOR_PARTICIPANTE FROM TB_CADASTRO','COD_CADASTRO = '+DMContrato.QContrato_GPCOD_CADASTRO.Text) <> 'PAR' Then
       Begin
         wQt_DPI := QItemNFQT_QUANTIDADE.Value - QItemNFQT_CREDITO_TRANSGENICOS.Value;
         wPercDpi :=StrToFloat(DMOracle.BuscaNome('SELECT PERC_DPI_TRANSGENICOS FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value)));
         If (wPercDpi > 0) And (wQt_DPI > 0) Then
            QItemNFVAL_DPI_TRANSGENICOS.Value := QItemNFVal_Unitario.Value * wQt_DPI / wEmbalagem * wPercDpi / 100;
       End;
      If Trim(MeQtChegada.Text) <> '' Then
         QItemNFQT_Chegada.Value := StrToFloat(Trim(MeQtChegada.Text));
      QItemNF.Post;
      QItemNF.First;
      QNotaEntradaVAL_FUNRURAL.Value:=CalculaFunrural(QItemNFCOD_PRODUTO.value,
                                      QNotaEntradaCOD_OPERACAO.value,
                                      QNotaEntradaCOD_CADASTRO.Value,
                                      QItemNFVAL_TOTAL.value);

      DMContrato.QContratoGP_Mov.Insert;
      DMContrato.QContratoGP_MovCOD_CONTRATO_GP.Value := DMContrato.QContrato_GPCOD_CONTRATO_GP.Value;
      DMContrato.QContratoGP_MovDATA.Value            := StrToDate(MeDtEntrada.Text);
      DMContrato.QContratoGP_MovQT_QUANTIDADE.Value   := StrToFloat(Trim(MeQuantidade.Text));
      DMContrato.QContratoGP_MovVAL_MOVIMENTO.Value   := QItemNFVAL_TOTAL.value + QItemNFVal_Despesas.Value - Trunc(QNotaEntradaVAL_FUNRURAL.Value * 100) / 100;
      DMContrato.QContratoGP_MovDESC_OBSERVACAO.Value := 'Referente a Nota : Cod:'+FloatTostr(DMNotaEntrada.QNotaEntradaCod_Nota_cab.value);
      DMContrato.QContratoGP_MovIND_SALDO_ZERO.Value  := 'N';
      DMContrato.QContratoGP_Mov.Post;

      QNotaEntradaCOD_CONTRATO_GP_MOV.Value:=DMContrato.QContratoGP_MovCOD_CONTRATO_GP_MOV.Value;

      Try
        DMNotaEntrada.QNotaEntrada.AutoCalcFields:=False;
        DMNotaEntrada.QItemNF.AutoCalcFields:=False;
        DMNotaEntrada.QSomaItemNota.AutoCalcFields:=False;
        DMNotaEntrada.QItemNF.DisableControls;
        If DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '2' Then
          Raise Exception.Create('Nota Fiscal já confirmada!');
        If DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '3' Then
          Raise Exception.Create('Não é possível confirmar uma Nota Fiscal Cancelada!');
        DMNotaEntrada.pOperacaoInterna := 3; // Confirmando a Nota
        If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' Then
         Begin
           If FNotaAgricolaConf = Nil then
              FNotaAgricolaConf := TFNotaAgricolaConf.Create(Application);
           FNotaAgricolaConf.ShowModal;
         End
        Else
         Begin
           If FNotaEntrada_Confirma = Nil then
              FNotaEntrada_Confirma := TFNotaEntrada_Confirma.Create(Application);
           FNotaEntrada_Confirma.pContrato:=True;
           FNotaEntrada_Confirma.ShowModal;
         End;             
        DMNotaEntrada.pOperacaoInterna := 0;
        DMNotaEntrada.QNotaEntrada.AutoCalcFields:=True;
        DMNotaEntrada.QItemNF.AutoCalcFields:=True;
        DMNotaEntrada.QSomaItemNota.AutoCalcFields:=True;
        DMNotaEntrada.QItemNF.EnableControls;
        If (DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '2') then
         If (StrToFloat(Trim(MeQuantidade.Text)) = wTotalMov) Then
          Begin
            DMContrato.QContrato_GP.Edit;
            DMContrato.QContrato_GPIND_SITUACAO.value:='FECHADO';  // esta testando a situacao porque pode chegar no final da tela de
            DMContrato.QContrato_GP.Post;                          // fechamento e dar um click no botao de cancelar
          End;
        If DMOracle.DBCemapa.InTransaction then
           DMOracle.DBCemapa.Commit;
        ShowMessage('Geração de Nota e Movimento efetuado com sucesso.');
      Except
        DMNotaEntrada.QNotaEntrada.EnableControls;
        DMNotaEntrada.QItemNF.EnableControls;
        DMNotaEntrada.QNotaEntrada.Cancel;
        DMNotaEntrada.QItemNF.Cancel;
        DMContrato.QContratoGP_Mov.Cancel;
        If DMOracle.DBCemapa.InTransaction then
          DMOracle.DBCemapa.Rollback;
        Raise exception.Create('Erro ! Não foi possível gerar a nota ou o movimento do contrato.');
      End;
     Except
        DMNotaEntrada.QNotaEntrada.Cancel;
        DMNotaEntrada.QItemNF.Cancel;
        DMContrato.QContratoGP_Mov.Cancel;
        If DMOracle.DBCemapa.InTransaction then
          DMOracle.DBCemapa.Rollback;
     End;
  end;
  MeQuantidade.Clear;
  MeValTotal.Clear;
  MeNrNota.Clear;
  MEPlaca.Clear;
  MeMotorista.Clear;
  MeQtChegada.Clear;
  MeCreditoSemente.Clear;
  MeNfProdutor.Clear;
  DMContrato.QContrato_GP.Close;
  DMContrato.QContrato_GP.Open;
end;

procedure TFContratoCad_GP.MECodOperacaoExit(Sender: TObject);
begin
  inherited;
  if MECodOperacao.text<>'' then
    MEOperacao.Text:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+MECodOperacao.text)
  else
    MEOperacao.clear;

end;

procedure TFContratoCad_GP.MECodTribProdExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodTribProd.Text)<>'' then
    METribut.Text:=DMOracle.BuscaNome('SELECT DESC_TRIBUTACAO FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+MECodTribProd.text)
  else
    METribut.Clear;

end;

procedure TFContratoCad_GP.SbTransportadoraClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      MECodTransportadora.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;
      MECodTransportadoraExit(Self);
    end;

end;

procedure TFContratoCad_GP.MECodTransportadoraExit(Sender: TObject);
begin
  inherited;
  if MECodTransportadora.Text<>''  then
    METransportadora.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodTransportadora.Text)
  else
    METransportadora.Clear;

end;

procedure TFContratoCad_GP.Button1Click(Sender: TObject);
begin
  inherited;
  BTExcluiLancClick(Self);
end;

procedure TFContratoCad_GP.PgControlChange(Sender: TObject);
Var wTotalMov,wCredito : Real;
   wTipo_Oper : String;
begin
  inherited;
  If PgControl.ActivePage = TsNota Then
   Begin
     MeCreditoSemente.Clear;
     MeCodFilial.Text := DMContrato.QContrato_GPCod_Filial.Text;
     MeDtEmissao.Text := DateToStr(DMOracle.DataServ);
     MeDtEntrada.Text := DateToStr(DMOracle.DataServ);
     with DMFilial do
     begin
       QFilial.Close;
       QFilial.SetVariable('PK', DMContrato.QContrato_GPCOD_FILIAL.Value);
       QFilial.Open;
       MeSerie.Text := QFilialCOD_SERIE.Value;
       MeModelo.Text := QFilialCOD_SERIE_MODELO.Value;
     end;
     MeParceiro.Text := DMContrato.QContrato_GPCOD_CADASTRO_PARCEIRO.Text;
     DMContrato.QContratoGP_Mov.Close;
     DMContrato.QContratoGP_Mov.Open;
     DMContrato.QContratoGP_Mov.First;
     wTotalMov:=0;
     while not(DMContrato.QContratoGP_Mov.Eof) do
       Begin
         wTipo_oper := DMOracle.BuscaNome('SELECT IND_FUTURA_FORNECEDOR FROM TB_NOTA_CAB,TB_OPERACAO',' TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO AND TB_NOTA_CAB.COD_CONTRATO_GP_MOV = '+DMContrato.QContratoGP_MovCOD_CONTRATO_GP_MOV.Text,True);
         If (wTipo_Oper <> 'C') And (wTipo_Oper <> '') Then
            wTotalMov:=wTotalMov+DMContrato.QContratoGP_MovQT_Quantidade.value;
         DMContrato.QContratoGP_Mov.Next;
       End;
     If DMContrato.QContrato_GPIND_BAIXA_CREDITO_MONSANTO.Value = 'SIM' Then  // Foi o Vilson que solicitou
      Begin
        MeCreditoSemente.Enabled := False;
        wCredito := DMContrato.QContrato_GPQT_CREDITO_TRANSGENICOS.Value - wTotalMov;
        If wCredito >= 0 Then
           MeCreditoSemente.Text := FloatToStr(wCredito);
      End
     Else
        MeCreditoSemente.Enabled := True;

     wTotalMov:=DMContrato.QContrato_GPQT_Quantidade.Value - wTotalMov - DMContrato.QContrato_GPQT_AJUSTE.Value;
     LblQuantidade.Caption := FormatFloat('##,##0',wTotalMov);
   End;
end;

procedure TFContratoCad_GP.SbTransporteClick(Sender: TObject);
begin
  inherited;
  if FTransporteCons = Nil then
    FTransporteCons := TFTransporteCons.Create(Application);
  if FTransporteCons.ShowModal = MrOk then
     MeTransporte.Text:=DMTransporte.QTransporteConsCOD_TRANSPORTE.Text;

end;

procedure TFContratoCad_GP.AlteraCdigoProduto1Click(Sender: TObject);
begin
  inherited;
  If DMContrato.QContrato_GPCOD_Contrato_GP.Text <> '' Then
   Begin
     If FAlteraProduto = Nil Then
        FAlteraProduto := TFAlteraProduto.Create(Application);
     If FAlteraProduto.ShowModal = MrOk Then
      with DMOracle do
      begin
        try
          DMOracle.DBCemapa.StartTransaction;
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          QExecSQL.SQL.Add('UPDATE TB_CONTRATO_GP SET COD_PRODUTO = ' + FAlteraProduto.FmProduto.MeProduto.Text );
          QExecSQL.SQL.Add('WHERE COD_CONTRATO_GP = ' + DMContrato.QContrato_GPCOD_Contrato_GP.Text);
          QExecSQL.ExecSQL;
          DMOracle.DBCemapa.Commit;
          DMContrato.QContrato_GP.Refresh;
        Except
          DMOracle.DBCemapa.Rollback;
          Raise Exception.Create('Código produto não foi atualizado');
        end;
      end;
   End;

end;

procedure TFContratoCad_GP.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  If OpenDialog.Execute Then
     MeArquivo.Text := OpenDialog.FileName;

end;

procedure TFContratoCad_GP.BitBtn3Click(Sender: TObject);
var
  Stream : TStream;
  FileStream : TFileStream;
  wNomeArquivo : String;
  wPosicaoBarra : Integer;
begin
  inherited;
  DMContrato.QContratoGP_Doc.Insert;
  Stream := DMContrato.QContratoGP_Doc.CreateBlobStream(DMContrato.QContratoGP_DocARQUIVO, bmWrite);
  try
    Stream.Seek(0, soFromBeginning);
    FileStream := TFileStream.Create(MeArquivo.Text, fmOpenRead or fmShareDenyWrite);
    try
      Stream.CopyFrom(FileStream, FileStream.Size);
    finally
      FileStream.Free;
    end;
    wNomeArquivo := MeArquivo.Text;
    wPosicaoBarra := Pos('\', wNomeArquivo);
    while (wPosicaoBarra > 0) do begin
      wNomeArquivo := Copy(wNomeArquivo, (wPosicaoBarra+1), Length(wNomeArquivo));
      wPosicaoBarra := Pos('\', wNomeArquivo);
    end;
    DMContrato.QContratoGP_DocNOME_ARQUIVO.AsString := wNomeArquivo;
    DMContrato.QContratoGP_DocDESCRICAO.AsString := MeArquivo.Text;
    DMContrato.QContratoGP_DocDT_INCLUSAO.AsDateTime := Now;
    DMContrato.QContratoGP_DocCOD_contrato_GP.Value := DMContrato.QContrato_GPCOD_contrato_GP.Value;

    DMContrato.QContratoGP_Doc.Post;
    MessageDlg('Arquivo inserido com sucesso' ,
      MtError, [mbOK], 0);
  finally
    Stream.Free;
  end;

end;

procedure TFContratoCad_GP.BitBtn2Click(Sender: TObject);
var
  Stream : TStream;
  FileStream : TFileStream;
  PastaTemp : String;
  NomeArquivo : String;
begin
  inherited;
  PastaTemp := GetEnvironmentVariable('TEMP');
  if (PastaTemp = '') then begin
    MessageDlg('É preciso definir a variável TEMP, para armazenamento de arquivos temporários.' ,
      mtError, [mbOK], 0);
    Abort;
  end;
  FileStream.Free;
  Stream.Free;
  NomeArquivo := PastaTemp + '\' + DsContrato_Gp_Doc.DataSet.FieldByName('NOME_ARQUIVO').AsString;
  Stream := DsContrato_Gp_Doc.DataSet.CreateBlobStream(DsContrato_Gp_Doc.DataSet.FieldByName('ARQUIVO'), bmRead);
  try
    Stream.Seek(0, soFromBeginning);
    FileStream := TFileStream.Create(NomeArquivo, fmCreate);
    try
      FileStream.CopyFrom(Stream, Stream.Size);
    finally
      FileStream.Free;
    end;
    If FPDFViewer = Nil Then
       FPDFViewer := TFPDFViewer.Create(Self);
    FPDFViewer.Caption := 'Visualizando arquivo ' + NomeArquivo;
    FPDFViewer.Pdf1.src := NomeArquivo;
    FPDFViewer.ShowModal;
//    FPDFViewer := Nil;
  finally
    Stream.Free;
  end;

end;

procedure TFContratoCad_GP.BitBtn4Click(Sender: TObject);
begin
  inherited;
  DMContrato.QContratoGP_Doc.Delete;

end;

procedure TFContratoCad_GP.MeFilialExit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(MeFilial.Text);
end;

end.
