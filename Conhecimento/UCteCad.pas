unit UCteCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, OracleData, OraTeste, DBDirceu, variants, ActnList,
  IdBaseComponent, IdComponent,
  xmldom, XMLIntf, msxmldom, DBPanel, OracleNavigator, Grids, DBGrids,
  UFmNota, CustomDialog, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFCteCad = class(TFTCadSimples)
    ImpressoConhecimento1: TMenuItem;
    Opes1: TMenuItem;
    Confirma1: TMenuItem;
    VoltarConfirmao1: TMenuItem;
    Cancela1: TMenuItem;
    VoltarCancelamento1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    SBNotaCorrecao: TSpeedButton;
    DsMotoristaCte: TDataSource;
    TabSheet3: TTabSheet;
    DBMObs: TDBMemo;
    Label6: TLabel;
    BtMensagem: TBitBtn;
    Label35: TLabel;
    DBEdit27: TDBEdit;
    Label36: TLabel;
    DBEdit31: TDBEdit;
    Label37: TLabel;
    DBEdit32: TDBEdit;
    Label38: TLabel;
    DBMInfAdicFisco: TDBMemo;
    BtMsgFisco: TBitBtn;
    TSRodo: TTabSheet;
    GroupBox5: TGroupBox;
    OracleNavigator1: TOracleNavigator;
    DBGrid1: TDBGrid;
    DBPMotoristaCte: TDBPanel;
    GroupBox7: TGroupBox;
    OracleNavigator2: TOracleNavigator;
    DBGrid2: TDBGrid;
    DsVeiculoCte: TDataSource;
    Label40: TLabel;
    DBTSituacao: TDBText;
    DBTSitSefaz: TDBText;
    DBMemo1: TDBMemo;
    N2: TMenuItem;
    InutilizaodeNmerao1: TMenuItem;
    EnviarviaEmail1: TMenuItem;
    ReemitirDacte1: TMenuItem;
    Reconsultar1: TMenuItem;
    Exportar1: TMenuItem;
    ExportarCTesPorPerodo1: TMenuItem;
    VerRetornodeEnvio1: TMenuItem;
    N3: TMenuItem;
    DenegarCTe1: TMenuItem;
    VoltarCTeDenegado1: TMenuItem;
    Label1: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    SaveDialogExportaCTes: TSaveDialog;
    btPlacaCons: TBitBtn;
    Label41: TLabel;
    EdVeiculo: TEdit;
    EDPlaca: TDBEdit;
    RelaodeCTEs1: TMenuItem;
    TabSheet5: TTabSheet;
    GPBCTeReferenciado: TGroupBox;
    LblCTeReferenciado: TLabel;
    DBECodCTeReferenciado: TDBEdit;
    BTCTeReferenciado: TBitBtn;
    DBDCTeReferenciado: TDBDirceu;
    GPBCTeAnulacao: TGroupBox;
    LblCTeAnulacao: TLabel;
    DBECodCTeAnulacao: TDBEdit;
    BTCTeAnulacao: TBitBtn;
    DBDCTeAnulacao: TDBDirceu;
    LblDecNaoContrib: TLabel;
    DBEDecNaoContib: TDBEdit;
    GPBTomaContICMS: TGroupBox;
    DBEChaveAcessoRef: TDBEdit;
    LblChaveAcessoRef: TLabel;
    DBRToma: TDBRadioGroup;
    TabSheet6: TTabSheet;
    GBDocAnterior: TGroupBox;
    SBDocAntInserir: TSpeedButton;
    SBDocAntRemover: TSpeedButton;
    Label44: TLabel;
    DBGDocAnterior: TDBGrid;
    EmitirCartaCorrecao: TMenuItem;
    Label5: TLabel;
    Label10: TLabel;
    PageControl2: TPageControl;
    TabSheet7: TTabSheet;
    TSSeguro: TTabSheet;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    DBPanel1: TDBPanel;
    DBPTributacao: TDBPanel;
    GBSeguro: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit28: TDBEdit;
    CMBResponsavelSeguro: TComboBox;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEChaveAcesso: TDBEdit;
    Label2: TLabel;
    DBRFormaPagto: TDBRadioGroup;
    CmbTomador: TComboBox;
    LabelTomador: TLabel;
    DBPanel4: TDBPanel;
    DBPanel3: TDBPanel;
    Label17: TLabel;
    lblModelo: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label39: TLabel;
    Label8: TLabel;
    DBECodConhecimento: TDBEdit;
    SbSerie: TBitBtn;
    CmbTpServ: TComboBox;
    CMBTipoCte: TComboBox;
    DBEdit33: TDBEdit;
    DBPanel8: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    GPBOrigemPrestacao: TGroupBox;
    DBPCidadeOrigem: TDBPanel;
    DBPEstadoOrigem: TDBPanel;
    GBPAgentesPrestacao: TGroupBox;
    DBPRemetente: TDBPanel;
    DBPDestinatario: TDBPanel;
    DBPTomador: TDBPanel;
    DBPExpedidor: TDBPanel;
    DBPRecebedor: TDBPanel;
    GBPDestinoPrestacao: TGroupBox;
    DBPCidadeDestino: TDBPanel;
    DBPEstadoDestino: TDBPanel;
    GroupBox4: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Label33: TLabel;
    Label31: TLabel;
    Label42: TLabel;
    DBEFreteValor: TDBEdit;
    DBEPedagio: TDBEdit;
    DBEGris: TDBEdit;
    DBETotalCTe: TDBEdit;
    DBEFretePeso: TDBEdit;
    DBEDespacho: TDBEdit;
    DBEValorReceber: TDBEdit;
    GBICMS: TGroupBox;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    DBEST: TDBEdit;
    DBEICMS: TDBEdit;
    DBEBaseCalculoICMS: TDBEdit;
    DBEBaseCalculoST: TDBEdit;
    DBCPedagioIncluso: TDBCheckBox;
    DBEFretePorTon: TDBEdit;
    Label9: TLabel;
    SBSeguradora: TBitBtn;
    DBPSeguradora: TDBPanel;
    DBPanel2: TDBPanel;
    GroupBox8: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEPesoBruto: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    TabSheet8: TTabSheet;
    GroupBox6: TGroupBox;
    SBDocInserir: TSpeedButton;
    SBDocRemover: TSpeedButton;
    Label3: TLabel;
    DBGDocOriginario: TDBGrid;
    ConhecimentosComNotasDestinatrios1: TMenuItem;
    DBCBGlobalizado: TDBCheckBox;
    SBChaveAcesso: TSpeedButton;
    DBRGModal: TDBRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBSerieClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure ImpressoConhecimento1Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure Confirma1Click(Sender: TObject);
    procedure VoltarConfirmao1Click(Sender: TObject);
    procedure DBEdit36Change(Sender: TObject);
    procedure VoltarCancelamento1Click(Sender: TObject);
    procedure Cancela1Click(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure DBLCCstPisCloseUp(Sender: TObject);
    procedure DBLCCstCofinsCloseUp(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure DBPCidadeOrigemDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPCidadeDestinoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPRemetenteDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPDestinatarioDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPExpedidorDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPRecebedorDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPMotoristaCteDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure DBECodProdutoExit(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure DBPDocOriginarioDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPDocOriginarioCodigoChange(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBChaveAcessoClick(Sender: TObject);
    procedure DBPanel4DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure BtMensagemClick(Sender: TObject);
    procedure BtMsgFiscoClick(Sender: TObject);
    procedure InutilizaodeNmerao1Click(Sender: TObject);
    procedure EnviarviaEmail1Click(Sender: TObject);
    procedure ReemitirDacte1Click(Sender: TObject);
    procedure Reconsultar1Click(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure VerRetornodeEnvio1Click(Sender: TObject);
    procedure SBDocInserirClick(Sender: TObject);
    procedure MontaDocOriginario(CodNotaCab: integer);
    procedure DBTSitSefazMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SBDocRemoverClick(Sender: TObject);
    procedure DBECodConhecimentoChange(Sender: TObject);
    procedure ExportarCTesPorPerodo1Click(Sender: TObject);
    procedure BtCopiaClick(Sender: TObject);
    procedure btPlacaConsClick(Sender: TObject);
    procedure DBEFreteValorExit(Sender: TObject);
    procedure DBEPedagioExit(Sender: TObject);
    procedure DBEFretePesoExit(Sender: TObject);
    procedure DBEDespachoExit(Sender: TObject);
    procedure DBEGrisExit(Sender: TObject);
    procedure DBGDocOriginarioDblClick(Sender: TObject);
    procedure EDPlacaChange(Sender: TObject);
    procedure DsVeiculoCteStateChange(Sender: TObject);
    procedure EDPlacaExit(Sender: TObject);
    procedure DBPRemetenteCodigoChange(Sender: TObject);
    procedure DBPDestinatarioCodigoChange(Sender: TObject);
    procedure DBPExpedidorCodigoChange(Sender: TObject);
    procedure DBPRecebedorCodigoChange(Sender: TObject);
    procedure CmbTomadorChange(Sender: TObject);
    procedure RelaodeCTEs1Click(Sender: TObject);
    procedure BTCTeReferenciadoClick(Sender: TObject);
    procedure CMBTipoCteChange(Sender: TObject);
    procedure BTCTeAnulacaoClick(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure DBPTomadorDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPTomadorCodigoChange(Sender: TObject);
    procedure CmbTpServChange(Sender: TObject);
    procedure SBDocAntInserirClick(Sender: TObject);
    procedure DBGDocAnteriorDblClick(Sender: TObject);
    procedure SBNotaCorrecaoClick(Sender: TObject);
    procedure EmitirCartaCorrecaoClick(Sender: TObject);
    procedure DBPanel1DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPTributacaoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPTributacaoCodigoChange(Sender: TObject);
    procedure SBDocAntRemoverClick(Sender: TObject);
    procedure SBSeguradoraClick(Sender: TObject);
    procedure DBPSeguradoraCodigoExit(Sender: TObject);
    procedure DBEFretePorTonExit(Sender: TObject);
    procedure DBRTomaChange(Sender: TObject);
    procedure ConhecimentosComNotasDestinatrios1Click(Sender: TObject);
    procedure DenegarCTe1Click(Sender: TObject);
    procedure VoltarCTeDenegado1Click(Sender: TObject);
    procedure DBPanel3CodigoExit(Sender: TObject);
    procedure DBPanel4BuscaClick(Sender: TObject);
    //procedure BtImportaCTeRefClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SomaValoresConhecimento;
    procedure CalculaICMS;
    procedure PopulaTomador;
  end;

var
  FCteCad: TFCteCad;

implementation

uses UConhecimento_cl, UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl,
  UOperacaoCons, UOperacao_cl, UVeiculoConhecimentoCons, UVeiculoConhecimento_cl, UMensagem_cl,
  UConhecimentoCons, UNotaSaidaCons, UNotaSaida_cl,UUsuario_cl, UMensagemCons,
  UTributacaoCons, UTributacao_cl, USerieCons, USerie_cl, uBiblioteca, UProdutoCons,
  UOracle_cl, UParamSistema_cl, UConhecimento_CP, UContasPagar_cl, UPlanilha_cl,
  UConhecimentoParam, UHistorico_cl, UBancoAgencia_cl, UCaixa_cl, UCidadeCons,
  UProduto_cl, UConhecimento_CR, UContasReceber_cl, UNfe_cl, UCte_Cancela,
  UCteLoteCons, uDocOriginarioParam, uDocOriginarioCad, UExportarCTeParam, StrUtils,
  DateUtils, UImpDadosXMLNFe, URCTE, UDocAnteriorParam, UDocAnteriorCad,
  UImpDadosXML, UCartaCorrecaoCTe, Math, UFmFilial, URConhecimentosCidades;

{$R *.DFM}

procedure TFCteCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    QConhecimentoCad.open;
    QVeiculoCTe.Open;
    QMotoristaCTe.Open;
    QDocOriginario.Open;
    QDocAnterior.Open;
    QNbs.Open;
    QUFPercurso.Open;
    if QConhecimentoCad.RecordCount > 0 then
      MELocalizaExit(Self);
  end;
  DMParamSistema.QParamSistema.Open;
  if FDocAnteriorCad = nil then
    FDocAnteriorCad := TFDocAnteriorCad.Create(Application);
  if FDocOriginarioCad = nil then
    FDocOriginarioCad := TFDocOriginarioCad.Create(Application);
end;

procedure TFCteCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMConhecimento do
  begin
    QConhecimentoCad.Close;
    QConhecimentoCons.Close;
    QVeiculoCTe.Close;
    QMotoristaCTe.Close;
    QDocOriginario.Close;
    QDocAnterior.Close;
    QCaixa.Close;
    QNbs.Close;
    QUFPercurso.Close;
  end;
  DMParamSistema.QParamSistema.Close;
  action := cafree;
  FCteCad := nil;
end;

procedure TFCteCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FConhecimentoCons = nil then
    FConhecimentoCons := TFConhecimentoCons.Create(Application);
  if FConhecimentoCons.ShowModal = mrOk then
  begin
    with DMConhecimento do
    begin
      QConhecimentoCad.Close;
      QConhecimentoCad.SetVariable('PK', QConhecimentoConsCod_Conhecimento.Value);
      QConhecimentoCad.Open;
      MELocalizaExit(Self);
    end;
  end;
  bib.setModelo(DMConhecimento.QConhecimentoCad, lblModelo);
end;

procedure TFCteCad.SBSerieClick(Sender: TObject);
begin
  inherited;
  if FSerieCons = nil then
    FSerieCons := TFSerieCons.Create(Application);
  if FSerieCons.ShowModal = mrOk then
  begin
    DMConhecimento.QConhecimentoCadCod_Serie.Value := DMSerie.QSerieConsCod_Serie.Value;
    DMConhecimento.QConhecimentoCadCOD_SERIE_MODELO.Value := DMSerie.QSerieConsCOD_SERIE_MODELO.Value;
  end;
end;

procedure TFCteCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [Dsinsert, DsEdit] then
  begin
    SBChaveAcesso.Enabled := True;
    CmbTpServ.Enabled := True;
    CmbTomador.Enabled := True;
    CMBTipoCte.Enabled := True;
    CMBResponsavelSeguro.Enabled := True;
    SbSerie.Enabled := True;
    BtMensagem.Enabled := True;
    BtMsgFisco.Enabled := True;
    OracleNavigator1.Enabled := True;
    OracleNavigator2.Enabled := True;
    SBDocInserir.Enabled := True;
    SBDocRemover.Enabled := True;
    SBSeguradora.Enabled := True;
  end
  else
  begin
    SBChaveAcesso.Enabled := False;
    CmbTpServ.Enabled := False;
    CmbTomador.Enabled := False;
    CMBTipoCte.Enabled := False;
    CMBResponsavelSeguro.Enabled := False;
    SbSerie.Enabled := False;
    BtMensagem.Enabled := False;
    BtMsgFisco.Enabled := False;
    OracleNavigator1.Enabled := False;
    OracleNavigator2.Enabled := False;
    SBDocInserir.Enabled := False;
    SBDocRemover.Enabled := False;
    SBSeguradora.Enabled := False;
  end;
  MMCadSimples.Items[2].Enabled := DSPrimario.DataSet.State = dsBrowse;
  //DBLCCstPis.Enabled := not (DSPrimario.DataSet.State = dsBrowse);
  //DBLCCstCofins.Enabled := not (DSPrimario.DataSet.State = dsBrowse);
  //btImportaCte.Enabled := not (DSPrimario.DataSet.State = dsBrowse);
  if DSPrimario.State in [Dsinsert, DsEdit] then
  begin
    EdPlaca.Enabled := True;
    btPlacaCons.Enabled := True;
    EdVeiculo.Enabled := True;
  end
  else
  begin
    EdPlaca.Enabled := False;
    btPlacaCons.Enabled := False;
    EdVeiculo.Enabled := False;
  end;

end;

procedure TFCteCad.ImpressoConhecimento1Click(Sender: TObject);
var
  wLote: Integer;
  wResult, wTipoDocumento, wTipoCT: string;
begin
  inherited;
  with DMConhecimento do
  begin
    wTipoDocumento := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO, TB_CONHECIMENTO',
      'TB_CONHECIMENTO.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO'
      + ' AND TB_CONHECIMENTO.COD_CONHECIMENTO = ' + QConhecimentoCadCOD_CONHECIMENTO.Text);
    if wTipoDocumento = 'N' then //Se operacao nao emite nada, sai da procedure. Diego A. S.
      Exit;
    if wTipoDocumento = 'F' then // Fiscal
    begin
      wTipoCT := QConhecimentoCadCOD_SERIE_MODELO.Value;
      if wTipoCT = '57' then
      begin
        wResult := DMOracle.BuscaNome('SELECT ID_LOTE FROM TB_CTE','COD_CONHECIMENTO = '+QConhecimentoCadCOD_CONHECIMENTO.Text);
        if wResult = '' then
          wLote := 0
        else
          wLote := StrToInt(wResult);
        DMNfe.EmissaoCte(QConhecimentoCadCOD_CONHECIMENTO.Value, wLote, True);
        Exit;
      end; 
    end;
  end;
end;

procedure TFCteCad.DBEdit6Exit(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    if QConhecimentoCadCod_Nota_Cab.Text <> '' then
    begin
      QConhecimentoCadCod_Filial_Destino.Value := StrToInt(DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_NOTA_CAB', 'COD_NOTA_CAB = ' + IntToStr(QConhecimentoCadCod_Nota_Cab.Value), True));
      QConhecimentoCadCod_Cadastro.Value := StrToInt(DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_NOTA_CAB', 'COD_NOTA_CAB = ' + IntToStr(QConhecimentoCadCod_Nota_Cab.Value), True));
      QConhecimentoCadVal_Nota.Value := StrToFloat('0' + DMOracle.BuscaNome('SELECT sum(tb_nota_item.val_total) FROM TB_NOTA_CAB, TB_NOTA_ITEM', 'TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB AND TB_NOTA_CAB.COD_NOTA_CAB = ' + IntToStr(QConhecimentoCadCod_Nota_Cab.Value)));
      QConhecimentoCadQT_Nota.Value := StrToFloat('0' + DMOracle.BuscaNome('SELECT sum(TB_NOTA_ITEM.QT_QUANTIDADE) FROM TB_NOTA_CAB, TB_NOTA_ITEM', 'TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB AND TB_NOTA_CAB.COD_NOTA_CAB = ' + IntToStr(QConhecimentoCadCod_Nota_Cab.Value)));
    end;
  end;
end;

procedure TFCteCad.SBConfirmarClick(Sender: TObject);
var wSerie, wRamo_Oper, wRamo_Classe, wProduto, wClasse, wProprietario: string;
begin
  if DMOperacao.QOperacao.Eof then
  begin
    DMOperacao.QOperacao.Close;
    DMOperacao.QOperacao.SetVariable('Pk', DMNotaSaida.QNotaSaidaCod_Operacao.Value);
    DMOperacao.QOperacao.Open;
  end
  else
    DMOperacao.QOperacao.RefreshRecord;
  if DMCadastro.QCadastro.Eof then
  begin
    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('Pk', DMNotaSaida.QNotaSaidaCod_Cadastro.Value);
    DMCadastro.QCadastro.Open;
  end
  else
    DMCadastro.QCadastro.RefreshRecord;
//  DmUsuario.Checar_Filial_Usuario(Trim(DMConhecimento.QConhecimentoCadCOD_FILIAL.Text),'CONHECIMENTO');
//  If DMconhecimento.QConhecimentoCadCod_Filial.Value <> DMUsuario.CodFilialUsuario then
//     Raise exception.Create ('Usuario Não Liberado Para Operar Nesta Filial');
  if not DMUsuario.ContabilPrivilegiado then
    if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Text <> '' then
      if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaSaida.QNotaSaidaDt_Emissao.Value then
        raise Exception.Create('Não é Permitido Lançar Esta Nota - Fechamento Contabil');

  //wProprietario := DMOracle.BuscaNome('SELECT COD_PROPRIETARIO FROM TB_VEICULO_CONHECIMENTO', 'DESC_PLACA = ' + Chr(39) + DMconhecimento.QConhecimentoCadDesc_Placa.Value + Chr(39));
  //if (DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PROPRIETARIO', 'COD_PROPRIETARIO = ' + wProprietario)) = 'D' then
    //raise Exception.Create('Proprietário com cadastro desativado');

  //if (DMOracle.BuscaNome('SELECT DESC_INSCRICAO_IDENTIDADE FROM TB_PROPRIETARIO', 'COD_PROPRIETARIO = ' + wProprietario)) = '' then
    //raise Exception.Create('Preencher Inscricao Estadual/Identidade no cadastro Proprietário');

  wSerie := DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_OPERACAO', 'COD_OPERACAO = ' + IntToStr(DMconhecimento.QConhecimentoCadCOD_OPERACAO.Value));
  if (wSerie <> '') and (wSerie <> DMconhecimento.QConhecimentoCadCod_Serie.Value) then
    raise Exception.Create('Não é Permitido Lançar Com Esta Operação' + Chr(13) + 'Checar Série para conhecimento de frete');
  wRamo_Oper := DMOracle.BuscaNome('SELECT COD_RAMO FROM TB_OPERACAO', 'COD_OPERACAO = ' + IntToStr(DMconhecimento.QConhecimentoCadCOD_OPERACAO.Value));
  //if DMconhecimento.QConhecimentoCadCOD_NOTA_CAB.Text <> '' then
//  begin
//    wProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_NOTA_ITEM', 'COD_NOTA_CAB = ' + IntToStr(DMconhecimento.QConhecimentoCadCOD_NOTA_CAB.Value));
//    wClasse := DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_PRODUTO', 'COD_PRODUTO = ' + wProduto);
//    wRamo_Classe := DMOracle.BuscaNome('SELECT COD_RAMO FROM TB_CLASSE', 'COD_CLASSE = ' + wClasse);
//    if wRamo_Classe <> wRamo_Oper then
//      raise Exception.Create('Não é Permitido Lançar está Operação para Esta Nota Fiscal' + Chr(13) + 'Checar ramo da classe do produto com ramo do cadastro de operação');
  //end;
  Panel1.SetFocus;
  with DMConhecimento do
  begin
    QConhecimentoCadIND_TIPO_CTE.Value := CMBTipoCte.ItemIndex;
    QConhecimentoCadIND_TIPO_SERVICO.Value := CmbTpServ.ItemIndex;
    QConhecimentoCadIND_TOMADOR_SERVICO.Value := CmbTomador.ItemIndex;
    QConhecimentoCadIND_RESP_SEGURO.Value := CMBResponsavelSeguro.ItemIndex;
    case CMBTipoCte.ItemIndex of
      0:
      begin
        QConhecimentoCadCOD_CONHECIMENTO_REF.Value := 0;
        QConhecimentoCadCOD_CTE_ANULACAO_REF.Value := 0;
      end;
      1:if QConhecimentoCadCOD_CONHECIMENTO_REF.Value = 0 then
        begin
         TabSheet5.TabVisible := true;
         pagecontrol1.TabIndex := 4;
         DBECodCTeReferenciado.SetFocus;
         raise Exception.Create('Selecione o CT-e a ser complementado.');
        end;
     2:if QConhecimentoCadCOD_CONHECIMENTO_REF.Value = 0 then
       begin
         TabSheet5.TabVisible := true;
         pagecontrol1.TabIndex := 4;
         DBECodCTeReferenciado.SetFocus;
         raise Exception.Create('Selecione o CT-e a ser anulado.');
       end;
      3:
      begin
        if QConhecimentoCadCOD_CONHECIMENTO_REF.Value = 0 then
        begin
         TabSheet5.TabVisible := true;
         pagecontrol1.TabIndex := 4;
         DBECodCTeReferenciado.SetFocus;
         raise Exception.Create('Selecione o CT-e a ser substituído.');
        end;
        if QConhecimentoCadIND_TOMA_ICMS.Value = 'N' then
        begin
          if QConhecimentoCadCOD_CTE_ANULACAO_REF.Value = 0 then
          begin
           TabSheet5.TabVisible := true;
           pagecontrol1.TabIndex := 4;
           DBECodCTeAnulacao.SetFocus;
           raise Exception.Create('Selecione o CT-e de anulação emitido anteriormente.');
          end;
        end
        else
        begin
          if Trim(QConhecimentoCadDESC_CHAVE_ACESSO_REF.Value) = '' then
          begin
            TabSheet5.TabVisible := true;
            pagecontrol1.TabIndex := 4;
            DBEChaveAcessoRef.SetFocus;
            raise Exception.Create('Digite a chave de acesso da NF-e, ou CT-e de anulação emitido(a) pelo tomador do serviço.');
          end;
        end;
      end;
    end;
  end;
  inherited;
  DMOracle.DBCemapa.Commit;
  bib.setModelo(DMConhecimento.QConhecimentoCad, lblModelo);
end;

procedure TFCteCad.SBExcluirClick(Sender: TObject);
begin
  if MessageDlg('Apagar Este Conhecimento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if (not DMConhecimento.QConhecimentoCadDESC_CHAVE_ACESSO_CTE.IsNull) then
    begin

      DMNfe.SetaCte(DMConhecimento.QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Value);
      if (StrToInt('0' + DMNfe.QCteSIT_CTE.Value) in SIT_CTE_ACEITO) and (DMConhecimento.QConhecimentoCadIND_AMBIENTE_CTE.Value = 1) then
      begin
        MessageDlg( 'Este CT-e está registrado na SEFAZ.' + #13 + #10 +
          'Não é permitida a sua exclusão.', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    DMConhecimento.ExcluiConhecimento;
  end;
end;

procedure TFCteCad.Confirma1Click(Sender: TObject);
var
  wPercICM, wPercAliqSubs, wBaseAliqSubs,wAuxBase, wTotal, wIcm: Real;
  wFisica_Juridica, wVal_Inss, wDesc_Inss, wNumDoc, wContaCred, wContaDeb: string;
  wCodDoc, wCodHistorico, wVlrLancto, wCodCompl: Real;
  wFilial, wProprietario: Integer;
  wDtLancto, wData: TDateTime;
  wSaldo, wValor_Base, wValor_Base_1, wIRF, wSaldo_IRF, wVlInss_Pg, wVlInss: real;
  wMes, wAno, wDia: Word;
begin
  inherited;
  //colocado este teste para não permitir emitir nota fiscal de clientes que não estão pagando o sistema - Cesar Angonese
  if DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_FILIAL', 'COD_FILIAL = ' + DMConhecimento.QConhecimentoCadCod_Filial.Text) = 'C' Then
     raise Exception.Create('Cliente com pendência financeira - Favor entrar em contato com Cemapa');

  If DMConhecimento.QConhecimentoCadInd_Situacao.Value <> '1' Then
     Raise Exception.Create('Conhecimento está Confirmado ou Cancelado');
  with DMConhecimento do
  begin    
    if(QConhecimentoCadNUM_PESO_BRUTO.Value = 0) and
      (QConhecimentoCadNUM_PESO_BC.Value = 0) and
      (QConhecimentoCadNUM_PESO_AFERIDO.Value = 0) and
      (QConhecimentoCadQT_VOLUMES.Value = 0) and
      (QConhecimentoCadNUM_CUBAGEM.Value = 0) then
      raise Exception.Create('Preencha pelo menos um dos campos de quantidade na aba Carga (Peso Bruto, Peso BC, Peso Aferido, Volumes e Cubagem).');

    if (QVeiculoCTe.RecordCount = 0) and
       (DMOracle.FastSelect('desc_versao_cte','tb_filial','cod_filial = ' +
        QConhecimentoCadCOD_FILIAL.Text) = '2.00') then
      raise Exception.Create('Insira o(s) veículo(s) utilizados no transporte na aba Rodoviário.');

    if (QDocOriginario.RecordCount = 0) and ((QConhecimentoCadIND_TIPO_CTE.Value = 0) or (QConhecimentoCadIND_TIPO_CTE.Value = 3)) then
      raise Exception.Create('Insira os documentos originários, notas fiscais da carga.');

    if QConhecimentoCadVAL_TOTAL_CTE.Value = 0 then
      if MessageDlg('O valor total do CT-e está zerado, deseja continuar mesmo assim?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        Exit;

    if QConhecimentoCadVAL_TOTAL_CARGA.Value = 0 then
      if MessageDlg('O valor total da carga está zerado, deseja continuar mesmo assim?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        Exit;

    if CmbTpServ.ItemIndex > 0 then
      if QDocAnterior.RecordCount = 0 then
        raise Exception.Create('Para CT-e de Redespacho ou de Subcontratação é obrigatório inserir os documentos anteriores, conhecimentos de transporte gerados anteriormente.');

  end;
  wVlrLancto := 0;
  DMOracle.DBCemapa.StartTransaction;
  try
    with DMConhecimento do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(QConhecimentoCadCOD_FILIAL.Text), 'CONHECIMENTO');
      QConhecimentoCad.Edit;
      if QConhecimentoCadNum_Conhecimento.Value = 0 then
        QConhecimentoCadNum_Conhecimento.Value := DMSerie.NumeroSerie(QConhecimentoCadCod_Filial.Value, QConhecimentoCadCod_Serie.Value,
          QConhecimentoCadCOD_SERIE_MODELO.Value);
      if FConhecimento_CP = nil then
         FConhecimento_CP := TFConhecimento_CP.Create(Application);
      if FConhecimento_CR = nil then
         FConhecimento_CR := TFConhecimento_CR.Create(Application);
      wIrf := 0;
      with DMConhecimento do
      begin
        DMOperacao.QOperacao.Close;
        DMOperacao.QOperacao.SetVariable('PK', QConhecimentoCadCod_Operacao.Text);
        DMOperacao.QOperacao.Open;
        wVlInss := 0;
        wVlInss_Pg := 0;
        QConhecimentoCadVal_IRF.Value := 0;

        DecodeDate(QConhecimentoCadDt_Emissao.Value, wAno, wMes, wDia);
        wData := StrToDate('01/' + (IntToStr(wMes)) + '/' + (IntToStr(wAno)));
      end;
      if QConhecimentoCadIND_FORMA_PGTO.Value = 1 then
      begin //Solicitado pela Tânia - Friella: Quando for pago, não gerar contas a receber nem contas a pagar. Diego A. S. 10/09/2010
        
        If (FConhecimento_CR.ShowModal = MrOk) Then
          with DMContasReceber do //Gerar Contas a Receber do cliente pagador
          begin
            QContasReceber_Mov.Close;
            QContasReceber_Cab.Close;
            QContasReceber_Cab.Open;
            QContasReceber_Mov.Open;
            QContasReceber_Cab.Insert;
            if Trim(FConhecimento_CR.FmFinalidade.MeFinalidade.Text) <> '' then
              QContasReceber_CabCOD_FINALIDADE.Value := StrToInt(Trim(FConhecimento_CR.FmFinalidade.MeFinalidade.Text));
            if Trim(FConhecimento_CR.FMBanco.MeBanco.Text) <> '' then
              QContasReceber_CabCOD_BANCO_AGENCIA.Value := StrToInt(Trim(FConhecimento_CR.FMBanco.MeBanco.Text));
            if Trim(FConhecimento_CR.FmContaCorrente.MeContaCorrente.Text) <> '' then
              QContasReceber_CabCOD_CONTA_CORRENTE.Value := StrToInt(Trim(FConhecimento_CR.FmContaCorrente.MeContaCorrente.Text));
            if Trim(FConhecimento_CP.MECodDepartamento.Text) <> '' then
              QContasReceber_CabCOD_DEPARTAMENTO.Value := StrToInt(Trim(FConhecimento_CR.FmDepartamento.MeDepartamento.Text));
            QContasReceber_CabCOD_CADASTRO.Value := QConhecimentoCadCOD_CADASTRO_TOMADOR.Value;
            QContasReceber_CabCOD_FILIAL.Value := QConhecimentoCadCOD_FILIAL.Value;
            QContasReceber_CabDESC_TIPO_DOCUMENTO.Value := 'FRE';
            QContasReceber_CabDT_EMISSAO.Value := QConhecimentoCadDT_EMISSAO.value;
            QContasReceber_CabDT_VENCIMENTO.Value := StrToDate(FConhecimento_CR.MEDtVencimento.Text);
           
            QContasReceber_CabVAL_TITULO.Value := QConhecimentoCadVAL_A_RECEBER.Value;
            QContasReceber_CabNUM_TITULO.Value := QConhecimentoCadNUM_CONHECIMENTO.Value;
            QContasReceber_CabIND_SITUACAO.Value := 'ABERTO';
            QContasReceber_CabDESC_OBSERVACAO.Value := 'Referente ao Conhecimento nr.' +
              QConhecimentoCadNUM_CONHECIMENTO.Text;
            QContasReceber_Cab.Post;
            QConhecimentoCadCOD_CONTA_RECEBER_CAB.Value := QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
            QContasReceber_Mov.Close;
            QContasReceber_Cab.Close;
          end
        Else
          Begin
            DMConhecimento.QConhecimentoCad.Cancel;
            DMContasPagar.QContasPagar_Cab.Cancel;
            DMContasPagar.QContasPagar_Mov.Cancel;
            DMOracle.DBCemapa.Rollback;
            Exit;
          End;
      end;
      if QConhecimentoCadIND_FORMA_PGTO.Value = 0 then
      begin
        AtuCaixa( QConhecimentoCadVAL_TOTAL_CTE.Value, QConhecimentoCadCOD_OPERACAO.Text,
            QConhecimentoCadCOD_FILIAL.Text,'',QConhecimentoCadNUM_CONHECIMENTO.Text,
            QConhecimentoCadCOD_CADASTRO_TOMADOR.Text,QConhecimentoCadCOD_CONHECIMENTO.Text,
            QConhecimentoCadDT_EMISSAO.Value);
      end;
      //Calcula Pis e Cofins
      QConhecimentoCadVAL_PIS.Value := (((QConhecimentoCadVAL_FRETE.Value * DMOperacao.QOperacaoPERC_BASE_PIS.Value) / 100) *
          DMParamSistema.QParamSistemaPERC_PIS.Value / 100);
      QConhecimentoCadVAL_COFINS.Value := (((QConhecimentoCadVAL_FRETE.Value * DMOperacao.QOperacaoPERC_BASE_COFINS.Value) / 100) *
          DMParamSistema.QParamSistemaPERC_COFINS.Value / 100);

      if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
      begin
        if (DMOperacao.QOperacaoCOD_CONTABIL_IRRF_CRED.Text <> '') and
          (DMOperacao.QOperacaoCOD_CONTABIL_IRRF_DEB.Text <> '') and
          (QConhecimentoCadVal_Irf.Value <> 0) then
        begin
          wCodDoc := QConhecimentoCadCOD_CONHECIMENTO.Value;
          wNumDoc := FloatToStr(QConhecimentoCadNUM_CONHECIMENTO.Value);
          wFilial := QConhecimentoCadCOD_FILIAL.Value;
          wContaCred := DMOperacao.QOperacaoCOD_CONTABIL_IRRF_CRED.Value;
          wContaDeb := DMOperacao.QOperacaoCOD_CONTABIL_IRRF_DEB.Value;
          wCodCompl := QConhecimentoCadCOD_CADASTRO.Value;
          wCodHistorico := DMOperacao.QOperacaoCOD_HISTORICO_CONTABIL.Value;
          wVlrLancto := QConhecimentoCadVAL_IRF.Value;
          wDtLancto := QConhecimentoCadDT_EMISSAO.Value;
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        end;
        if (QConhecimentoCadVal_Frete.Value <> 0) then
        begin
          wCodDoc := QConhecimentoCadCOD_CONHECIMENTO.Value;
          wNumDoc := FloatToStr(QConhecimentoCadNUM_CONHECIMENTO.Value);
          wFilial := QConhecimentoCadCOD_FILIAL.Value;
          If QConhecimentoCadIND_FORMA_PGTO.Value = 0 then
           Begin
             wContaCred := DMOperacao.QOperacaoCOD_CONT_VAL_NOTA_CRED_AVISTA.Value;
             wContaDeb := DMOperacao.QOperacaoCOD_CONTABIL_VAL_NOTA_DEB.Value;
           End
          Else
           Begin
             wContaCred := DMOperacao.QOperacaoCOD_CONTABIL_VAL_NOTA_CRED.Value;
             wContaDeb := DMOperacao.QOperacaoCOD_CONTABIL_VAL_NOTA_APRAZO.Value;
           End;
          wCodCompl := QConhecimentoCadCOD_CADASTRO_TOMADOR.Value;
          wCodHistorico := DMOperacao.QOperacaoCOD_HISTORICO_CONTABIL.Value; // retirado por solicitacao do João
          wVlrLancto := QConhecimentoCadVAL_FRETE.Value + QConhecimentoCadVAL_SEGURO.Value - QConhecimentoCadVAL_INSS_FORNECEDOR.Value -
            QConhecimentoCadVAL_SEST_SENAT.Value - QConhecimentoCadVAL_FALTA_MERCADORIA_CHEGADA.Value - QConhecimentoCadVAL_IRF.Value -
            QConhecimentoCadVAL_CONTABIL.Value;
          wDtLancto := QConhecimentoCadDT_EMISSAO.Value;
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        end;
        if (DMOperacao.QOperacaoCOD_CONTABIL_INSS_CRED.Text <> '') and
          (DMOperacao.QOperacaoCOD_CONTABIL_INSS_DEB.Text <> '') and
          (QConhecimentoCadVAL_INSS_FORNECEDOR.Value <> 0) then
        begin
          wCodDoc := QConhecimentoCadCOD_CONHECIMENTO.Value;
          wNumDoc := FloatToStr(QConhecimentoCadNUM_CONHECIMENTO.Value);
          ;
          wFilial := QConhecimentoCadCOD_FILIAL.Value;
          wContaCred := DMOperacao.QOperacaoCOD_CONTABIL_INSS_CRED.Value;
          wContaDeb := DMOperacao.QOperacaoCOD_CONTABIL_INSS_DEB.Value;
          wCodCompl := QConhecimentoCadCOD_CADASTRO_TOMADOR.Value;
          wCodHistorico := DMOperacao.QOperacaoCOD_HISTORICO_CONTABIL.Value;
          wVlrLancto := QConhecimentoCadVAL_INSS_FORNECEDOR.Value;
          wDtLancto := QConhecimentoCadDT_EMISSAO.Value;
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        end;

        if (DMOperacao.QOperacaoCOD_CONTABIL_FRETE_ICMS_CRED.Text <> '') and
          (DMOperacao.QOperacaoCOD_CONTABIL_FRETE_ICMS_DEB.Text <> '') and
          (QConhecimentoCadVAL_ICMS.Value <> 0) then
        begin
          wCodDoc := QConhecimentoCadCOD_CONHECIMENTO.Value;
          wNumDoc := FloatToStr(QConhecimentoCadNUM_CONHECIMENTO.Value);
          ;
          wFilial := QConhecimentoCadCOD_FILIAL.Value;
          wContaCred := DMOperacao.QOperacaoCOD_CONTABIL_FRETE_ICMS_CRED.Value;
          wContaDeb := DMOperacao.QOperacaoCOD_CONTABIL_FRETE_ICMS_DEB.Value;
          wCodCompl := QConhecimentoCadCOD_CADASTRO_TOMADOR.Value;
          wCodHistorico := DMOperacao.QOperacaoCOD_HISTORICO_CONTABIL.Value;
          wVlrLancto := QConhecimentoCadVAL_ICMS.Value;
          wDtLancto := QConhecimentoCadDT_EMISSAO.Value;
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        end;

        if (DMOperacao.QOperacaoCOD_CONTABIL_SEST_CRED.Text <> '') and
          (DMOperacao.QOperacaoCod_Contabil_Sest_Deb.Text <> '') and
          (QConhecimentoCadVal_Sest_Senat.Value <> 0) then
        begin
          wCodDoc := QConhecimentoCadCod_Conhecimento.Value;
          wNumDoc := FloatToStr(QConhecimentoCadNum_Conhecimento.Value);
          ;
          wFilial := QConhecimentoCadCod_Filial.Value;
          wContaCred := DMOperacao.QOperacaoCod_Contabil_Sest_Cred.Value;
          wContaDeb := DMOperacao.QOperacaoCod_Contabil_Sest_Deb.Value;
          wCodCompl := QConhecimentoCadCOD_CADASTRO_TOMADOR.Value;
          wCodHistorico := DMOperacao.QOperacaoCod_Historico_Contabil.Value;
          wVlrLancto := QConhecimentoCadVAL_SEST_SENAT.Value;
          wDtLancto := QConhecimentoCadDt_Emissao.Value;
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        end;
        if (DMOperacao.QOperacaoCod_Contabil_Pedagio_Cred.Text <> '') and
          (DMOperacao.QOperacaoCod_Contabil_Pedagio_Deb.Text <> '') and
          (QConhecimentoCadVal_Pedagio.Value <> 0) then
        begin
          DMHistorico.QHistorico.Close;
          DMHistorico.QHistorico.SetVariable('Pk',Trim(FConhecimento_CP.FmHistorico.MEHistorico.Text));
          DMHistorico.QHistorico.Open;
                        wCodDoc := QConhecimentoCadCod_Conhecimento.Value;
          wNumDoc := FloatToStr(QConhecimentoCadNum_Conhecimento.Value);
          ;
          wFilial := QConhecimentoCadCod_Filial.Value;
          wContaCred := DMOperacao.QOperacaoCod_Contabil_Pedagio_Cred.Value;
          wContaDeb := DMOperacao.QOperacaoCod_Contabil_Pedagio_Deb.Value;
          wCodCompl := QConhecimentoCadCOD_CADASTRO_TOMADOR.Value;
          wCodHistorico := DMOperacao.QOperacaoCod_Historico_Contabil.Value;
          wVlrLancto := QConhecimentoCadVal_Pedagio.Value;
          wDtLancto := QConhecimentoCadDt_Emissao.Value;
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        end;
        if (DMOperacao.QOperacaoCOD_CONTABIL_PIS_CRED.Value <> '') and
            (DMOperacao.QOperacaoCOD_CONTABIL_PIS_DEB.Value <> '') and
            (DMOperacao.QOperacaoCOD_HISTORICO_CONTABIL_PIS.Text <> '') and
            (DMOperacao.QOperacaoPERC_BASE_PIS.Text <> '') then
        begin
          wNumDoc := FloatToStr(QConhecimentoCadNum_Conhecimento.Value);
          wFilial := QConhecimentoCadCod_Filial.Value;
          wContaCred := DMOperacao.QOperacaoCOD_CONTABIL_PIS_CRED.Value;
          wContaDeb := DMOperacao.QOperacaoCOD_CONTABIL_PIS_DEB.Value;
          wCodCompl := QConhecimentoCadCod_Motorista.Value;
          wCodHistorico := DMOperacao.QOperacaoCOD_HISTORICO_CONTABIL_PIS.Value;
          wVlrLancto := (((QConhecimentoCadVAL_FRETE.Value * DMOperacao.QOperacaoPERC_BASE_PIS.Value) / 100) *
            DMParamSistema.QParamSistemaPERC_PIS.Value / 100);
          wDtLancto := QConhecimentoCadDt_Emissao.Value;
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        end;
        if (DMOperacao.QOperacaoCOD_CONTABIL_COFINS_CRED.Value <> '') and
          (DMOperacao.QOperacaoCOD_CONTABIL_COFINS_DEB.Value <> '') and
          (DMOperacao.QOperacaoCOD_HISTORICO_CONTABIL_COFINS.Text <> '') and
          (DMOperacao.QOperacaoPERC_BASE_COFINS.Text <> '') then
        begin
          wNumDoc := FloatToStr(QConhecimentoCadNum_Conhecimento.Value);
          wFilial := QConhecimentoCadCod_Filial.Value;
          wContaCred := DMOperacao.QOperacaoCOD_CONTABIL_COFINS_CRED.Value;
          wContaDeb := DMOperacao.QOperacaoCOD_CONTABIL_COFINS_DEB.Value;
          wCodCompl := QConhecimentoCadCod_Motorista.Value;
          wCodHistorico := DMOperacao.QOperacaoCOD_HISTORICO_CONTABIL_COFINS.Value;
          wVlrLancto := (((QConhecimentoCadVAL_FRETE.Value * DMOperacao.QOperacaoPERC_BASE_COFINS.Value) / 100) *
            DMParamSistema.QParamSistemaPERC_COFINS.Value / 100);
          wDtLancto := QConhecimentoCadDt_Emissao.Value;
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
          DMPlanilha.GravaLanc('RPA', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        end;
      end;
      QConhecimentoCadInd_Situacao.Value := '2';
      QConhecimentoCad.Post;
      ImpressoConhecimento1Click(Self);
      DMOracle.DBCemapa.Commit;
      QConhecimentoCad.RefreshRecord;
    end;
  except
    DMConhecimento.QConhecimentoCad.Cancel;
    DMContasPagar.QContasPagar_Cab.Cancel;
    DMContasPagar.QContasPagar_Mov.Cancel;
    DMOracle.DBCemapa.Rollback;
    raise;
  end;
  // Adicionado por Djeison - Atualizar Registro após confirmação - 02/08/2013
  DMConhecimento.QConhecimentoCad.Refresh;
end;

procedure TFCteCad.VoltarConfirmao1Click(Sender: TObject);
begin
  inherited;
  if DMConhecimento.QConhecimentoCadNum_Conhecimento.Value <> 0 then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(DMConhecimento.QConhecimentoCadCOD_FILIAL.Text), 'CONHECIMENTO');
    if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMconhecimento.QConhecimentoCadDt_Emissao.Value then
      raise Exception.Create('Não é Permitido Voltar Este Conhecimento - Fechamento Contabil');
    DMOracle.DBCemapa.StartTransaction;
    try
      with DMContasPagar do
      begin
        QContasPagar_Cab.Close;
        QContasPagar_Mov.Close;
        QContasPagar_Cab.SetVariable('Pk', DMConhecimento.QConhecimentoCadCod_Conta_Pagar_Cab.Value);
        QContasPagar_Cab.Open;
        QContasPagar_Mov.Open;
        DMConhecimento.QConhecimentoCad.Edit;
        DMConhecimento.QConhecimentoCadInd_Situacao.Value := '1';
        DMConhecimento.QConhecimentoCadCod_Conta_Pagar_Cab.Text := '';
        DMConhecimento.QConhecimentoCad.Post;
        while not QContasPagar_Cab.Eof do
        begin
          while not QContasPagar_Mov.Eof do
            if QContasPagar_MovIND_TIPO_MOVIMENTO.Value <> '' then
              if (QContasPagar_MovIND_TIPO_MOVIMENTO.Value <> 'PRINCIPAL') then
                raise Exception.Create('Conta a Pagar com baixas!')
              else
                QContasPagar_Mov.Delete;
          QContasPagar_Cab.Delete;
        end;
      end;
      with DMContasReceber do
      begin
        QContasReceber_Cab.Close;
        QContasReceber_Mov.Close;
        QContasReceber_Cab.SetVariable('Pk', DMConhecimento.QConhecimentoCadCOD_CONTA_RECEBER_CAB.Value);
        QContasReceber_Cab.Open;
        QContasReceber_Mov.Open;
        DMConhecimento.QConhecimentoCad.Edit;
        DMConhecimento.QConhecimentoCadCOD_CONTA_RECEBER_CAB.Text := '';
        DMConhecimento.QConhecimentoCad.Post;
        DMOracle.DBCemapa.Commit;
        while not QContasReceber_Cab.Eof do
        begin
          while not QContasReceber_Mov.Eof do
            if QContasReceber_MovIND_TIPO_MOVIMENTO.Value <> '' then
            begin
              if (QContasReceber_MovIND_TIPO_MOVIMENTO.Value <> 'PRINCIPAL') then
                raise Exception.Create('Conta a Receber com baixas!')
              else
                QContasReceber_Mov.Delete;
            end;
          QContasReceber_Cab.Delete;
        end;
      end;
      DMPlanilha.Descontabiliza(DMConhecimento.QConhecimentoCadCod_Conhecimento.Value, 'RPA');
      if DMConhecimento.QConhecimentoCadCod_Bco_Movimento.Value <> Null then
      begin
        DMBancoAgencia.QBancoMovimento.Close;
        DMBancoAgencia.QBancoMovimento.SetVariable('Pk', DMConhecimento.QConhecimentoCadCod_Bco_Movimento.Value);
        DMBancoAgencia.QBancoMovimento.Open;
        if not (DMBancoAgencia.QBancoMovimento.Eof) then
          DMBancoAgencia.QBancoMovimento.Delete;
      end;
      with DMConhecimento do
      begin
        // Voltar Caixa
        QCaixa.Close;
        QCaixa.Open;
        while not QCaixa.Eof do
          QCaixa.Delete;
        QCaixa.Close;
      end;
      DMOracle.Audit(TOracleDataset1(DSPrimario.Dataset), 'Volta Confirmação');
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      DMContasPagar.QContasPagar_Cab.Close;
      DMContasPagar.QContasPagar_Mov.Close;
      DMConhecimento.QConhecimentoCad.Close;
      DMConhecimento.QConhecimentoCad.Open;
      raise;
    end;
  end;
end;

procedure TFCteCad.DBEdit36Change(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    MMCadSimples.Items[2].Items[0].Enabled := QConhecimentoCadInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[1].Enabled := QConhecimentoCadInd_Situacao.Value = '2';
    MMCadSimples.Items[2].Items[2].Enabled := QConhecimentoCadInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[3].Enabled := QConhecimentoCadInd_Situacao.Value = '3';
  end;
end;

procedure TFCteCad.VoltarCancelamento1Click(Sender: TObject);
begin
  inherited;
  if DMConhecimento.QConhecimentoCadInd_Situacao.Value <> '3' then
    raise Exception.Create('Este conhecimento não foi cancelado!');
  with DMConhecimento do
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(QConhecimentoCadCOD_FILIAL.Text), 'CONHECIMENTO');
    try
      DMOracle.DBCemapa.StartTransaction;
      QConhecimentoCad.Edit;
      QConhecimentoCadInd_Situacao.Value := '1';
      QConhecimentoCad.Post;

      DMOracle.DBCemapa.Commit;
    except
      if QConhecimentoCad.State <> dsBrowse then
        QConhecimentoCad.Cancel;
      raise Exception.Create('Não é possível voltar cancelamento deste Conhecimento!');
    end;
  end;
end;

procedure TFCteCad.Cancela1Click(Sender: TObject);
begin
  inherited;
  if DMConhecimento.QConhecimentoCadInd_Situacao.Value = '2' then
    raise Exception.Create('Não é possivel cancelar um conhecimento confirmado!');
  if DMConhecimento.QConhecimentoCadInd_Situacao.Value = '3' then
    raise Exception.Create('Este Conhecimento já está cancelado!');
  if DMConhecimento.QConhecimentoCadNUM_CONHECIMENTO.Value = 0 then
    raise Exception.Create('Não é possível cancelar um conhecimento que não foi confirmado.' +
      #13 + #10 + 'Para se desfazer deste conhecimento basta excluir.');
  if FCte_Cancela = nil then
    FCte_Cancela := TFCte_Cancela.Create(Application);
  If DMConhecimento.QConhecimentoCadDESC_CHAVE_ACESSO_CTE.IsNull Then
     FCte_Cancela.CBEmail.Checked := False
  Else
     FCte_Cancela.CBEmail.Checked := True;
  FCte_Cancela.ShowModal;
  DSPrimario.DataSet.Refresh;
end;

procedure TFCteCad.SBAlterarClick(Sender: TObject);
begin
  if DMConhecimento.QConhecimentoCadInd_Situacao.Value <> '1' then
    raise Exception.Create('Somente Alterar Conhecimento - Digitado')
  else
    inherited;
end;

procedure TFCteCad.DBLCCstPisCloseUp(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    if QCstpisCOD_CST_PIS.Value = '' then
      QConhecimentoCadCOD_CST_PIS.Clear;
  end;
end;

procedure TFCteCad.DBLCCstCofinsCloseUp(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    if QCstCofinsCOD_CST_COFINS.Value = '' then
      QConhecimentoCadCOD_CST_COFINS.Clear;
  end;
end;

procedure TFCteCad.SBIncluirClick(Sender: TObject);
var title: String;
begin
  inherited;
  with DMParamSistema, DMConhecimento do
  begin
    if QParamSistema.State = dsInactive then
      QParamSistema.Open;
    if not QParamSistemaCOD_CST_PIS_FRETE.IsNull then
    begin
      QConhecimentoCadCOD_CST_PIS.Value :=
        QParamSistemaCOD_CST_PIS_FRETE.Value;
      //DBLCCstPis.KeyValue := QParamSistemaCOD_CST_PIS_FRETE.Value;
    end;
    if not QParamSistemaCOD_CST_COFINS_FRETE.IsNull then
    begin
      QConhecimentoCadCOD_CST_COFINS.Value :=
        QParamSistemaCOD_CST_COFINS_FRETE.Value;
      //DBLCCstCofins.KeyValue := QParamSistemaCOD_CST_COFINS_FRETE.Value;
    end;
  end;
  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then
    CmbTomador.ItemIndex := 3;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  title := FCadastroCons.Caption;
  FCadastroCons.Caption := 'Selecione o Remetente';
  (DBPRemetente.Components[3] as TSpeedButton).Click;
  
  FCadastroCons.Caption := 'Selecione o Destinatário';
  (DBPDestinatario.Components[3] as TSpeedButton).Click;
  FCadastroCons.Caption := title;
end;

procedure TFCteCad.DBPCidadeOrigemDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCidadeCons;
  Classe := TFCidadeCons;
end;

procedure TFCteCad.DBPCidadeDestinoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCidadeCons;
  Classe := TFCidadeCons;
end;

procedure TFCteCad.DBPRemetenteDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFCteCad.DBPDestinatarioDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFCteCad.DBPExpedidorDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFCteCad.DBPRecebedorDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFCteCad.DBPMotoristaCteDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFCteCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    DMConhecimento.QConhecimentoCadCOD_PRODUTO.Value := DMProduto.QProdutoConsCOD_PRODUTO.Value;
    FCteCad.DBECodProdutoExit(Sender);
  end;
end;

procedure TFCteCad.DBECodProdutoExit(Sender: TObject);
var
  cstPis: String;
  cstCofins: String;
begin
  inherited;
  if (DsPrimario.State <> DSBrowse) and
    (DMConhecimento.QConhecimentoCadCod_Produto.text <> '') then
  begin
    cstPis := DMOracle.BuscaNome('SELECT COD_CST_PIS FROM TB_OPERACAO', 'COD_OPERACAO = '+
      DMConhecimento.QConhecimentoCadCOD_OPERACAO.Text);
    if cstPis = '' then
      cstPis := DMOracle.BuscaNome('SELECT COD_CST_PIS_SAIDA FROM TB_PRODUTO', 'COD_PRODUTO = '+
        DMConhecimento.QConhecimentoCadCOD_PRODUTO.Text);
    if(cstPis <> '') then
    begin
      //FCteCad.DBLCCSTPis.KeyValue := cstPis;
      DMConhecimento.QConhecimentoCadCOD_CST_PIS.Value := cstPis;
    end;

    cstCofins := DMOracle.BuscaNome('SELECT COD_CST_COFINS FROM TB_OPERACAO', 'COD_OPERACAO = '+
      DMConhecimento.QConhecimentoCadCOD_OPERACAO.Text);
    if cstCofins = '' then
      cstCofins := DMOracle.BuscaNome('SELECT COD_CST_COFINS_SAIDA FROM TB_PRODUTO', 'COD_PRODUTO = '+
        DMConhecimento.QConhecimentoCadCOD_PRODUTO.Text);
    if cstCofins <> '' then
    begin
      //FCteCad.DBLCCSTCofins.KeyValue := cstCofins;
      DMConhecimento.QConhecimentoCadCOD_CST_COFINS.Value := cstCofins;
    end;
  end;
end;

procedure TFCteCad.DSPrimarioDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  with DMConhecimento.QConhecimentoCadIND_SITUACAO do
    if Value = SIT_NOTA_DIGITADA then
      DBTSituacao.Font.Color := clRed
    else if (Value = SIT_NOTA_CONFIRMADA) or (Value = SIT_NOTA_DENEGADA) then
      DBTSituacao.Font.Color := clGreen
    else if Value = SIT_NOTA_CANCELADA then
      DBTSituacao.Font.Color := clBlue
    else
      DBTSituacao.Font.Color := clWindowText;
  if (Field <> nil) and (Field.FieldName = 'IND_RESP_SEGURO') then
    CMBResponsavelSeguro.ItemIndex := DMConhecimento.QConhecimentoCadIND_RESP_SEGURO.Value;
end;

procedure TFCteCad.DBPDocOriginarioDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FNotaSaidaCons;
  Classe := TFNotaSaidaCons;
end;

procedure TFCteCad.DBPDocOriginarioCodigoChange(Sender: TObject);
var
  wChave: String;
begin
  inherited;
  if DMConhecimento.QDocOriginarioCOD_NOTA_CAB.Text <> '' then
  begin
    wChave := DMOracle.FastSelect('DESC_CHAVE_ACESSO','TB_NOTA_CAB','COD_NOTA_CAB = '+DMConhecimento.QDocOriginarioCOD_NOTA_CAB.Text);
    if wChave <> '' then
      DMConhecimento.QDocOriginarioDESC_CHAVE_ACESSO.Value := StringReplace(wChave,'NFe','', [rfReplaceAll]);
  end;
end;

procedure TFCteCad.SBCancelarClick(Sender: TObject);
begin
  with DMConhecimento do
  begin
    if QDocOriginario.State in [dsEdit, dsInsert] then
      QDocOriginario.Cancel;
    if QMotoristaCTe.State in [dsEdit, dsInsert] then
      QMotoristaCTe.Cancel;
    if QVeiculoCTe.State in [dsEdit, dsInsert] then
      QVeiculoCTe.Cancel;
  end;
  inherited;
end;

procedure TFCteCad.SBChaveAcessoClick(Sender: TObject);
procedure ChaveManual(Chave: string);
  begin
    if InputQuery('Nova Chave de Acesso', 'Digite a chave:', Chave) then
    begin
      Chave := Bib.LimpaNumero(Chave);
      if Length(Chave) <> 44 then
      begin
        MessageDlg('Chave errada, precisa possuir 44 números.', mtError, [mbOK], 0);
        ChaveManual(Chave);
      end
      else
        DMConhecimento.QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Value := 'CTe' + Chave;
    end;
  end;
begin
  inherited;
  with DMNfe do
  begin
    SetaCte(Bib.LimpaNumero(DMConhecimento.QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Value), True);
    if (QNfeind_aprovado.Value) or (QNfeind_cancelado.Value) or (QNfeind_denegado.Value) then
    begin
      MessageDlg('Esta chave já está autorizada, cancelada ou denegada na SEFAZ.' + #13 + #10 +
        'Não é permitido alterar a chave de uma nota nesta situação.', mtInformation, [mbOK], 0);
      Exit;
    end;
  end;
  case MessageDlgCustom('Alterar chave de acesso', mtConfirmation,
    [mbYes, mbNo, mbCancel], ['Informar manualmente',
    'Gerar outra chave automaticamente', 'Cancelar'], nil) of
    mrYes:
      ChaveManual(DMConhecimento.QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Value);
    mrNo:
      if (MessageDlg('Tem certeza?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        MessageDlg('A Chave de Acesso será apagada, pois, assim, ela será gerada automaticamente na confirmação da nota.', mtInformation, [mbOK], 0);
        DMConhecimento.QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Value := '';
      end;
  end;
end;

procedure TFCteCad.DBPanel4DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FOperacaoCons;
  Classe := TFOperacaoCons;
end;

procedure TFCteCad.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFCteCad.BtMensagemClick(Sender: TObject);
var str: String;
begin
  inherited;
  if FMensagemCons = nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  if FMensagemCons.ShowModal = MrOk then
  begin
    str := DMConhecimento.QConhecimentoCadDESC_OBS.Value;
    if not DMMensagem.QMensagemConsDESC_MENSAGEM.IsNull then
    begin
      if Trim(str) <> '' then
        str := str + #13 + #10;
      str := str + DMMensagem.QMensagemConsDESC_MENSAGEM.Value;
    end;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO1.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO1.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO2.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO2.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO3.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO3.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO4.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO4.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO5.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO5.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO6.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO6.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO7.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO7.Value;
    DMConhecimento.QConhecimentoCadDESC_OBS.Value := str;
  end;
end;

procedure TFCteCad.BtMsgFiscoClick(Sender: TObject);
var str: String;
begin
  inherited;
  if FMensagemCons = nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  if FMensagemCons.ShowModal = MrOk then
  begin
    str := DMConhecimento.QConhecimentoCadDESC_INF_ADIC_FISCO.Value;
    if not DMMensagem.QMensagemConsDESC_MENSAGEM.IsNull then
    begin
      if Trim(str) <> '' then
        str := str + #13 + #10;
      str := str + DMMensagem.QMensagemConsDESC_MENSAGEM.Value;
    end;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO1.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO1.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO2.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO2.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO3.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO3.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO4.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO4.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO5.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO5.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO6.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO6.Value;
    if not DMMensagem.QMensagemConsDESC_COMPLEMENTO7.IsNull then
      str := str + #13 + #10 + DMMensagem.QMensagemConsDESC_COMPLEMENTO7.Value;
    DMConhecimento.QConhecimentoCadDESC_INF_ADIC_FISCO.Value := str;
  end;
end;

procedure TFCteCad.InutilizaodeNmerao1Click(Sender: TObject);
begin
  inherited;
  DMNfe.InutilizaNumeracaoCTe;
end;

procedure TFCteCad.EnviarviaEmail1Click(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    if QConhecimentoCadDESC_CHAVE_ACESSO_CTE.IsNull then
    begin
      MessageDlg('Por favor, informe um conhecimento que contenha chave de acesso.', mtError, [mbOK], 0);
      Exit;
    end;

    if FCteLoteCons = nil then
      FCteLoteCons := TFCteLoteCons.Create(Application);
    FCteLoteCons.CarregaConhecimento(QConhecimentoCadCOD_CONHECIMENTO.Value);
    FCteLoteCons.Foco := ctEmail;
    FCteLoteCons.ShowModal;
  end;
end;

procedure TFCteCad.ReemitirDacte1Click(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
    if (not QConhecimentoCadDESC_CHAVE_ACESSO_CTE.IsNull) then
    begin
      if FCteLoteCons = nil then
        FCteLoteCons := TFCteLoteCons.Create(Application);
      FCteLoteCons.CarregaConhecimento(QConhecimentoCadCOD_CONHECIMENTO.Value);
      FCteLoteCons.Foco := ctDacte;
      FCteLoteCons.ShowModal;
    end;
end;

procedure TFCteCad.Reconsultar1Click(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
    if (not QConhecimentoCadDESC_CHAVE_ACESSO_CTE.IsNull) then
    begin
      if FCteLoteCons = nil then
        FCteLoteCons := TFCteLoteCons.Create(Application);
      FCteLoteCons.CarregaConhecimento(QConhecimentoCadCOD_CONHECIMENTO.Value);
      FCteLoteCons.Foco := ctConsulta;
      FCteLoteCons.ShowModal;
      QConhecimentoCad.Refresh;
    end;
end;

procedure TFCteCad.Exportar1Click(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
    if (not QConhecimentoCadDESC_CHAVE_ACESSO_CTE.IsNull) then
    begin
      if FCteLoteCons = nil then
        FCteLoteCons := TFCteLoteCons.Create(Application);
      FCteLoteCons.CarregaConhecimento(QConhecimentoCadCOD_CONHECIMENTO.Value);
      FCteLoteCons.Foco := ctExportar;
      FCteLoteCons.ShowModal;
    end;
end;

procedure TFCteCad.VerRetornodeEnvio1Click(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
    if (not QConhecimentoCadDESC_CHAVE_ACESSO_CTE.IsNull) then
    begin
      if FCteLoteCons = nil then
        FCteLoteCons := TFCteLoteCons.Create(Application);
      FCteLoteCons.CarregaConhecimento(QConhecimentoCadCOD_CONHECIMENTO.Value);
      FCteLoteCons.Foco := ctRetornoEnvio;
      FCteLoteCons.ShowModal;
    end;
end;

procedure TFCteCad.SBDocInserirClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if FDocOriginarioParam = nil then
    FDocOriginarioParam := TFDocOriginarioParam.Create(Application);
  if FDocOriginarioParam.ShowModal = mrOk then
    if FDocOriginarioParam.RGNotaFiscal.ItemIndex = 1 then
    begin
      if FNotaSaidaCons = nil then
        FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
      FNotaSaidaCons.DBGrid1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
      FNotaSaidaCons.LBVariosRegistros.Visible := True;
      if FNotaSaidaCons.ShowModal = mrOk then
      begin
        with FNotaSaidaCons.DBGrid1 do
        begin
          for i := 0 to SelectedRows.Count - 1 do
          begin
            DataSource.DataSet.Bookmark := SelectedRows[i];
            MontaDocOriginario(DMNotaSaida.QNotaSaidaConsCOD_NOTA_CAB.Value);
          end;
        end;
      end;

    end
    else
      if FDocOriginarioParam.RGNotaFiscal.ItemIndex = 2 then
      begin
        with DMConhecimento do
        begin
          if (QDocOriginario.State in [dsBrowse]) then
            QDocOriginario.Insert;
          QDocOriginarioCOD_CONHECIMENTO.Value := QConhecimentoCadCOD_CONHECIMENTO.value;
          QDocOriginarioDT_EMISSAO.Value := Date;
          FDocOriginarioCad.ShowModal;
        end;
      end
      else
        if FDocOriginarioParam.RGNotaFiscal.ItemIndex = 0 then
        begin
          FImpDadosXMLNFe := TFImpDadosXMLNFe.Create(Application);
          if FImpDadosXMLNFe.ShowModal = MrOk then
          begin
            with DMConhecimento do
            begin
              for i := 0 to Length(FImpDadosXMLNFe.NFes)-1 do
              begin
                QDocOriginario.Insert;
                QDocOriginarioCOD_CONHECIMENTO.Value := QConhecimentoCadCOD_CONHECIMENTO.value;
                QDocOriginarioNUM_DOCUMENTO.Value := FImpDadosXMLNFe.NFes[i].pNumero;
                QDocOriginarioCOD_SERIE.Value := FImpDadosXMLNFe.NFes[i].pSerie;
                QDocOriginarioDT_EMISSAO.Text := FImpDadosXMLNFe.NFes[i].pDataEmissao;
                QDocOriginarioCOD_CIDADE_IBGE.Value := FImpDadosXMLNFe.Destinatarios[i].CMunCad;
                QDocOriginarioDESC_CHAVE_ACESSO.Value := FImpDadosXMLNFe.NFes[i].pChaveAcesso;
                QDocOriginarioNOME.Value := FImpDadosXMLNFe.Destinatarios[i].NomeCad;
                QDocOriginarioDESC_ENDERECO.Value := FImpDadosXMLNFe.Destinatarios[i].LgrCad;
                //QDocOriginarioDESC_COMPLEMENTO_ENDERECO.Value := FImpDadosXMLNFe.Destinatarios[i].;
                QDocOriginarioNUM_ENDERECO.Value := FImpDadosXMLNFe.Destinatarios[i].NroCad;
                QDocOriginarioDESC_BAIRRO.Value := FImpDadosXMLNFe.Destinatarios[i].BairroCad;
                QDocOriginarioDESC_CIDADE.Value := FImpDadosXMLNFe.Destinatarios[i].MunCad;
                QDocOriginarioDESC_UF.Value := FImpDadosXMLNFe.Destinatarios[i].UFCad;
                QDocOriginarioDESC_CEP.Value := FImpDadosXMLNFe.Destinatarios[i].CepCad;
                QDocOriginarioCOD_SERIE_MODELO.Value := '55';
                QDocOriginarioIND_IMPORTADO_XML.Value := 'S';
                QDocOriginario.Post;
                QConhecimentoCadQT_VOLUMES.Value :=
                  QConhecimentoCadQT_VOLUMES.Value + StrToFloat('0'+FImpDadosXMLNFe.NFes[i].pVolumes);
                QConhecimentoCadNUM_PESO_BRUTO.Value :=
                  QConhecimentoCadNUM_PESO_BRUTO.Value + StrToFloat('0'+FImpDadosXMLNFe.NFes[i].pPesoB);
                QConhecimentoCadVAL_TOTAL_CARGA.Value :=
                  QConhecimentoCadVAL_TOTAL_CARGA.Value + StrToFloat('0'+FImpDadosXMLNFe.NFes[i].pVNF);
              end;
            end;    
          end;
        end;
end;

procedure TFCteCad.MontaDocOriginario(CodNotaCab: integer);
var
  wCfop : integer;
  wChaveAcesso : String;
begin
  With DMNotaSaida do
  begin
    QNotaSaida.Close;
    QNotaSaida.SetVariable('PK', CodNotaCab);
    QNotaSaida.Open;
    QItemNF.Close;
    QItemNF.Open;
    QItemNF.First;

    // Somente Pode ser Documento Originário se Modelo for 01, 04 ou 55
    // Se for modelo 55, deve ter chave de Acesso. - Djeison A. S. 17/07/2013
    if ((Trim(QNotaSaidaDESC_CHAVE_ACESSO.Value) = '') and
       (QNotaSaidaCOD_SERIE_MODELO.Value = '55')) then
      raise Exception.Create('NF-e não possui chave de acesso!');
    if not ((QNotaSaidaCOD_SERIE_MODELO.Value = '01') or
       (QNotaSaidaCOD_SERIE_MODELO.Value = '04') or
       (QNotaSaidaCOD_SERIE_MODELO.Value = '55')) then
      raise Exception.Create('Modelo inválido para Conhecimentos de Frete!');

    QSomaItemNota.Close;
    QSomaItemNota.SetVariable('COD_NOTA_CAB', CodNotaCab);
    QSomaItemNota.Open;
  end;

  // Buscar CFOP da Operação - Estadual ou Interestadual - Djeison A. S. 17/07/2013
  if DMNotaSaida.QNotaSaidaCOD_ESTADO.Value = 'PR' then
    wCfop := StrToInt(DMOracle.BuscaNome('SELECT NUM_NATUREZA_EST_NOVO FROM TB_OPERACAO',
      'COD_OPERACAO = ' + DMNotaSaida.QNotaSaidaCOD_OPERACAO.AsString))
  else
    wCfop := StrToInt(DMOracle.BuscaNome('SELECT NUM_NATUREZA_INT_NOVO FROM TB_OPERACAO',
      'COD_OPERACAO = ' + DMNotaSaida.QNotaSaidaCOD_OPERACAO.AsString));

  // Remover 'NFe' da chave de Acesso - Djeison
  wChaveAcesso := StringReplace(
    UpperCase(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value), 'NFE', '', [rfReplaceAll]);

  with DMConhecimento do
  begin
    QDocOriginario.Insert;
    QDocOriginarioNUM_CFOP.Value := wCfop;
    QDocOriginarioDESC_CHAVE_ACESSO.Value := wChaveAcesso;
    QDocOriginarioCOD_CONHECIMENTO.Value := QConhecimentoCadCOD_CONHECIMENTO.Value;
    QDocOriginarioCOD_NOTA_CAB.Value := DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value;
    QDocOriginarioNUM_DOCUMENTO.Value := DMNotaSaida.QNotaSaidaNUM_NOTA.AsString;
    QDocOriginarioNUM_PESO.Value := DMNotaSaida.QNotaSaidaNUM_PESO_BRUTO.Value;
    QDocOriginarioDT_EMISSAO.Value := DMNotaSaida.QNotaSaidaDT_EMISSAO.Value;
    QDocOriginarioCOD_SERIE.Value := DMNotaSaida.QNotaSaidaCOD_SERIE.Value;
    QDocOriginarioCOD_SERIE_MODELO.Value := DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value;
    QDocOriginarioNUM_VOLUMES.Value := DMNotaSaida.QNotaSaidaNUM_VOLUMES.Value;
    QDocOriginarioVAL_TOTAL.Value := DMNotaSaida.QSomaItemNotasval_total_nota.Value;
    QDocOriginarioVAL_TOTAL_PRODUTOS.Value := DMNotaSaida.QSomaItemNotaSVAL_TOTAL.Value;
    QDocOriginarioVAL_BASE_ICMS.Value := DMNotaSaida.QSomaItemNotaSVAL_ICM_BASE.Value;
    QDocOriginarioVAL_BASE_ICMS_SUBST.Value := DMNotaSaida.QSomaItemNotaSVAL_BASE_SUBST.Value;
    QDocOriginarioVAL_ICMS.Value := DMNotaSaida.QSomaItemNotaSVAL_ICM.Value;
    QDocOriginarioVAL_ICMS_SUBST.Value := DMNotaSaida.QSomaItemNotaSVAL_ICMS_SUBST.Value;

    QDocOriginario.Post;
    QConhecimentoCadCOD_PRODUTO.Value := DMNotaSaida.QItemNFCOD_PRODUTO.Value;
    QConhecimentoCadQT_VOLUMES.Value :=
      QConhecimentoCadQT_VOLUMES.Value + QDocOriginarioNUM_VOLUMES.Value;
    QConhecimentoCadNUM_PESO_BRUTO.Value :=
      QConhecimentoCadNUM_PESO_BRUTO.Value + QDocOriginarioNUM_PESO.Value;
    QConhecimentoCadVAL_TOTAL_CARGA.Value :=
      QConhecimentoCadVAL_TOTAL_CARGA.Value + QDocOriginarioVAL_TOTAL.Value;
  end;
  DMNotaSaida.QSomaItemNota.Close;
  DMNotaSaida.QNotaSaida.Close;
end;

procedure TFCteCad.DBTSitSefazMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  DBTSitSefaz.Hint := DMConhecimento.QConhecimentoCaddesc_situacao_sefaz.AsString;
end;

procedure TFCteCad.SBDocRemoverClick(Sender: TObject);
begin
  inherited;
  With DMConhecimento do
  begin
    if not QDocOriginario.IsEmpty then
    begin
      if QDocOriginarioIND_IMPORTADO_XML.Value = 'S' then
      begin
        QConhecimentoCadQT_VOLUMES.Value :=
          QConhecimentoCadQT_VOLUMES.Value - QDocOriginarioNUM_VOLUMES.Value;
        QConhecimentoCadNUM_PESO_BRUTO.Value :=
          QConhecimentoCadNUM_PESO_BRUTO.Value - QDocOriginarioNUM_PESO.Value;
        QConhecimentoCadVAL_TOTAL_CARGA.Value :=
          QConhecimentoCadVAL_TOTAL_CARGA.Value - QDocOriginarioVAL_TOTAL.Value;
      end;
      QDocOriginario.Delete;
    end;
  end;
end;
procedure TFCteCad.DBECodConhecimentoChange(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    MMCadSimples.Items[2].Items[0].Enabled := QConhecimentoCadIND_SITUACAO.Value = '1';
    MMCadSimples.Items[2].Items[1].Enabled := QConhecimentoCadIND_SITUACAO.Value = '1';
    MMCadSimples.Items[2].Items[2].Enabled := QConhecimentoCadIND_SITUACAO.Value = '2';
    MMCadSimples.Items[2].Items[3].Enabled := QConhecimentoCadIND_SITUACAO.Value = '3';
    MMCadSimples.Items[2].Items[14].Enabled := QConhecimentoCadIND_SITUACAO.Value = '1';
    MMCadSimples.Items[2].Items[15].Enabled := QConhecimentoCadIND_SITUACAO.Value = '4';
  end;
end;

procedure TFCteCad.ExportarCTesPorPerodo1Click(Sender: TObject);
var
  filial, remetente, destinatario: Integer;
  dtInicial, dtFinal: TDateTime;
begin
  inherited;
  if FExportarCTeParam = nil then
    FExportarCTeParam := TFExportarCTeParam.Create(Application);
  if FExportarCTeParam.ShowModal = mrOk then
  begin
    filial := StrToInt(Trim(FExportarCTeParam.FmFilial1.MeFilial.Text));
    if Trim(FExportarCTeParam.FmCadastro1.MeCadastro.Text) = '' then
      remetente := 0
    else
      remetente := StrToInt(Trim(FExportarCTeParam.FmCadastro1.MeCadastro.Text));
    if Trim(FExportarCTeParam.FmCadastro2.MeCadastro.Text) = '' then
      destinatario := 0
    else
      destinatario := StrToInt(Trim(FExportarCTeParam.FmCadastro2.MeCadastro.Text));
      
    FExportarCTeParam.FmDatas1.ChecaDatasInformadas;
    dtInicial := StrToDateTime(FExportarCTeParam.FmDatas1.MeDtInicial.Text);
    dtFinal := StrToDateTime(FExportarCTeParam.FmDatas1.MeDtFinal.Text + ' 23:59:00');
    SaveDialogExportaCTes.FileName := 'CT-es_' + IfThen(filial=0,'','Filial_'+ IntToStr(filial)+ '_') + FormatDateTime('dd-MM-yyyy',dtInicial) + '_'+FormatDateTime('dd-MM-yyyy',dtFinal);
    if(SaveDialogExportaCTes.Execute) then
      DMNfe.ExportaCTes (filial, remetente, destinatario, dtInicial, dtFinal, FExportarCTeParam.CBEmailXML.Checked, FExportarCTeParam.CBEmailPDF.Checked, Trim(SaveDialogExportaCTes.FileName + '.zip'),
                  FExportarCTeParam.CbCancelado.checked);
  end;
end;

procedure TFCteCad.BtCopiaClick(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    QConhecimentoCadNUM_CONHECIMENTO.Value := 0;
    QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Clear;
  end;
end;

procedure TFCteCad.btPlacaConsClick(Sender: TObject);
begin
  inherited;
  if FVeiculoConhecimentoCons = nil then
    FVeiculoConhecimentoCons := TFVeiculoConhecimentoCons.Create(Application);
  if FVeiculoConhecimentoCons.ShowModal = mrOk then
  begin
    DMConhecimento.QVeiculoCTe.Edit;
    DMConhecimento.QVeiculoCTeDESC_PLACA.Value :=
      DMVeiculoConhecimento.QVeiculoConsDESC_PLACA.Value;
    EDPlacaChange(Sender);
  end;
end;

procedure TFCteCad.SomaValoresConhecimento;
begin
  try
    if DSPrimario.State In [DsInsert, DsEdit] then
    begin
      with DMConhecimento do
      begin
        QConhecimentoCadVAL_TOTAL_CTE.Value := QConhecimentoCadVAL_FRETE.Value+
                        QConhecimentoCadVAL_PEDAGIO.Value+
                        QConhecimentoCadVAL_FRETE_PESO.Value+
                        QConhecimentoCadVAL_DESPACHO.Value+
                        QConhecimentoCadVAL_GRIS.Value;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ' + E.ClassName + ' - '+ E.Message);
  end;
end;

procedure TFCteCad.DBEFreteValorExit(Sender: TObject);
begin
  inherited;
  SomaValoresConhecimento;
  CalculaICMS;
end;

procedure TFCteCad.DBEPedagioExit(Sender: TObject);
begin
  inherited;
  SomaValoresConhecimento;
  CalculaICMS;
end;

procedure TFCteCad.DBEFretePesoExit(Sender: TObject);
begin
  inherited;
  SomaValoresConhecimento;
  CalculaICMS;
end;

procedure TFCteCad.DBEDespachoExit(Sender: TObject);
begin
  inherited;
  SomaValoresConhecimento;
  CalculaICMS;
end;

procedure TFCteCad.DBEGrisExit(Sender: TObject);
begin
  inherited;
  SomaValoresConhecimento;
  CalculaICMS;
end;

procedure TFCteCad.DBGDocOriginarioDblClick(Sender: TObject);
begin
  inherited;
  if FDocOriginarioCad = nil then
    FDocOriginarioCad := TFDocOriginarioCad.Create(Application);
  FDocOriginarioCad.ShowModal;
end;

procedure TFCteCad.CalculaICMS;
var
  wAuxBase, wPercICM: Real;
begin
  try
    if DSPrimario.State In [DsInsert, DsEdit] then
    begin
      with DMConhecimento do
      begin
        if DMTributacao.QTributacaoCod_Tributacao.Text <> DBPTributacao.DBEdit.Text then
        begin
          DMTributacao.QTributacao.Close;
          DMTributacao.QTributacao.SetVariable('Pk', StrToInt(DBPTributacao.DBEdit.Text));
          DMTributacao.QTributacao.Open;
        end;
        
        wPercICM := DMTributacao.QTributacaoPERC_ALIQUOTA.Value;
        wAuxBase := DMTributacao.QTributacaoPERC_TRIBUTADO.Value;
        if Trim(DMTributacao.QTributacaoDESC_SITUACAO_TRIB.Value) = '060' then
        begin
          QConhecimentoCadVAL_BASE_ICMS_SUBST.Value := (QConhecimentoCadVAL_FRETE.Value + QConhecimentoCadVAL_FRETE_PESO.Value) * wAuxBase / 100;
          QConhecimentoCadVAL_ICMS_SUBST.VALUE := QConhecimentoCadVAL_BASE_ICMS_SUBST.Value * wPercICM /100;
          QConhecimentoCadVAL_BASE_ICMS.Value := 0;
          QConhecimentoCadVal_ICMS.VALUE := 0;
        end
        else
        begin
          QConhecimentoCadVAL_BASE_ICMS.Value := (QConhecimentoCadVAL_FRETE.Value + QConhecimentoCadVAL_FRETE_PESO.Value) * wAuxBase / 100;
          QConhecimentoCadVal_ICMS.VALUE := QConhecimentoCadVAL_BASE_ICMS.Value * wPercICM /100;
          QConhecimentoCadVAL_BASE_ICMS_SUBST.Value := 0;
          QConhecimentoCadVAL_ICMS_SUBST.VALUE := 0;
        end;
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'SISNESIO' then
          QConhecimentoCadVAL_A_RECEBER.Value := QConhecimentoCadVAL_TOTAL_CTE.Value +
                                                 QConhecimentoCadVAL_ICMS.Value +
                                                 QConhecimentoCadVAL_ICMS_SUBST.Value
        else
          QConhecimentoCadVAL_A_RECEBER.Value := QConhecimentoCadVAL_TOTAL_CTE.Value;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ' + E.ClassName + ' - '+ E.Message);
  end;
end;

procedure TFCteCad.EDPlacaChange(Sender: TObject);
begin
  inherited;
  with DMVeiculoConhecimento, DMConhecimento do
  begin
    if EDPlaca.Text <> '' then
    begin
      QVeiculoCad.Close;
      QVeiculoCad.SetVariable('PK', Trim(EDPlaca.Text));
      QVeiculoCad.Open;
      if QVeiculoCad.RecordCount > 0 then
      begin
        EdVeiculo.Text := QVeiculoCadDESC_VEICULO.Value;
        if QVeiculoCTe.State in [DSEdit, DSInsert] then
          QVeiculoCTeDESC_PLACA.Value :=
            QVeiculoCadDESC_PLACA.Value;
      end
      else
        EdVeiculo.Clear;
    end
    else
      EdVeiculo.Clear;
  end;
end;

procedure TFCteCad.DsVeiculoCteStateChange(Sender: TObject);
begin
  inherited;
  if (DsVeiculoCte.State in [DsInsert]) and (PageControl1.TabIndex = 2) then
    EDPlaca.SetFocus;
end;

procedure TFCteCad.EDPlacaExit(Sender: TObject);
begin
  inherited;
  try
  if DMConhecimento.QVeiculoCTe.State in [DSEdit, DSInsert] then
  begin
    if (DMVeiculoConhecimento.QVeiculoCad.Active) and (DMVeiculoConhecimento.QVeiculoCad.RecordCount = 0) then
    begin
      EdVeiculo.Text := 'VEICULO NAO CADASTRADO';
      EdPlaca.Clear;
      DMConhecimento.QVeiculoCTe.Cancel;
    end
  end;
  except
  end;
end;

procedure TFCteCad.PopulaTomador;
begin
  if DSPrimario.State in [DsInsert, DsEdit] then
    with DMConhecimento do
      case CmbTomador.ItemIndex of
        0:  if QConhecimentoCadCOD_CADASTRO_REMETENTE.Value > 0 then
              QConhecimentoCadCOD_CADASTRO_TOMADOR.Value := QConhecimentoCadCOD_CADASTRO_REMETENTE.Value;
        1:  if QConhecimentoCadCOD_CADASTRO_EXPEDIDOR.Value > 0 then
              QConhecimentoCadCOD_CADASTRO_TOMADOR.Value := QConhecimentoCadCOD_CADASTRO_EXPEDIDOR.Value;
        2:  if QConhecimentoCadCOD_CADASTRO_RECEBEDOR.Value > 0 then
              QConhecimentoCadCOD_CADASTRO_TOMADOR.Value := QConhecimentoCadCOD_CADASTRO_RECEBEDOR.Value;
        3:  if QConhecimentoCadCOD_CADASTRO_DESTINATARIO.Value > 0 then
              QConhecimentoCadCOD_CADASTRO_TOMADOR.Value := QConhecimentoCadCOD_CADASTRO_DESTINATARIO.Value
      end;
end;

procedure TFCteCad.DBPRemetenteCodigoChange(Sender: TObject);
var aux: String;
begin
  inherited;
  PopulaTomador;
  if (DMConhecimento.QConhecimentoCadCOD_CADASTRO_REMETENTE.Value > 0) then
  begin
    aux := DMOracle.FastSelect('COD_CIDADE','TB_CADASTRO','COD_CADASTRO = '+DMConhecimento.QConhecimentoCadCOD_CADASTRO_REMETENTE.Text);
    if (aux <> '') and (DMConhecimento.QConhecimentoCadCOD_CADASTRO_REMETENTE.Text <>
      DMOracle.BuscaNome('select cod_cadastro_remetente from tb_conhecimento',
        'cod_conhecimento = ' + DMConhecimento.QConhecimentoCadCOD_CONHECIMENTO.Text)) then
      DMConhecimento.QConhecimentoCadCOD_CIDADE_ORIGEM.Value := StrToInt(aux);
  end;
end;

procedure TFCteCad.DBPDestinatarioCodigoChange(Sender: TObject);
var aux: String;
begin
  inherited;
  PopulaTomador;
  if DMConhecimento.QConhecimentoCadCOD_CADASTRO_DESTINATARIO.Value > 0 then
  begin
    aux := DMOracle.FastSelect('COD_CIDADE','TB_CADASTRO','COD_CADASTRO = '+DMConhecimento.QConhecimentoCadCOD_CADASTRO_DESTINATARIO.Text);
    if (aux <> '') and (DMConhecimento.QConhecimentoCadCOD_CADASTRO_DESTINATARIO.Text <>
      DMOracle.BuscaNome('select cod_cadastro_destinatario from tb_conhecimento',
        'cod_conhecimento = ' + DMConhecimento.QConhecimentoCadCOD_CONHECIMENTO.Text)) then
      DMConhecimento.QConhecimentoCadCOD_CIDADE_DESTINO.Value := StrToInt(aux);
  end;
end;

procedure TFCteCad.DBPExpedidorCodigoChange(Sender: TObject);
begin
  inherited;
  PopulaTomador;
end;

procedure TFCteCad.DBPRecebedorCodigoChange(Sender: TObject);
begin
  inherited;
  PopulaTomador;
end;

procedure TFCteCad.CmbTomadorChange(Sender: TObject);
begin
  inherited;
  if CmbTomador.ItemIndex = 4 then
  begin
    DBPTomador.LCaption := 'Tomador do Serviço';
    DBPTomador.VisibleComponents := [dbpcCodigo, dbpcBusca, dbpcDescricao];
    DBPTomador.Required := True;
  end
  else
  begin
    DBPTomador.LCaption := '';
    DBPTomador.VisibleComponents := [];
    DBPTomador.Required := False;
    PopulaTomador;
  end;
end;

procedure TFCteCad.RelaodeCTEs1Click(Sender: TObject);
begin
  inherited;
  if FConhecimentoParam = nil then
    FConhecimentoParam := TFConhecimentoParam.Create(Application);
  FConhecimentoParam.PGRelatorio.Pages[18].TabVisible := True;
  if FConhecimentoParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FConhecimentoParam.FmFilial11.MeFilial.Text), 'CONHECIMENTO');
    with DMConhecimento do
    begin
      QRCte.Close;
      //--------Frames
      if Trim(FConhecimentoParam.FmFilial18.MeFilial.Text) <> '' then
        QRCte.SetVariable('COD_FILIAL',Trim(FConhecimentoParam.FmFilial18.MeFilial.Text))
      else
        QRCte.SetVariable('COD_FILIAL', Null);
      if Trim(FConhecimentoParam.FmRemetente18.MeCadastro.Text) <> '' then
        QRCte.SetVariable('REMETENTE', Trim(FConhecimentoParam.FmRemetente18.MeCadastro.Text))
      else
        QRCte.SetVariable('REMETENTE', Null);
      if Trim(FConhecimentoParam.FmDestinatario18.MeCadastro.Text) <> '' then
        QRCte.SetVariable('DESTINATARIO', Trim(FConhecimentoParam.FmDestinatario18.MeCadastro.Text))
      else
        QRCte.SetVariable('DESTINATARIO', Null);
      if Trim(FConhecimentoParam.FmTomador18.MeCadastro.Text) <> '' then
        QRCte.SetVariable('TOMADOR', Trim(FConhecimentoParam.FmTomador18.MeCadastro.Text))
      else
        QRCte.SetVariable('TOMADOR', Null);
      if Trim(FConhecimentoParam.FmProduto18.MeProduto.Text) <> '' then
        QRCte.SetVariable('PRODUTO', Trim(FConhecimentoParam.FmProduto18.MeProduto.Text))
      else
        QRCte.SetVariable('PRODUTO', Null);

      case FConhecimentoParam.RGTipoCTE18.ItemIndex of
        0: QRCte.SetVariable('SITUACAO', Null);
        1: QRCte.SetVariable('SITUACAO', '1');
        2: QRCte.SetVariable('SITUACAO', '2');
        3: QRCte.SetVariable('SITUACAO', '3');
      end;
      if (Trim(FConhecimentoParam.FmDatas18.MeDtInicial.Text) <> '') and
                    (Trim(FConhecimentoParam.FmDatas18.MeDtFinal.Text) > '') then
      begin
        QRCte.SetVariable(':DT_EMISSAO_I', StrToDate(FConhecimentoParam.FmDatas18.MeDtInicial.Text));
        QRCte.SetVariable(':DT_EMISSAO_F', StrToDate(FConhecimentoParam.FmDatas18.MeDtFinal.Text));
      end
      else
        Raise Exception.Create('É necessário informar a data de emissão.');
      QRCte.SQL.Strings[QRCte.SQL.Count - 1] := '';
      case FConhecimentoParam.RGOrdem18.ItemIndex of
        0: QRCte.SQL.Add('ORDER BY NUM_CONHECIMENTO');
        1: QRCte.SQL.Add('ORDER BY DT_EMISSAO');
      end; // Case
      //-----------
      QRCte.Open;
      if FRCTE = nil then
        FRCTE := TFRCTE.Create(Application);
      //Cabeçalho Relatório
      FRCTE.QRLEmpresa.Caption := Trim(DMParamSistema.QParamSistemaDESC_EMPRESA.Text);
      FRCTE.QRLTitulo.Caption  := 'Relatório de Conhecimentos de Transporte Eletrônicos';
      FRCTE.QRLFilial.Caption  := 'Filial: '  + Trim(FConhecimentoParam.FmFilial18.EdFilial.Text);
      FRCTE.QRLProduto.Caption := 'Produto Predominante: ' + IfThen(Trim(FConhecimentoParam.FmProduto18.MeProduto.Text) <> '', Trim(FConhecimentoParam.FmProduto18.MeProduto.Text) + ' - ' + Trim(FConhecimentoParam.FmProduto18.EdProduto.Text), ' - TODOS'){ Trim(FConhecimentoParam.FmFilial18.EdFilial.Text)};
      FRCTE.QRLPeriodo.Caption := 'Período: ' + Trim(FConhecimentoParam.FmDatas18.MeDtInicial.Text) +
                                               ' até ' + Trim(FConhecimentoParam.FmDatas18.MeDtFinal.Text);
      //----------------------------

      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRCTE.QRPrimario.Preview
      else
        FRCTE.QRPrimario.Print;
    end;
  end;
  
end;

procedure TFCteCad.BTCTeReferenciadoClick(Sender: TObject);
begin
  inherited;
  if CMBTipoCte.ItemIndex = 0 then
  begin
    MessageDlg('Selecione um tipo de CT-e diferente de Normal.', mtError, [mbOK], 0);
    Abort;
  end;

  if FConhecimentoCons = nil then
    FConhecimentoCons := TFConhecimentoCons.Create(Application);
  if FConhecimentoCons.ShowModal = mrOk then
  begin
    with DMConhecimento do
    begin
      QConhecimentoCadCOD_CONHECIMENTO_REF.Value := QConhecimentoConsCOD_CONHECIMENTO.Value;
      QConhecimentoCadCOD_FILIAL.Value := QConhecimentoConsCOD_FILIAL.Value;
      QConhecimentoCadCOD_OPERACAO.Value := QConhecimentoConsCOD_OPERACAO.Value;
      QConhecimentoCadIND_TOMADOR_SERVICO.Value := QConhecimentoConsIND_TOMADOR_SERVICO.Value;
      QConhecimentoCadIND_FORMA_PGTO.Value := QConhecimentoConsIND_FORMA_PGTO.Value;
      QConhecimentoCadIND_LOTACAO.Value := QConhecimentoConsIND_LOTACAO.Value;
      QConhecimentoCadCOD_CIDADE_ORIGEM.Value := QConhecimentoConsCOD_CIDADE_ORIGEM.Value;
      QConhecimentoCadCOD_CIDADE_DESTINO.Value := QConhecimentoConsCOD_CIDADE_DESTINO.Value;
      QConhecimentoCadCOD_CADASTRO_REMETENTE.Value := QConhecimentoConsCOD_CADASTRO_REMETENTE.Value;
      QConhecimentoCadCOD_CADASTRO_DESTINATARIO.Value := QConhecimentoConsCOD_CADASTRO_DESTINATARIO.Value;
      if QConhecimentoConsCOD_CADASTRO_EXPEDIDOR.Value > 0 then
        QConhecimentoCadCOD_CADASTRO_EXPEDIDOR.Value := QConhecimentoConsCOD_CADASTRO_EXPEDIDOR.Value;
      if QConhecimentoConsCOD_CADASTRO_RECEBEDOR.Value > 0 then
        QConhecimentoCadCOD_CADASTRO_RECEBEDOR.Value := QConhecimentoConsCOD_CADASTRO_RECEBEDOR.Value;
      QConhecimentoCadCOD_CADASTRO_TOMADOR.Value := QConhecimentoConsCOD_CADASTRO_TOMADOR.Value;
      QConhecimentoCadCOD_PRODUTO.Value := QConhecimentoConsCOD_PRODUTO.Value;
      QConhecimentoCadCOD_TRIBUTACAO.Value := QConhecimentoConsCOD_TRIBUTACAO.Value;
      QConhecimentoCadDESC_OUT_CARAC_CARGA.Value := QConhecimentoConsDESC_OUT_CARAC_CARGA.Value;
      QConhecimentoCadQT_VOLUMES.Value := QConhecimentoConsQT_VOLUMES.Value;
      QConhecimentoCadVAL_TOTAL_CARGA.Value := QConhecimentoConsVAL_TOTAL_CARGA.Value;
      QConhecimentoCadNUM_PESO_BRUTO.Value := QConhecimentoConsNUM_PESO_BRUTO.Value;
      QConhecimentoCadNUM_PESO_BC.Value := QConhecimentoConsNUM_PESO_BC.Value;
      QConhecimentoCadNUM_PESO_AFERIDO.Value := QConhecimentoConsNUM_PESO_AFERIDO.Value;
      QConhecimentoCadNUM_CUBAGEM.Value := QConhecimentoConsNUM_CUBAGEM.Value;
      QConhecimentoCadVAL_FRETE.Value := QConhecimentoConsVAL_FRETE.Value;
      QConhecimentoCadVAL_TOTAL_CTE.Value := QConhecimentoConsVAL_TOTAL_CTE.Value;
      QConhecimentoCadVAL_A_RECEBER.Value := QConhecimentoConsVAL_A_RECEBER.Value;

      QVeiculoCTeCons.Close;
      QVeiculoCTeCons.Open;

      while not QVeiculoCTeCons.Eof do
      begin
        QVeiculoCTe.Insert;
        QVeiculoCTeDESC_PLACA.Value := QVeiculoCTeConsDESC_PLACA.Value;
        QVeiculoCTe.Post;
        QVeiculoCTeCons.Next;
      end;

      QMotoristaCTeCons.Close;
      QMotoristaCTeCons.Open;

      while not QMotoristaCTeCons.Eof do
      begin
        QMotoristaCTe.Insert;
        QMotoristaCTeCOD_CADASTRO.Value := QMotoristaCTeConsCOD_CADASTRO.Value;
        QMotoristaCTe.Post;
        QMotoristaCTeCons.Next;
      end;

      QDocOriginarioCons.Close;
      QDocOriginarioCons.Open;
      while not QDocOriginarioCons.Eof do
      begin
        QDocOriginario.Insert;
        QDocOriginarioDESC_CHAVE_ACESSO.Value := QDocOriginarioConsDESC_CHAVE_ACESSO.Value;
        QDocOriginarioDESC_PIN_SUFRAMA.Value := QDocOriginarioConsDESC_PIN_SUFRAMA.Value;
        QDocOriginarioCOD_NOTA_CAB.Value := QDocOriginarioConsCOD_NOTA_CAB.Value;
        QDocOriginarioNUM_DOCUMENTO.Value := QDocOriginarioConsNUM_DOCUMENTO.Value;
        QDocOriginarioVAL_BASE_ICMS.Value := QDocOriginarioConsVAL_BASE_ICMS.Value;
        QDocOriginarioVAL_ICMS.Value := QDocOriginarioConsVAL_ICMS.Value;
        QDocOriginarioVAL_BASE_ICMS_SUBST.Value := QDocOriginarioConsVAL_BASE_ICMS_SUBST.Value;
        QDocOriginarioVAL_ICMS_SUBST.Value := QDocOriginarioConsVAL_ICMS_SUBST.Value;
        QDocOriginarioVAL_TOTAL_PRODUTOS.Value := QDocOriginarioConsVAL_TOTAL_PRODUTOS.Value;
        QDocOriginarioVAL_TOTAL.Value := QDocOriginarioConsVAL_TOTAL.Value;
        QDocOriginarioNUM_CFOP.Value := QDocOriginarioConsNUM_CFOP.Value;
        QDocOriginarioNUM_PESO.Value := QDocOriginarioConsNUM_PESO.Value;
        QDocOriginarioCOD_SERIE_MODELO.Value := QDocOriginarioConsCOD_SERIE_MODELO.Value;
        QDocOriginarioCOD_SERIE.Value := QDocOriginarioConsCOD_SERIE.Value;
        QDocOriginarioDT_EMISSAO.Value := QDocOriginarioConsDT_EMISSAO.Value;
        QDocOriginarioNUM_PEDIDO.Value := QDocOriginarioConsNUM_PEDIDO.Value;
        QDocOriginarioNUM_VOLUMES.Value := QDocOriginarioNUM_VOLUMES.Value;
        QDocOriginarioNUM_ROMANEIO.Value := QDocOriginarioNUM_ROMANEIO.Value;
        QDocOriginarioIND_IMPORTADO_XML.Value := QDocOriginarioIND_IMPORTADO_XML.Value;
        QDocOriginario.Post;
        QDocOriginarioCons.Next;
      end;


      case CMBTipoCte.ItemIndex of
        1:
          QConhecimentoCadDESC_OBS.Value := QConhecimentoCadDESC_OBS.Value +
            ' \nCT-e de complemento de valores '+
            'relativo ao CT-e, nr. '+QConhecimentoConsNUM_CONHECIMENTO.Text+
            ' chave '+ Bib.LimpaNumero(QConhecimentoConsDESC_CHAVE_ACESSO_CTE.Value)+
            ' emitido em '+ QConhecimentoConsDT_EMISSAO.Text;

        2:
          QConhecimentoCadDESC_OBS.Value := QConhecimentoCadDESC_OBS.Value +
          '\nCTe de anulação de valores relativo à prestação de serviço de transporte '+
          'tomados por meio do conhecimento de transporte eletrônico (CT-e), nro '+
          QConhecimentoConsNUM_CONHECIMENTO.Text+
          ', série '+QConhecimentoConsCOD_SERIE.Value+', chave de acesso '+
          Bib.LimpaNumero(QConhecimentoConsDESC_CHAVE_ACESSO_CTE.Value)+', emitido em '+
          QConhecimentoConsDT_EMISSAO.Text+' no valor de '+
          FormatFloat('#,##0.00', QConhecimentoConsVAL_TOTAL_CTE.Value)+
          ', emitido com erro em alguns campos';
        3: QConhecimentoCadDESC_OBS.Value := QConhecimentoCadDESC_OBS.Value +
          '\nEste documento substitui o CT-e '+QConhecimentoConsNUM_CONHECIMENTO.Text+
          ', série '+QConhecimentoConsCOD_SERIE.Value+', chave de acesso '+
          Bib.LimpaNumero(QConhecimentoConsDESC_CHAVE_ACESSO_CTE.Value)+', emitido em '+
          QConhecimentoConsDT_EMISSAO.Text+' no valor de '+
          FormatFloat('#,##0.00', QConhecimentoConsVAL_TOTAL_CTE.Value)+
          ' em virtude de erro nos dados.';
      end;
    end;
  end;

end;

procedure TFCteCad.CMBTipoCteChange(Sender: TObject);
begin
  inherited;
  case CMBTipoCte.ItemIndex of
    0:
    begin
      TabSheet5.TabVisible := false;
      GBICMS.Enabled := False;
    end;
    1:
    begin
      TabSheet5.TabVisible := true;  
      DBRToma.Visible := false;
      DBEDecNaoContib.Visible := false;
      LblDecNaoContrib.Visible := false;
      DMConhecimento.QConhecimentoCadIND_TOMA_ICMS.Value := '';
      LblCTeReferenciado.Caption := 'Selecione o CT-e a ser complementado';
      GPBCTeAnulacao.Visible := false;
      GPBTomaContICMS.Visible := false;
      GBICMS.Enabled := True;
    end;
    2:
    begin
      TabSheet5.TabVisible := true;

      DBRToma.Visible := false;
      DBEDecNaoContib.Visible := true;
      LblDecNaoContrib.Visible := true;
      DMConhecimento.QConhecimentoCadIND_TOMA_ICMS.Value := '';
      LblCTeReferenciado.Caption := 'Selecione o CT-e a ser anulado';
      GPBCTeAnulacao.Visible := false;
      GPBTomaContICMS.Visible := false;
      GBICMS.Enabled := True;
    end;
    3:
    begin
      TabSheet5.TabVisible := true;

      DBRToma.Visible := true;
      DBEDecNaoContib.Visible := false;
      LblDecNaoContrib.Visible := false;
      LblCTeReferenciado.Caption := 'Selecione o CT-e a ser substituído';
      GBICMS.Enabled := True;
    end;
  end;
end;

procedure TFCteCad.BTCTeAnulacaoClick(Sender: TObject);
begin
  inherited;
  if CMBTipoCte.ItemIndex = 0 then
  begin
    MessageDlg('Selecione CT-e Substituto no campo tipo de CT-e.', mtError, [mbOK], 0);
    Abort;
  end;
  if FConhecimentoCons = nil then
    FConhecimentoCons := TFConhecimentoCons.Create(Application);
  if FConhecimentoCons.ShowModal = mrOk then
  begin
    with DMConhecimento do
    begin
      QConhecimentoCadCOD_CTE_ANULACAO_REF.Value := QConhecimentoConsCOD_CONHECIMENTO.Value;
    end;
  end;

end;

procedure TFCteCad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  CMBTipoCte.ItemIndex := DMConhecimento.QConhecimentoCadIND_TIPO_CTE.Value;
  CmbTpServ.ItemIndex := DMConhecimento.QConhecimentoCadIND_TIPO_SERVICO.Value;
  CmbTomador.ItemIndex := DMConhecimento.QConhecimentoCadIND_TOMADOR_SERVICO.Value;
  CMBResponsavelSeguro.ItemIndex := DMConhecimento.QConhecimentoCadIND_RESP_SEGURO.Value;
  CMBTipoCteChange(Self);
  CmbTpServChange(Self);
end;

procedure TFCteCad.DBPTomadorDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFCteCad.DBPTomadorCodigoChange(Sender: TObject);
begin
  inherited;
  PopulaTomador;
end;

procedure TFCteCad.CmbTpServChange(Sender: TObject);
begin
  inherited;
  DBPRemetente.Required := True;
  DBPDestinatario.Required := True;
  DBPExpedidor.Required := false;
  DBPRecebedor.Required := false;
  if CmbTpServ.ItemIndex = 0 then
  begin
    TabSheet6.TabVisible := false;
    CmbTomador.Enabled := True;
  end
  else
  begin
    TabSheet6.TabVisible := true;
    if CmbTpServ.ItemIndex = 2 then
    begin
      CmbTomador.Enabled := True;
      CmbTomador.ItemIndex := 1;
      DBPExpedidor.Required := True;
    end
    else
    begin
      CmbTomador.ItemIndex := 4;
      CmbTomadorChange(Self);
      CmbTomador.Enabled := false;
      if CmbTpServ.ItemIndex = 3 then
      begin
        DBPRemetente.Required := False;
        DBPDestinatario.Required := False;
        DMConhecimento.QConhecimentoCadCOD_CADASTRO_REMETENTE.AsVariant := null;
        DMConhecimento.QConhecimentoCadCOD_CADASTRO_DESTINATARIO.AsVariant := null;
        DBPExpedidor.Required := True;
        DBPRecebedor.Required := True;
      end;
    end;
  end;
end;

procedure TFCteCad.SBDocAntInserirClick(Sender: TObject);
var
  i, j: Integer;
  codProduto: String;
begin
  inherited;
  if FDocAnteriorParam = nil then
    FDocAnteriorParam := TFDocAnteriorParam.Create(Application);
  if FDocAnteriorParam.ShowModal = mrOk then
    if FDocAnteriorParam.RGDocumentos.ItemIndex = 3 then
    begin
      with DMConhecimento do
      begin
        if (QDocAnterior.State in [dsBrowse]) then
          QDocAnterior.Insert;
        QDocAnteriorCOD_CONHECIMENTO.Value := QConhecimentoCadCOD_CONHECIMENTO.value;
        QDocAnteriorDT_EMISSAO.Value := Date;
        FDocAnteriorCad.ShowModal;
      end;
    end
    else if FDocAnteriorParam.RGDocumentos.ItemIndex = 2 then
    begin
      FImpDadosXML := TFImpDadosXML.Create(Application);
      if FImpDadosXML.ShowModal = MrOk then
      begin
        with DMConhecimento do
        begin
          for i := 0 to Length(FImpDadosXML.DFes) - 1 do
          begin
            QDocAnterior.Insert;
            QDocAnteriorCOD_CONHECIMENTO.Value := QConhecimentoCadCOD_CONHECIMENTO.value;
            QDocAnteriorDESC_CHAVE_ACESSO.Value := RightStr(FImpDadosXML.DFes[i].ChaveAcesso,44);
            QDocAnteriorIND_TP_DOC.Value := FImpDadosXML.DFes[i].Modelo;
            QDocAnteriorIND_IMPORTADO_XML.Value := 'S';
            QDocAnteriorVAL_TOTAL_CARGA.AsString := StringReplace(FImpDadosXML.DFes[i].ValorCarga,'.',',', [rfReplaceAll]);
            QDocAnteriorNUM_PESO_BRUTO.AsString := StringReplace(FImpDadosXML.DFes[i].PesoBruto,'.',',', [rfReplaceAll]);
            QDocAnteriorNUM_PESO_BC.AsString := StringReplace(FImpDadosXML.DFes[i].PesoBC,'.',',', [rfReplaceAll]);
            QDocAnteriorNUM_PESO_AFERIDO.AsString := StringReplace(FImpDadosXML.DFes[i].PesoAferido,'.',',', [rfReplaceAll]);
            QDocAnteriorNUM_CUBAGEM.AsString := StringReplace(FImpDadosXML.DFes[i].Cubagem,'.',',', [rfReplaceAll]);
            QDocAnteriorQT_VOLUMES.Value := Trunc(StrToFloat('0'+StringReplace(FImpDadosXML.DFes[i].Volumes,'.',',',[rfReplaceAll])));
            QDocAnterior.Post;

            if QConhecimentoCadCOD_CADASTRO_REMETENTE.Value = 0 then
              QConhecimentoCadCOD_CADASTRO_REMETENTE.Value :=
                DMNfe.OPNfe.CallIntegerFunction('COMPARA_CNPJ',[FImpDadosXML.Remetentes[i].CnpjCad]);
            if QConhecimentoCadCOD_CADASTRO_DESTINATARIO.Value = 0 then
              QConhecimentoCadCOD_CADASTRO_DESTINATARIO.Value :=
                DMNfe.OPNfe.CallIntegerFunction('COMPARA_CNPJ',[FImpDadosXML.Destinatarios[i].CnpjCad]);
            if (QConhecimentoCadIND_TIPO_SERVICO.Value = 1) and       //subcontratação
               (QConhecimentoCadCOD_CADASTRO_TOMADOR.Value = 0) then
              QConhecimentoCadCOD_CADASTRO_TOMADOR.Value :=
                DMNfe.OPNfe.CallIntegerFunction('COMPARA_CNPJ',[FImpDadosXML.Emitentes[i].CnpjCad]);

            codProduto :=
              DMOracle.FastSelect('COD_PRODUTO','TB_PRODUTO','DESC_PRODUTO = ' + QuotedStr( FImpDadosXML.DFes[i].ProPred));
            if codProduto <> '' then
              QConhecimentoCadCOD_PRODUTO.AsString := codProduto;
            if (CmbTpServ.ItemIndex > 0) and (QConhecimentoCadDESC_CHAVE_ACESSO_REF.Value = '') then
              QConhecimentoCadDESC_CHAVE_ACESSO_REF.Value := bib.LimpaNumero(FImpDadosXML.DFes[i].ChaveAcesso);
            QConhecimentoCadVAL_TOTAL_CARGA.Value := QConhecimentoCadVAL_TOTAL_CARGA.Value + QDocAnteriorVAL_TOTAL_CARGA.Value;
            QConhecimentoCadNUM_PESO_BRUTO.Value := QConhecimentoCadNUM_PESO_BRUTO.Value + QDocAnteriorNUM_PESO_BRUTO.Value;
            QConhecimentoCadNUM_PESO_BC.Value := QConhecimentoCadNUM_PESO_BC.Value + QDocAnteriorNUM_PESO_BC.Value;
            QConhecimentoCadNUM_PESO_AFERIDO.Value := QConhecimentoCadNUM_PESO_AFERIDO.Value + QDocAnteriorNUM_PESO_AFERIDO.Value;
            QConhecimentoCadNUM_CUBAGEM.Value := QConhecimentoCadNUM_CUBAGEM.Value + QDocAnteriorNUM_CUBAGEM.Value;
            QConhecimentoCadQT_VOLUMES.Value := QConhecimentoCadQT_VOLUMES.Value + QDocAnteriorQT_VOLUMES.Value;

            for j := 0 to Length(FImpDadosXML.DFes[i].InfNF) - 1 do
            begin
              QDocOriginario.Insert;
              QDocOriginarioNUM_CFOP.Value := StrToInt(FImpDadosXML.DFes[i].InfNF[j].CFOP);
              QDocOriginarioCOD_CONHECIMENTO.Value := QConhecimentoCadCOD_CONHECIMENTO.Value;
              QDocOriginarioNUM_DOCUMENTO.Value := FImpDadosXML.DFes[i].InfNF[j].Numero;
              QDocOriginarioDT_EMISSAO.Value := StrToDate(FImpDadosXML.DFes[i].InfNF[j].DEmissao);
              QDocOriginarioCOD_SERIE.Value := FImpDadosXML.DFes[i].InfNF[j].Serie;
              QDocOriginarioCOD_SERIE_MODELO.Value := FImpDadosXML.DFes[i].InfNF[j].Modelo;
              QDocOriginarioVAL_TOTAL.AsString := StringReplace(FImpDadosXML.DFes[i].InfNF[j].VNF,'.',',', [rfReplaceAll]);
              QDocOriginarioVAL_TOTAL_PRODUTOS.AsString := StringReplace(FImpDadosXML.DFes[i].InfNF[j].VProd,'.',',', [rfReplaceAll]);
              QDocOriginarioVAL_BASE_ICMS.AsString := StringReplace(FImpDadosXML.DFes[i].InfNF[j].VBC,'.',',', [rfReplaceAll]);
              QDocOriginarioVAL_BASE_ICMS_SUBST.AsString := StringReplace(FImpDadosXML.DFes[i].InfNF[j].VBCST,'.',',', [rfReplaceAll]);
              QDocOriginarioVAL_ICMS.AsString := StringReplace( FImpDadosXML.DFes[i].InfNF[j].VICMS,'.',',', [rfReplaceAll]);
              QDocOriginarioVAL_ICMS_SUBST.AsString := StringReplace(FImpDadosXML.DFes[i].InfNF[j].VST,'.',',', [rfReplaceAll]);

              QDocOriginario.Post;
            end;

            for j := 0 to FImpDadosXML.DFes[i].InfNFe.Count - 1 do
            begin
              QDocOriginario.Insert;
              QDocOriginarioCOD_CONHECIMENTO.Value := QConhecimentoCadCOD_CONHECIMENTO.value;
              QDocOriginarioDESC_CHAVE_ACESSO.Value := FImpDadosXML.DFes[i].InfNFe[j];
              QDocOriginarioCOD_SERIE_MODELO.Value := '55';
              QDocOriginario.Post;
            end;
          end;
        end;
      end;
    end
    else if FDocAnteriorParam.RGDocumentos.ItemIndex = 0 then
      begin
        if FConhecimentoCons = nil then
          FConhecimentoCons := TFConhecimentoCons.Create(Application);
        if FConhecimentoCons.ShowModal = mrOk then
        begin
          with DMConhecimento do
          begin
            if QConhecimentoConsDESC_CHAVE_ACESSO_CTE.Value <> '' then
            begin
              QDocAnterior.Insert;
              QDocAnteriorCOD_CONHECIMENTO.Value := QConhecimentoCadCOD_CONHECIMENTO.value;
              QDocAnteriorDESC_CHAVE_ACESSO.Value :=  bib.LimpaNumero(QConhecimentoConsDESC_CHAVE_ACESSO_CTE.Value);
              QDocAnteriorIND_TP_DOC.Value := '57';
              QDocAnteriorIND_IMPORTADO_XML.Value := 'S';
              QDocAnteriorVAL_TOTAL_CARGA.Value := QConhecimentoConsVAL_TOTAL_CARGA.Value;
              QDocAnteriorNUM_PESO_BRUTO.Value := QConhecimentoConsNUM_PESO_BRUTO.Value;
              QDocAnteriorNUM_PESO_BC.Value := QConhecimentoConsNUM_PESO_BC.Value;
              QDocAnteriorNUM_PESO_AFERIDO.Value := QConhecimentoConsNUM_PESO_AFERIDO.Value;
              QDocAnteriorNUM_CUBAGEM.Value := QConhecimentoConsNUM_CUBAGEM.Value;
              QDocAnteriorQT_VOLUMES.AsVariant := QConhecimentoConsQT_VOLUMES.Value;
              QDocAnterior.Post;

              QConhecimentoCadCOD_PRODUTO.Value := QConhecimentoConsCOD_PRODUTO.Value;
              if (CmbTpServ.ItemIndex > 0) then
                QConhecimentoCadDESC_CHAVE_ACESSO_REF.Value := bib.LimpaNumero(QConhecimentoConsDESC_CHAVE_ACESSO_CTE.Value);
              QConhecimentoCadVAL_TOTAL_CARGA.Value := QConhecimentoCadVAL_TOTAL_CARGA.Value + QDocAnteriorVAL_TOTAL_CARGA.Value;
              QConhecimentoCadNUM_PESO_BRUTO.Value := QConhecimentoCadNUM_PESO_BRUTO.Value + QDocAnteriorNUM_PESO_BRUTO.Value;
              QConhecimentoCadNUM_PESO_BC.Value := QConhecimentoCadNUM_PESO_BC.Value + QDocAnteriorNUM_PESO_BC.Value;
              QConhecimentoCadNUM_PESO_AFERIDO.Value := QConhecimentoCadNUM_PESO_AFERIDO.Value + QDocAnteriorNUM_PESO_AFERIDO.Value;
              QConhecimentoCadNUM_CUBAGEM.Value := QConhecimentoCadNUM_CUBAGEM.Value + QDocAnteriorNUM_CUBAGEM.Value;
              QConhecimentoCadQT_VOLUMES.Value := QConhecimentoCadQT_VOLUMES.Value + QDocAnteriorQT_VOLUMES.Value;

              QDocOriginarioCons.Close;
              QDocOriginarioCons.Open;
              
              QDocOriginarioCons.First;
              while not QDocOriginarioCons.Eof do
              begin
                QDocOriginario.Insert;
                QDocOriginarioNUM_CFOP.Value := QDocOriginarioConsNUM_CFOP.Value;
                QDocOriginarioCOD_CONHECIMENTO.Value := QConhecimentoCadCOD_CONHECIMENTO.Value;
                QDocOriginarioDESC_CHAVE_ACESSO.Value := QDocOriginarioConsDESC_CHAVE_ACESSO.Value;
                QDocOriginarioNUM_DOCUMENTO.Value := QDocOriginarioConsNUM_DOCUMENTO.Value;
                QDocOriginarioDT_EMISSAO.Value := QDocOriginarioConsDT_EMISSAO.Value;
                QDocOriginarioCOD_SERIE.Value := QDocOriginarioConsCOD_SERIE.Value;
                QDocOriginarioCOD_SERIE_MODELO.Value := QDocOriginarioConsCOD_SERIE_MODELO.Value;
                QDocOriginarioVAL_TOTAL.Value := QDocOriginarioConsVAL_TOTAL.Value;
                QDocOriginarioVAL_TOTAL_PRODUTOS.Value := QDocOriginarioConsVAL_TOTAL_PRODUTOS.Value;
                QDocOriginarioVAL_BASE_ICMS.Value := QDocOriginarioConsVAL_BASE_ICMS.Value;
                QDocOriginarioVAL_BASE_ICMS_SUBST.Value := QDocOriginarioConsVAL_BASE_ICMS_SUBST.Value;
                QDocOriginarioVAL_ICMS.Value := QDocOriginarioConsVAL_ICMS.Value;
                QDocOriginarioVAL_ICMS_SUBST.Value := QDocOriginarioConsVAL_ICMS_SUBST.Value;  
                QDocOriginario.Post;
                QDocOriginarioCons.Next;
              end;
            end;
          end;
        end;
      end;
end;

procedure TFCteCad.DBGDocAnteriorDblClick(Sender: TObject);
begin
  inherited;
  if FDocAnteriorCad = nil then
    FDocAnteriorCad := TFDocAnteriorCad.Create(Application);
  if DMConhecimento.QDocAnterior.RecordCount > 0 then
    if DMConhecimento.QDocAnteriorIND_TP_DOC.Value <> '' then
      FDocAnteriorCad.CMBTipoDoc.Text := DMConhecimento.QDocAnteriorIND_TP_DOC.Value;
  FDocAnteriorCad.ShowModal;
end;

procedure TFCteCad.SBNotaCorrecaoClick(Sender: TObject);
var
  RetProcessamento: String;
  ChaveAcesso: String;
begin
  inherited;
  if (DMConhecimento.QConhecimentoCadCOD_CONHECIMENTO.Value = 0) then
    raise Exception.Create('É necessário escolher um CT-e para emitir uma Carta de Correção Eletrônica.');
  if DMConhecimento.QConhecimentoCadDESC_CHAVE_ACESSO_CTE.IsNull then
  begin
    MessageDlg('O CT-e precisa ter uma chave de acesso. Se for um CT-e, confirme-o.', mtError, [mbOK], 0);
    Exit;
  end;
  RetProcessamento := '';
  ChaveAcesso := Copy( DMConhecimento.QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Value,4, 44);
  Buscador.Limpa;
  Buscador.Adiciona('DESC_RETORNO_PROCESSAMENTO', 'TB_CTE', 'DESC_CHAVE_ACESSO = ' + QuotedStr(ChaveAcesso));
  Buscador.Buscar();
  RetProcessamento := Buscador.Proximo;
  Buscador.Fecha;

  if RetProcessamento <> '100' then
  begin
    MessageDlg('O CT-e deve estar confirmado e autorizado pela Sefaz.', mtError, [mbOK], 0);
    Exit;
  end;

  if FCartaCorrecaoCTe = nil then
    FCartaCorrecaoCTe := TFCartaCorrecaoCTe.Create(application);
  FCartaCorrecaoCTe.pCTe := DMConhecimento.QConhecimentoCadCOD_CONHECIMENTO.Value;

  FCartaCorrecaoCTe.pChaveAcesso := ChaveAcesso;
  FCartaCorrecaoCTe.ShowModal;
end;

procedure TFCteCad.EmitirCartaCorrecaoClick(Sender: TObject);
begin
  inherited;
  SBNotaCorrecaoClick(Self);
end;

procedure TFCteCad.DBPanel1DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFCteCad.DBPTributacaoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTributacaoCons;
  Classe := TFTributacaoCons;
end;

procedure TFCteCad.DBPTributacaoCodigoChange(Sender: TObject);
begin
  inherited;
  if Trim(DBPTributacao.DBEdit.Text) <> '' then
  begin
    SomaValoresConhecimento;
    CalculaICMS;
  end;
end;

procedure TFCteCad.SBDocAntRemoverClick(Sender: TObject);
begin
  inherited;
  With DMConhecimento do
  begin
    if not QDocAnterior.IsEmpty  then
    begin
      if QDocAnteriorIND_IMPORTADO_XML.Value = 'S' then
      begin
        QConhecimentoCadQT_VOLUMES.Value :=
          QConhecimentoCadQT_VOLUMES.Value - QDocAnteriorQT_VOLUMES.Value;
        QConhecimentoCadNUM_PESO_BRUTO.Value :=
          QConhecimentoCadNUM_PESO_BRUTO.Value - QDocAnteriorNUM_PESO_BRUTO.Value;
        QConhecimentoCadNUM_PESO_BC.Value :=
          QConhecimentoCadNUM_PESO_BC.Value - QDocAnteriorNUM_PESO_BC.Value;
        QConhecimentoCadNUM_PESO_AFERIDO.Value :=
          QConhecimentoCadNUM_PESO_AFERIDO.Value - QDocAnteriorNUM_PESO_AFERIDO.Value;
        QConhecimentoCadNUM_CUBAGEM.Value :=
          QConhecimentoCadNUM_CUBAGEM.Value - QDocAnteriorNUM_CUBAGEM.Value;
        QConhecimentoCadVAL_TOTAL_CARGA.Value :=
          QConhecimentoCadVAL_TOTAL_CARGA.Value - QDocAnteriorVAL_TOTAL_CARGA.Value;
      end;
      QDocAnterior.Delete;
    end;
  end;
end;

procedure TFCteCad.SBSeguradoraClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    DMConhecimento.QConhecimentoCadCOD_SEGURADORA.Value := DMCadastro.QCadastroConsCOD_CADASTRO.Value;
    DMConhecimento.QConhecimentoCadDESC_SEGURADORA.Value := DMCadastro.QCadastroConsNOME.Value;
  end;
end;

procedure TFCteCad.DBPSeguradoraCodigoExit(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
    if QConhecimentoCadCOD_SEGURADORA.Value > 0 then
      QConhecimentoCadDESC_SEGURADORA.Value := DMOracle.FastSelect('NOME','TB_CADASTRO','COD_CADASTRO = ' + QConhecimentoCadCOD_SEGURADORA.Text);
end;

procedure TFCteCad.DBEFretePorTonExit(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    if (QConhecimentoCadVAL_FRETE_POR_TON.Value > 0) and (QConhecimentoCadNUM_PESO_BRUTO.Value > 0) then
      QConhecimentoCadVAL_FRETE.Value := (QConhecimentoCadVAL_FRETE_POR_TON.Value * QConhecimentoCadNUM_PESO_BRUTO.Value)/1000
      - IfThen(QConhecimentoCadIND_PEDAGIO_INCLUSO.Value = 'S', QConhecimentoCadVAL_PEDAGIO.Value, 0);  
    SomaValoresConhecimento;
    CalculaICMS;
  end;
end;

procedure TFCteCad.DBRTomaChange(Sender: TObject);
begin
  inherited;
  GPBCTeAnulacao.Visible := DBRToma.Value = 'N';
  //GPBTomaContICMS.Visible := DBRToma.Value = 'S';
end;

procedure TFCteCad.ConhecimentosComNotasDestinatrios1Click(
  Sender: TObject);
begin
  inherited;
  if FConhecimentoParam = nil then
    FConhecimentoParam := TFConhecimentoParam.Create(Application);
  FConhecimentoParam.PGRelatorio.Pages[19].TabVisible := True;
  if FConhecimentoParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FConhecimentoParam.FmFilial19.MeFilial.Text), 'CONHECIMENTO');
    with DMConhecimento do
    begin
      QRConhecimentosCidades.Close;
      QRConhecimentosCidades.ClearVariables;
      //--------Frames
      if Trim(FConhecimentoParam.FmFilial19.MeFilial.Text) <> '' then
        QRConhecimentosCidades.SetVariable('COD_FILIAL',Trim(FConhecimentoParam.FmFilial19.MeFilial.Text))
      else
        QRConhecimentosCidades.SetVariable('COD_FILIAL', Null);
      if Trim(FConhecimentoParam.FmConhecimento19.MeConhecimento.Text) <> '' then
        QRConhecimentosCidades.SetVariable('COD_CONHECIMENTO', Trim(FConhecimentoParam.FmConhecimento19.MeConhecimento.Text))
      else
        QRConhecimentosCidades.SetVariable('COD_CONHECIMENTO', Null);
      if Trim(FConhecimentoParam.FmRemetente19.MeCadastro.Text) <> '' then
        QRConhecimentosCidades.SetVariable('REMETENTE', Trim(FConhecimentoParam.FmRemetente19.MeCadastro.Text))
      else
        QRConhecimentosCidades.SetVariable('REMETENTE', Null);
      if Trim(FConhecimentoParam.FmDestinatario19.MeCadastro.Text) <> '' then
        QRConhecimentosCidades.SetVariable('DESTINATARIO', Trim(FConhecimentoParam.FmDestinatario19.MeCadastro.Text))
      else
        QRConhecimentosCidades.SetVariable('DESTINATARIO', Null);
      if Trim(FConhecimentoParam.FmCidade19.MeCidade.Text) <> '' then
        QRConhecimentosCidades.SetVariable('COD_CIDADE_IBGE',
          DMOracle.FastSelect('COD_CIDADE_IBGE','TB_CIDADE','COD_CIDADE = ' +
          Trim(FConhecimentoParam.FmCidade19.MeCidade.Text)))
      else
        QRConhecimentosCidades.SetVariable('COD_CIDADE_IBGE', Null);

      if (Trim(FConhecimentoParam.FmDataEmissao19.MeDtInicial.Text) <> '') and
                    (Trim(FConhecimentoParam.FmDataEmissao19.MeDtFinal.Text) <> '') then
      begin
        QRConhecimentosCidades.SetVariable(':DT_INICIAL', StrToDate(FConhecimentoParam.FmDataEmissao19.MeDtInicial.Text));
        QRConhecimentosCidades.SetVariable(':DT_FINAL', StrToDate(FConhecimentoParam.FmDataEmissao19.MeDtFinal.Text));
      end
      else
        Raise Exception.Create('É necessário informar o período de datas de emissão.');

      if (Trim(FConhecimentoParam.FmDataEntrega19.MeDtInicial.Text) <> '') and
                    (Trim(FConhecimentoParam.FmDataEntrega19.MeDtFinal.Text) <> '') then
      begin
        QRConhecimentosCidades.SetVariable(':DT_ENTREGA_INICIAL', StrToDate(FConhecimentoParam.FmDataEntrega19.MeDtInicial.Text));
        QRConhecimentosCidades.SetVariable(':DT_ENTREGA_FINAL', StrToDate(FConhecimentoParam.FmDataEntrega19.MeDtFinal.Text));
      end;
      //-----------
      QRConhecimentosCidades.Open;
      if FRConhecimentosCidades = nil then
        FRConhecimentosCidades := TFRConhecimentosCidades.Create(Application);
      //Cabeçalho Relatório
      FRConhecimentosCidades.QRLEmpresa.Caption := Trim(DMParamSistema.QParamSistemaDESC_EMPRESA.Text);
      FRConhecimentosCidades.QRLTitulo.Caption  := 'Relatório de Conhecimentos de Transporte Eletrônicos';
      //FRConhecimentosCidades.QRLFilial.Caption  := 'Filial: '  + Trim(FConhecimentoParam.FmFilial19.EdFilial.Text);
      FRConhecimentosCidades.QRLEmissao.Caption := 'Emissão: ' + Trim(FConhecimentoParam.FmDataEmissao19.MeDtInicial.Text) +
                                               ' até ' + Trim(FConhecimentoParam.FmDataEmissao19.MeDtFinal.Text);
      if (Trim(FConhecimentoParam.FmDataEntrega19.MeDtInicial.Text) = '') or
                    (Trim(FConhecimentoParam.FmDataEntrega19.MeDtFinal.Text) = '') then
        FRConhecimentosCidades.QRLEntrega.Enabled := false
      else
      begin
        FRConhecimentosCidades.QRLEntrega.Enabled := true;
        FRConhecimentosCidades.QRLEntrega.Caption := 'Previsão de Entrega: ' + Trim(FConhecimentoParam.FmDataEntrega19.MeDtInicial.Text) +
                                               ' até ' + Trim(FConhecimentoParam.FmDataEntrega19.MeDtFinal.Text);
      end;  
      //----------------------------

      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FRConhecimentosCidades.QRPrimario.Preview
      else
        FRConhecimentosCidades.QRPrimario.Print;
    end;
  end;
end;

procedure TFCteCad.DenegarCTe1Click(Sender: TObject);
begin
  inherited;
  if DMConhecimento.QConhecimentoCad.RecordCount = 0 then
  begin
    MessageDlg('Nenhum CT-e foi selecionado.', mtError, [mbOk],0);
    Abort;
  end;
  if (DMConhecimento.QConhecimentoCadIND_SITUACAO.Value <> '2') and
    (DMConhecimento.QConhecimentoCadIND_SITUACAO.Value <> '1') then
  begin
    MessageDlg('Somente CT-es Digitados ou Confirmados podem ser Denegados',
    mtError, [mbOk],0);
    Abort;
  end;
  if DMConhecimento.QConhecimentoCadIND_SITUACAO.Value = '2' then
    VoltarConfirmao1Click(Sender);
  with DMOracle do
  begin
    DBCemapa.StartTransaction;
    QExecSQL.Close;
    QExecSQL.SQL.Clear;
    QExecSQL.SQL.Add('UPDATE TB_CONHECIMENTO SET IND_SITUACAO = ');
    QExecSQL.SQL.Add(SIT_CTE_DENEGADO);
    QExecSQL.SQL.Add(' WHERE COD_CONHECIMENTO = ');
    QExecSQL.SQL.Add(DMConhecimento.QConhecimentoCadCOD_CONHECIMENTO.Text);
    QExecSQL.ExecSQL;
    DBCemapa.Commit;
  end;
  SBRefreshClick(Sender);
end;

procedure TFCteCad.VoltarCTeDenegado1Click(Sender: TObject);
begin
  inherited;
  if DMConhecimento.QConhecimentoCad.RecordCount = 0 then
  begin
    MessageDlg('Nenhum CT-e foi selecionado.', mtError, [mbOk],0);
    Abort;
  end;
  if (DMConhecimento.QConhecimentoCadIND_SITUACAO.Value <> '4') then
  begin
    MessageDlg('O CT-e não está Denegado.',
    mtError, [mbOk],0);
    Abort;
  end;
  with DMOracle do
  begin
    DBCemapa.StartTransaction;
    QExecSQL.Close;
    QExecSQL.SQL.Clear;
    QExecSQL.SQL.Add('UPDATE TB_CONHECIMENTO SET IND_SITUACAO = ');
    QExecSQL.SQL.Add(SIT_CTE_DIGITADO);
    QExecSQL.SQL.Add(' WHERE COD_CONHECIMENTO = ');
    QExecSQL.SQL.Add(DMConhecimento.QConhecimentoCadCOD_CONHECIMENTO.Text);
    QExecSQL.ExecSQL;
    DBCemapa.Commit;
  end;
  SBRefreshClick(Sender);
end;

procedure TFCteCad.DBPanel3CodigoExit(Sender: TObject);
begin
  inherited;
  if (DMOracle.FastSelect('desc_versao_cte','tb_filial','cod_filial = ' +
        DMConhecimento.QConhecimentoCadCOD_FILIAL.Text) = '3.00') then
  begin
    DBEChaveAcesso.Width := 542;
    SBChaveAcesso.Left := 552;
    DBRGModal.Visible := False;
    TSSeguro.TabVisible := False;
    DBCBGlobalizado.Visible := True;
  end
  else
  begin
    DBEChaveAcesso.Width := 292;
    SBChaveAcesso.Left := 302;
    DBRGModal.Visible := True;
    TSSeguro.TabVisible := True;
    DBCBGlobalizado.Visible := False;
  end;
end;

procedure TFCteCad.DBPanel4BuscaClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
end;

end.


