unit UMdfeCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, OracleData, OraTeste, DBDirceu, variants, ActnList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, XMLDoc,
  xmldom, XMLIntf, msxmldom, DBPanel, OracleNavigator, Grids, DBGrids,
  UFmNota, CustomDialog, UFmEstado, UFmBanco;

type
  TFMdfeCad = class(TFTCadSimples)
    ImpressoManifesto1: TMenuItem;
    Opes1: TMenuItem;
    Confirma1: TMenuItem;
    VoltarConfirmao1: TMenuItem;
    Cancela1: TMenuItem;
    VoltarCancelamento1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label17: TLabel;
    DBECodConhecimento: TDBEdit;
    SbSerie: TBitBtn;
    SBNotaCorrecao: TSpeedButton;
    lblModelo: TLabel;
    SBChaveAcesso: TSpeedButton;
    DBEChaveAcesso: TDBEdit;
    Label2: TLabel;
    DBRTipoEmitente: TDBRadioGroup;
    CMBModal: TComboBox;
    Label7: TLabel;
    DsCondutorMDFe: TDataSource;
    TabSheet4: TTabSheet;
    GroupBox5: TGroupBox;
    OracleNavigator1: TOracleNavigator;
    DBGrid1: TDBGrid;
    DBPCondutorMDFe: TDBPanel;
    GroupBox7: TGroupBox;
    OracleNavigator2: TOracleNavigator;
    DBGrid2: TDBGrid;
    DsVeiculoMDFe: TDataSource;
    DBPFilial: TDBPanel;
    DBTSituacao: TDBText;
    DBTSitSefaz: TDBText;
    N2: TMenuItem;
    EncerramentoMDFe: TMenuItem;
    EnviarviaEmail1: TMenuItem;
    ReemitirDamdfe: TMenuItem;
    Reconsultar1: TMenuItem;
    Exportar1: TMenuItem;
    ExportarMDFesPorPerodo1: TMenuItem;
    VerRetornodeEnvio1: TMenuItem;
    N3: TMenuItem;
    DenegarCTe1: TMenuItem;
    VoltarCTeDenegado1: TMenuItem;
    SaveDialogExportaMDFes: TSaveDialog;
    btPlacaCons: TBitBtn;
    Label41: TLabel;
    EdVeiculo: TEdit;
    EDPlaca: TDBEdit;
    RelaodeMDFes1: TMenuItem;
    TabSheet6: TTabSheet;
    GBInfDoc: TGroupBox;
    SBInserir: TSpeedButton;
    SBRemover: TSpeedButton;
    Label44: TLabel;
    DBGInfDoc: TDBGrid;
    DBPCarregamento: TDBPanel;
    DBPDescarregamento: TDBPanel;
    DBMObs: TDBMemo;
    BtMensagem: TBitBtn;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    DBGrid3: TDBGrid;
    DsCidadeDescarga: TDataSource;
    DsCidadeCarrega: TDataSource;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    OracleNavigator3: TOracleNavigator;
    DBGrid4: TDBGrid;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    OracleNavigator4: TOracleNavigator;
    DBMemo1: TDBMemo;
    Label40: TLabel;
    InclusodeCondutor1: TMenuItem;
    DsUFPercurso: TDataSource;
    GBUFPercurso: TGroupBox;
    btIncluir: TSpeedButton;
    btExcluir: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    DBPanel8: TDBPanel;
    VoltarEncerramento1: TMenuItem;
    CBSomaTotais: TCheckBox;
    SBImportarDadosEmbarque: TSpeedButton;
    TabSheet3: TTabSheet;
    GBSeguro: TGroupBox;
    DBPSeguradora: TDBPanel;
    DsSeguroMDFe: TDataSource;
    DBGSeguro: TDBGrid;
    OracleNavigator5: TOracleNavigator;
    DBPContratante: TDBPanel;
    DBPNumApolice: TDBPanel;
    DBPNumAverbacao: TDBPanel;
    DBRRespSeguro: TDBRadioGroup;
    ConsultarMDFesNoEncerrados1: TMenuItem;
    Fm8Estado: TFmEstado;
    DBGrid5: TDBGrid;
    Label1: TLabel;
    DBPProdutoPredominante: TDBPanel;
    DBCBLotacao: TDBCheckBox;
    CBTipoCarga: TComboBox;
    DBPCepCarrega: TDBPanel;
    DBPCepDescarrega: TDBPanel;
    Label3: TLabel;
    TabSheet5: TTabSheet;
    DsValePedagio: TDataSource;
    GroupBox6: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    OracleNavigator6: TOracleNavigator;
    DBGrid6: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GBInformacaoPagamento: TGroupBox;
    FMBanco1: TFMBanco;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBFilialClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBSerieClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure ImpressoManifesto1Click(Sender: TObject);

    procedure SBConfirmarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure Confirma1Click(Sender: TObject);
    procedure VoltarConfirmao1Click(Sender: TObject);
    procedure VoltarCancelamento1Click(Sender: TObject);
    procedure Cancela1Click(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBChaveAcessoClick(Sender: TObject);
    procedure DBPFilialDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure BtMensagemClick(Sender: TObject);
    procedure EnviarviaEmail1Click(Sender: TObject);
    procedure ReemitirDamdfeClick(Sender: TObject);
    procedure Reconsultar1Click(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure VerRetornodeEnvio1Click(Sender: TObject);
    procedure DBECodConhecimentoChange(Sender: TObject);
    procedure ExportarMDFesPorPerodo1Click(Sender: TObject);
    procedure BtCopiaClick(Sender: TObject);
    procedure btPlacaConsClick(Sender: TObject);
    procedure EDPlacaChange(Sender: TObject);
    procedure DsVeiculoMDFeStateChange(Sender: TObject);
    procedure EDPlacaExit(Sender: TObject);
    procedure RelaodeMDFes1Click(Sender: TObject);
    procedure SBInserirClick(Sender: TObject);
    procedure DBGInfDocDblClick(Sender: TObject);
    procedure DBPCondutorMDFeDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPDescarregamentoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPCarregamentoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure SBRemoverClick(Sender: TObject);
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel1DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DsCidadeDescargaStateChange(Sender: TObject);
    procedure EncerramentoMDFeClick(Sender: TObject);
    procedure InclusodeCondutor1Click(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure DBGrid5KeyPress(Sender: TObject; var Key: Char);
    procedure BtEstadoClick(Sender: TObject);
    procedure Fm8EstadoMeEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure Fm8EstadoMeEstadoEnter(Sender: TObject);
    procedure Fm8EstadoMeEstadoExit(Sender: TObject);
    procedure VoltarEncerramento1Click(Sender: TObject);
    procedure SBImportarDadosEmbarqueClick(Sender: TObject);
    procedure DBPSeguradoraDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBRRespSeguroChange(Sender: TObject);
    procedure ConsultarMDFesNoEncerrados1Click(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure Fm8EstadoBtEstadoClick(Sender: TObject);
    procedure DBPContratanteDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure OracleNavigator5Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure MELocalizaExit(Sender: TObject);
    procedure DBPProdutoPredominanteDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBCBLotacaoClick(Sender: TObject);
    procedure OracleNavigator6Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure DBRTipoEmitenteClick(Sender: TObject);
    //procedure BtImportaCTeRefClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMdfeCad: TFMdfeCad;

implementation

uses UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl,
  UVeiculoConhecimentoCons, UVeiculoConhecimento_cl,
  UTributacaoCons, USerieCons, USerie_cl, uBiblioteca,
  UOracle_cl, UParamSistema_cl,
  Ucontrato_cl, UUsuario_cl, UMensagemCons, UMensagem_cl,
  UNotaEntradaCons, UNfe_cl, StrUtils,
  DateUtils, UImpDadosXML, UManifesto_cl, UInfDoc, UCidadeCons,
  UMdfeLoteCons, UExportarMDFeParam, UMdfeCons, UMdfe_Cancela, UEstadoCons,
  UDocAnteriorParam, UEstado_cl, UNotaSaidaCons, UNotaSaida_cl,
  UConhecimentoCons, UConhecimento_cl, UEmbarqueCons, UEmbarque_cl,
  UProdutoCons;

{$R *.DFM}

procedure TFMdfeCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMManifesto do
  begin
    QManifesto.open;
    QVeiculoMDFe.Open;
    QCondutorMDFe.Open;
    QCidadeCarrega.Open;
    QCidadeDescarga.Open;
    QUFPercurso.Open;
    QInfDoc.Open;
    QSeguroMDFe.Open;
    QValePedagio.Open;
  end;
  DMVeiculoConhecimento.QVeiculoCad.Open;
  DMParamSistema.QParamSistema.Open;
end;

procedure TFMdfeCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMManifesto do
  begin
    QManifesto.Close;
    QManifestoCons.Close;
    QVeiculoMDFe.Close;
    QCondutorMDFe.Close;
    QInfDoc.Close;
    QCidadeCarrega.Close;
    QCidadeDescarga.Close;
    QUFPercurso.Close;
    QSeguroMDFe.Close;
    QValePedagio.Close; 
  end;
  DMVeiculoConhecimento.QVeiculoCad.Open;
  DMParamSistema.QParamSistema.Close;
  action := cafree;
  FMdfeCad := nil;
end;

procedure TFMdfeCad.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    DMManifesto.QManifestoCod_Filial.value := DMFilial.QFilialConsCod_Filial.value;
end;

procedure TFMdfeCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FMdfeCons = nil then
    FMdfeCons := TFMdfeCons.Create(Application);
  if FMdfeCons.ShowModal = mrOk then
  begin
    with DMManifesto do
    begin
      QManifesto.Close;
      QManifesto.SetVariable('PK', QManifestoConsCOD_MANIFESTO.Value);
      QManifesto.Open;
      MELocalizaExit(Self);
    end;
  end;
  bib.setModelo(DMManifesto.QManifesto, lblModelo);
end;

procedure TFMdfeCad.SBSerieClick(Sender: TObject);
begin
  inherited;
  if FSerieCons = nil then
    FSerieCons := TFSerieCons.Create(Application);
  if FSerieCons.ShowModal = mrOk then
  begin
    DMManifesto.QManifestoCod_Serie.Value := DMSerie.QSerieConsCod_Serie.Value;
    DMManifesto.QManifestoCOD_SERIE_MODELO.Value := DMSerie.QSerieConsCOD_SERIE_MODELO.Value;
  end;
end;

procedure TFMdfeCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [Dsinsert, DsEdit] then
  begin
    SBChaveAcesso.Enabled := True;
    SbSerie.Enabled := True;
    BtMensagem.Enabled := True;
    GBInfDoc.Enabled := True;
    GBUFPercurso.Enabled := true;
  end
  else
  begin
    SBChaveAcesso.Enabled := False;

    SbSerie.Enabled := False;
    BtMensagem.Enabled := False;
    GBInfDoc.Enabled := False;
    GBUFPercurso.Enabled := False;
  end;
  MMCadSimples.Items[2].Enabled := DSPrimario.DataSet.State = dsBrowse;
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

procedure TFMdfeCad.ImpressoManifesto1Click(Sender: TObject);
var
  wLote: Integer;
  wResult, wTipo: string;
begin
  inherited;
  with DMManifesto do
  begin
    wTipo := QManifestoCOD_SERIE_MODELO.Value;
    if wTipo = '58' then
    begin
      wResult := DMOracle.BuscaNome('SELECT ID_LOTE FROM TB_MDFE','COD_MANIFESTO = '+QManifestoCOD_MANIFESTO.Text);
      if wResult = '' then
        wLote := 0
      else
        wLote := StrToInt(wResult);
      DMNfe.EmissaoMdfe(QManifestoCOD_MANIFESTO.Value, wLote, True);
      Exit;
    end;
  end;
end;

procedure TFMdfeCad.SBConfirmarClick(Sender: TObject);
begin
  DMManifesto.QManifestoIND_MODAL.Value := CMBModal.ItemIndex + 1;
  DMManifesto.QManifestoIND_TIPO_CARGA.Value := CBTipoCarga.ItemIndex + 1;
  DMManifesto.QManifestoDESC_OBS.Value := Trim(DMManifesto.QManifestoDESC_OBS.Value);
  if trim(FMBanco1.MeBanco.Text) <> '' then
    DMManifesto.QManifestoCOD_BANCO_AGENCIA.Text := Trim(FMBanco1.MeBanco.Text);
  if (DMManifesto.QManifestoCOD_PRODUTO.Value > 0) and (CBTipoCarga.ItemIndex = -1) then
    Raise Exception.Create('Informe o tipo de carga.');
  inherited;
  DMOracle.DBCemapa.Commit;
  bib.setModelo(DMManifesto.QManifesto, lblModelo);
end;

procedure TFMdfeCad.SBExcluirClick(Sender: TObject);
begin
  if MessageDlg('Apagar Este Manifesto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if (not DMManifesto.QManifestoDESC_CHAVE_ACESSO.IsNull) then
    begin

      DMNfe.SetaMdfe(DMManifesto.QManifestoDESC_CHAVE_ACESSO.Value, true);
      if (StrToInt('0' + DMNfe.QMdfeSIT_MDFE.Value) in SIT_MDFE_ACEITO) and (DMManifesto.QManifestoIND_AMBIENTE_MDFE.Value = 1) then
      begin
        MessageDlg( 'Este MDF-e está registrado na SEFAZ.' + #13 + #10 +
          'Não é permitida a sua exclusão.', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    DMManifesto.ExcluiManifesto;
  end;
end;

procedure TFMdfeCad.Confirma1Click(Sender: TObject);
var
  wNumDoc: string;
  wCodDoc, wCodCompl: Real;
  wFilial, wProprietario: Integer;
  wData: TDateTime;
  wSaldo: real;
  wMes, wAno, wDia: Word;
begin
  inherited;
  //colocado este teste para não permitir emitir nota fiscal de clientes que não estão pagando o sistema - Cesar Angonese
  if DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_FILIAL', 'COD_FILIAL = ' + DMManifesto.QManifestoCod_Filial.Text) = 'C' Then
     raise Exception.Create('Cliente com pendência financeira - Favor entrar em contato com Cemapa');
                                                              
  If DMManifesto.QManifestoInd_Situacao.Value <> '1' Then
     Raise Exception.Create('Este manifesto está Confirmado ou Cancelado');
  if (DMManifesto.QSeguroMDFe.RecordCount = 0) and
     (DMManifesto.QManifestoIND_TIPO_EMITENTE.Value = 1) and
     (DMOracle.BuscaNome('SELECT DESC_VERSAO_MDFE FROM TB_FILIAL','COD_FILIAL = '+
        DMManifesto.QManifestoCOD_FILIAL.Text)<> '1.00') then
  begin
    MessageDlg('É preciso informar todos os dados do seguro da carga.', mtInformation, [mbOk], 0);
    Abort;
  end;
  DMOracle.DBCemapa.StartTransaction;
  try
    with DMManifesto do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(QManifestoCOD_FILIAL.Text), 'CONHECIMENTO');
      QManifesto.Edit;
      if QManifestoNUM_MANIFESTO.Value = 0 then
        QManifestoNUM_MANIFESTO.Value := DMSerie.NumeroSerie(QManifestoCod_Filial.Value, QManifestoCod_Serie.Value,
          QManifestoCOD_SERIE_MODELO.Value);

      DecodeDate(QManifestoDt_Emissao.Value, wAno, wMes, wDia);
      QManifestoInd_Situacao.Value := '2';
      QManifesto.Post;
      ImpressoManifesto1Click(Self);
      DMOracle.DBCemapa.Commit;
    end;
  except
    DMManifesto.QManifesto.Cancel;
    DMOracle.DBCemapa.Rollback;
    raise;
  end;
  DMManifesto.QManifesto.Close;
  DMManifesto.QManifesto.Open;
end;

procedure TFMdfeCad.VoltarConfirmao1Click(Sender: TObject);
begin
  inherited;
  if DMManifesto.QManifestoNUM_MANIFESTO.Value <> 0 then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(DMManifesto.QManifestoCOD_FILIAL.Text), 'CONHECIMENTO');
    
    DMOracle.DBCemapa.StartTransaction;
    DMManifesto.QManifesto.Edit;
    DMManifesto.QManifestoIND_SITUACAO.Value := '1';
    DMManifesto.QManifesto.Post;
    try
      DMOracle.Audit(TOracleDataset1(DSPrimario.Dataset), 'Volta Confirmação');
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      DMManifesto.QManifesto.Close;
      DMManifesto.QManifesto.Open;
      raise;
    end;
  end;
end;

procedure TFMdfeCad.VoltarCancelamento1Click(Sender: TObject);
begin
  inherited;
  if DMManifesto.QManifestoInd_Situacao.Value <> '3' then
    raise Exception.Create('Este manifesto não foi cancelado!');
  with DMManifesto do
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(QManifestoCOD_FILIAL.Text), 'CONHECIMENTO');
    try
      DMOracle.DBCemapa.StartTransaction;
      QManifesto.Edit;
      QManifestoInd_Situacao.Value := '1';
      QManifesto.Post;

      DMOracle.DBCemapa.Commit;
    except
      if QManifesto.State <> dsBrowse then
        QManifesto.Cancel;
      raise Exception.Create('Não é possível voltar cancelamento deste Manifesto!');
    end;
  end;
end;

procedure TFMdfeCad.Cancela1Click(Sender: TObject);
begin
  inherited;
  if DMManifesto.QManifestoInd_Situacao.Value = '2' then
    raise Exception.Create('Não é possivel cancelar um Manifesto confirmado!');
  if DMManifesto.QManifestoInd_Situacao.Value = '3' then
    raise Exception.Create('Este Manifesto já está cancelado!');
  if DMManifesto.QManifestoNUM_MANIFESTO.Value = 0 then
    raise Exception.Create('Não é possível cancelar um Manifesto que não foi confirmado.' +
      #13 + #10 + 'Para se desfazer deste manifesto basta excluir.');
  if FMdfe_Cancela = nil then
    FMdfe_Cancela := TFMdfe_Cancela.Create(Application);
  FMdfe_Cancela.ShowModal;
end;

procedure TFMdfeCad.SBAlterarClick(Sender: TObject);
begin
  if DMManifesto.QManifestoInd_Situacao.Value <> '1' then
    raise Exception.Create('Somente Alterar Manifesto - Digitado')
  else
    inherited;
end;

procedure TFMdfeCad.DSPrimarioDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  with DMManifesto.QManifestoIND_SITUACAO do
    if Value = SIT_MDFE_DIGITADO then
      DBTSituacao.Font.Color := clRed
    else if (Value = SIT_MDFE_CONFIRMADO) or (Value = SIT_MDFE_DENEGADO) or
            (Value = SIT_MDFE_ENCERRADO) then
      DBTSituacao.Font.Color := clGreen
    else if Value = SIT_MDFE_CANCELADO then
      DBTSituacao.Font.Color := clBlue
    else
      DBTSituacao.Font.Color := clWindowText;
end;

procedure TFMdfeCad.SBCancelarClick(Sender: TObject);
begin
  with DMManifesto do
  begin
    if QCondutorMDFe.State in [dsEdit, dsInsert] then
      QCondutorMDFe.Cancel;
    if QVeiculoMDFe.State in [dsEdit, dsInsert] then
      QVeiculoMDFe.Cancel;
    if QCidadeDescarga.State in [dsEdit, dsInsert] then
      QCidadeDescarga.Cancel;
    if QCidadeCarrega.State in [dsEdit, dsInsert] then
      QCidadeCarrega.Cancel;
    if QSeguroMDFe.State in [dsEdit, dsInsert] then
      QSeguroMDFe.Cancel;
    if QUFPercurso.State in [dsEdit, dsInsert] then
      QUFPercurso.Cancel;
  end;
  inherited;
end;

procedure TFMdfeCad.SBChaveAcessoClick(Sender: TObject);
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
        DMManifesto.QManifestoDESC_CHAVE_ACESSO.Value := 'MDFe' + Chave;
    end;
  end;
begin
  inherited;
  with DMNfe do
  begin
    SetaCte(Bib.LimpaNumero(DMManifesto.QManifestoDESC_CHAVE_ACESSO.Value), True);
    if (QMdfeind_aprovado.Value) or (QMdfeind_cancelado.Value) or (QMdfeind_encerrado.Value) then
    begin
      MessageDlg('Esta chave já está autorizada, cancelada, ou encerrada na SEFAZ.' + #13 + #10 +
        'Não é permitido alterar a chave de uma nota nesta situação.', mtInformation, [mbOK], 0);
      Exit;
    end;
  end;
  case MessageDlgCustom('Alterar chave de acesso', mtConfirmation,
    [mbYes, mbNo, mbCancel], ['Informar manualmente',
    'Gerar outra chave automaticamente', 'Cancelar'], nil) of
    mrYes:
      ChaveManual(DMManifesto.QManifestoDESC_CHAVE_ACESSO.Value);
    mrNo:
      if (MessageDlg('Tem certeza?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        MessageDlg('A Chave de Acesso será apagada, pois, assim, ela será gerada automaticamente na confirmação do manifesto.', mtInformation, [mbOK], 0);
        DMManifesto.QManifestoDESC_CHAVE_ACESSO.Value := '';
      end;
  end;
end;

procedure TFMdfeCad.DBPFilialDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFMdfeCad.BtMensagemClick(Sender: TObject);
var str: String;
begin
  inherited;
  if FMensagemCons = nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  if FMensagemCons.ShowModal = MrOk then
  begin
    str := DMManifesto.QManifestoDESC_OBS.Value;
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
    DMManifesto.QManifestoDESC_OBS.Value := str;
  end;
end;


procedure TFMdfeCad.EnviarviaEmail1Click(Sender: TObject);
begin
  inherited;
  with DMManifesto do
  begin
    if QManifestoDESC_CHAVE_ACESSO.IsNull then
    begin
      MessageDlg('Por favor, informe um conhecimento que contenha chave de acesso.', mtError, [mbOK], 0);
      Exit;
    end;

    if FMdfeLoteCons = nil then
      FMdfeLoteCons := TFMdfeLoteCons.Create(Application);
    FMdfeLoteCons.CarregaManifesto(QManifestoCOD_MANIFESTO.Value);
    FMdfeLoteCons.Foco := mtEmail;
    FMdfeLoteCons.ShowModal;
  end;
end;

procedure TFMdfeCad.ReemitirDamdfeClick(Sender: TObject);
begin
  inherited;
  with DMManifesto do
    if (not QManifestoDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FMdfeLoteCons = nil then
        FMdfeLoteCons := TFMdfeLoteCons.Create(Application);
      FMdfeLoteCons.CarregaManifesto(QManifestoCOD_MANIFESTO.Value);
      FMdfeLoteCons.Foco := mtDamdfe;
      FMdfeLoteCons.ShowModal;
    end;
end;

procedure TFMdfeCad.Reconsultar1Click(Sender: TObject);
begin
  inherited;
  with DMManifesto do
    if (not QManifestoDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FMdfeLoteCons = nil then
        FMdfeLoteCons := TFMdfeLoteCons.Create(Application);
      FMdfeLoteCons.CarregaManifesto(QManifestoCOD_MANIFESTO.Value);
      FMdfeLoteCons.Foco := mtConsulta;
      FMdfeLoteCons.ShowModal;
    end;
end;

procedure TFMdfeCad.Exportar1Click(Sender: TObject);
begin
  inherited;
  with DMManifesto do
    if (not QManifestoDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FMdfeLoteCons = nil then
        FMdfeLoteCons := TFMdfeLoteCons.Create(Application);
      FMdfeLoteCons.CarregaManifesto(QManifestoCOD_MANIFESTO.Value);
      FMdfeLoteCons.Foco := mtExportar;
      FMdfeLoteCons.ShowModal;
    end;
end;

procedure TFMdfeCad.VerRetornodeEnvio1Click(Sender: TObject);
begin
  inherited;
  with DMManifesto do
    if (not QManifestoDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FMdfeLoteCons = nil then
        FMdfeLoteCons := TFMdfeLoteCons.Create(Application);
      FMdfeLoteCons.CarregaManifesto(QManifestoCOD_MANIFESTO.Value);
      FMdfeLoteCons.Foco := mtRetornoEnvio;
      FMdfeLoteCons.ShowModal;
    end;
end;       

procedure TFMdfeCad.DBECodConhecimentoChange(Sender: TObject);
begin
  inherited;
  with DMManifesto do
  begin
    DMNfe.SetaMdfe(QManifestoDESC_CHAVE_ACESSO.Value, true);
    MMCadSimples.Items[2].Items[0].Enabled := QManifestoIND_SITUACAO.Value = '1';
    MMCadSimples.Items[2].Items[1].Enabled := QManifestoIND_SITUACAO.Value = '1';
    MMCadSimples.Items[2].Items[2].Enabled := ((QManifestoIND_SITUACAO.Value = '2') or (QManifestoIND_SITUACAO.Value = '1')) and DMNfe.QMdfeind_aprovado.Value;
    MMCadSimples.Items[2].Items[3].Enabled := QManifestoIND_SITUACAO.Value = '2';
    MMCadSimples.Items[2].Items[4].Enabled := QManifestoIND_SITUACAO.Value = '3';
    MMCadSimples.Items[2].Items[5].Enabled := QManifestoIND_SITUACAO.Value = '5';
    MMCadSimples.Items[2].Items[16].Enabled := QManifestoIND_SITUACAO.Value = '1';
    MMCadSimples.Items[2].Items[17].Enabled := QManifestoIND_SITUACAO.Value = '4';
  end;
end;

procedure TFMdfeCad.ExportarMDFesPorPerodo1Click(Sender: TObject);
var
  filial: Integer;
  dtInicial, dtFinal: TDateTime;
begin
  inherited;
  if FExportarMDFeParam = nil then
    FExportarMDFeParam := TFExportarMDFeParam.Create(Application);
  if FExportarMDFeParam.ShowModal = mrOk then
  begin
    filial := StrToInt(Trim(FExportarMDFeParam.FmFilial1.MeFilial.Text));
    FExportarMDFeParam.FmDatas1.ChecaDatasInformadas;
    dtInicial := StrToDateTime(FExportarMDFeParam.FmDatas1.MeDtInicial.Text);
    dtFinal := StrToDateTime(FExportarMDFeParam.FmDatas1.MeDtFinal.Text + ' 23:59:00');
    SaveDialogExportaMDFes.FileName := 'MDF-es_' + IfThen(filial=0,'','Filial_'+ IntToStr(filial)+ '_') + FormatDateTime('dd-MM-yyyy',dtInicial) + '_'+FormatDateTime('dd-MM-yyyy',dtFinal);
    if(SaveDialogExportaMDFes.Execute) then
      DMNfe.ExportaMDFes( filial, dtInicial, dtFinal,
        FExportarMDFeParam.CBEmailXML.Checked, FExportarMDFeParam.CBEmailPDF.Checked,
        Trim(SaveDialogExportaMDFes.FileName + '.zip'));
  end;
end;

procedure TFMdfeCad.BtCopiaClick(Sender: TObject);
begin
  inherited;
  with DMManifesto do
  begin
    QManifestoNUM_MANIFESTO.Value := 0;
    QManifestoDESC_CHAVE_ACESSO.Clear;
  end;
end;

procedure TFMdfeCad.btPlacaConsClick(Sender: TObject);
begin
  inherited;
  if FVeiculoConhecimentoCons = nil then
    FVeiculoConhecimentoCons := TFVeiculoConhecimentoCons.Create(Application);
  if FVeiculoConhecimentoCons.ShowModal = mrOk then
  begin
    DMManifesto.QVeiculoMDFe.Edit;
    DMManifesto.QVeiculoMDFeDESC_PLACA.Value :=
      DMVeiculoConhecimento.QVeiculoConsDESC_PLACA.Value;
    EDPlacaChange(Sender);
  end;
end;

procedure TFMdfeCad.EDPlacaChange(Sender: TObject);
begin
  inherited;
  with DMVeiculoConhecimento, DMManifesto do
  begin
    if EDPlaca.Text <> '' then
    begin
      QVeiculoCad.Close;
      QVeiculoCad.SetVariable('PK', Trim(EDPlaca.Text));
      QVeiculoCad.Open;
      if QVeiculoCad.RecordCount > 0 then
      begin
        EdVeiculo.Text := QVeiculoCadDESC_VEICULO.Value;
        if QVeiculoMDFe.State in [DSEdit, DSInsert] then
          QVeiculoMDFeDESC_PLACA.Value :=
            QVeiculoCadDESC_PLACA.Value;
      end
      else
        EdVeiculo.Clear;
    end
    else
      EdVeiculo.Clear;
  end;
end;

procedure TFMdfeCad.DsVeiculoMDFeStateChange(Sender: TObject);
begin
  inherited;
  if DsVeiculoMDFe.State in [DsInsert] then
    EDPlaca.SetFocus;
end;

procedure TFMdfeCad.EDPlacaExit(Sender: TObject);
begin
  inherited;
  if DMManifesto.QVeiculoMDFe.State in [DSEdit, DSInsert] then
    if DMVeiculoConhecimento.QVeiculoCad.RecordCount = 0 then
    begin
      EdVeiculo.Text := 'VEICULO NAO CADASTRADO';
      EdPlaca.Clear;
      DMManifesto.QVeiculoMDFe.Cancel;
    end
end;

procedure TFMdfeCad.RelaodeMDFes1Click(Sender: TObject);
begin
  inherited;
   //if FConhecimentoParam = nil then
//    FConhecimentoParam := TFConhecimentoParam.Create(Application);
//  FConhecimentoParam.PGRelatorio.Pages[18].TabVisible := True;
//  if FConhecimentoParam.ShowModal = mrOk then
//  begin
//    DmUsuario.Checar_Filial_Usuario(Trim(FConhecimentoParam.FmFilial11.MeFilial.Text), 'CONHECIMENTO');
//    with DMManifesto do
//    begin
//      QRCte.Close;
//      //--------Frames
//      if Trim(FConhecimentoParam.FmFilial18.MeFilial.Text) <> '' then
//        QRCte.SetVariable('COD_FILIAL',Trim(FConhecimentoParam.FmFilial18.MeFilial.Text))
//      else
//        QRCte.SetVariable('COD_FILIAL', Null);
//      if Trim(FConhecimentoParam.FmRemetente18.MeCadastro.Text) <> '' then
//        QRCte.SetVariable('REMETENTE', Trim(FConhecimentoParam.FmRemetente18.MeCadastro.Text))
//      else
//        QRCte.SetVariable('REMETENTE', Null);
//      if Trim(FConhecimentoParam.FmDestinatario18.MeCadastro.Text) <> '' then
//        QRCte.SetVariable('DESTINATARIO', Trim(FConhecimentoParam.FmDestinatario18.MeCadastro.Text))
//      else
//        QRCte.SetVariable('DESTINATARIO', Null);
//
//      case FConhecimentoParam.RGTipoCTE18.ItemIndex of
//        0: QRCte.SetVariable('SITUACAO', Null);
//        1: QRCte.SetVariable('SITUACAO', '1');
//        2: QRCte.SetVariable('SITUACAO', '2');
//        3: QRCte.SetVariable('SITUACAO', '3');
//      end;
//      if (Trim(FConhecimentoParam.FmDatas18.MeDtInicial.Text) <> '') and
//                    (Trim(FConhecimentoParam.FmDatas18.MeDtFinal.Text) > '') then
//      begin
//        QRCte.SetVariable(':DT_EMISSAO_I', StrToDate(FConhecimentoParam.FmDatas18.MeDtInicial.Text));
//        QRCte.SetVariable(':DT_EMISSAO_F', StrToDate(FConhecimentoParam.FmDatas18.MeDtFinal.Text));
//      end
//      else
//        Raise Exception.Create('É necessário informar a data de emissão.');
//      QRCte.SQL.Strings[QRCte.SQL.Count - 1] := '';
//      case FConhecimentoParam.RGOrdem18.ItemIndex of
//        0: QRCte.SQL.Add('ORDER BY NUM_MANIFESTO');
//        1: QRCte.SQL.Add('ORDER BY DT_EMISSAO');
//      end; // Case
//      //-----------
//      QRCte.Open;
//      if FRCTE = nil then
//        FRCTE := TFRCTE.Create(Application);
//      //Cabeçalho Relatório
//      FRCTE.QRLEmpresa.Caption := Trim(DMParamSistema.QParamSistemaDESC_EMPRESA.Text);
//      FRCTE.QRLTitulo.Caption  := 'Relatório de Conhecimento de Frete Eletrônico';
//      FRCTE.QRLFilial.Caption  := 'Filial: '  + Trim(FConhecimentoParam.FmFilial18.EdFilial.Text);
//      FRCTE.QRLPeriodo.Caption := 'Período: ' + Trim(FConhecimentoParam.FmDatas18.MeDtInicial.Text) +
//                                               ' até ' + Trim(FConhecimentoParam.FmDatas18.MeDtFinal.Text);
//      //----------------------------
//
//      if FConhecimentoParam.RGPreview.ItemIndex = 0 then
//        FRCTE.QRPrimario.Preview
//      else
//        FRCTE.QRPrimario.Print;
//    end;
//  end;
//
end;

procedure TFMdfeCad.SBInserirClick(Sender: TObject);
var
  item: String;
  i: Integer;
begin
  inherited;
  with DMManifesto do
  begin
    if QCidadeDescarga.RecordCount = 0 then
      Exception.Create('Antes de vincular um documento você precisa adicionar uma cidade.');
    if FDocAnteriorParam = nil then
      FDocAnteriorParam := TFDocAnteriorParam.Create(Application);
    if FDocAnteriorParam.ShowModal = mrOk then
      if FDocAnteriorParam.RGDocumentos.ItemIndex = 3 then
      begin
        if FInfDoc = nil then
          FInfDoc := TFInfDoc.Create(Application);

        if (QInfDoc.State in [dsBrowse]) then
          QInfDoc.Insert;

        QInfDocDT_EMISSAO.Value := Date;
        FInfDoc.ShowModal;
      end
      else
        if FDocAnteriorParam.RGDocumentos.ItemIndex = 2 then
        begin
          FImpDadosXML := TFImpDadosXML.Create(Application);
          if FImpDadosXML.ShowModal = MrOk then
          begin
            for i := 0 to Length(FImpDadosXML.DFes) - 1 do
            begin
              QInfDoc.Insert;
              QInfDocDESC_CHAVE_ACESSO.Value := Bib.LimpaNumero(FImpDadosXML.DFes[i].ChaveAcesso);
              QInfDocVAL_CARGA.Value := StrToFloat(FImpDadosXML.DFes[i].ValorCarga);
              QInfDocNUM_PESO.Value := StrToFloat(FImpDadosXML.DFes[i].PesoBruto);
              QInfDocIND_TIPO_DOC.Value := FImpDadosXML.DFes[i].Modelo;
              QInfDocNUM_CPF_CNPJ_TOMADOR.Value := FImpDadosXML.DFes[i].Tomador;
              QInfDoc.Post;
              if CBSomaTotais.Checked then
              begin
                QManifestoVAL_CARGA.Value := QManifestoVAL_CARGA.Value + StrToFloat(FImpDadosXML.DFes[i].ValorCarga);
                QManifestoNUM_PESO.Value := QManifestoNUM_PESO.Value + StrToFloat(FImpDadosXML.DFes[i].PesoBruto);
              end;
            end;
          end;
        end
        else if FDocAnteriorParam.RGDocumentos.ItemIndex = 0 then
        begin
          if FConhecimentoCons = nil then
            FConhecimentoCons := TFConhecimentoCons.Create(Application);
          FConhecimentoCons.DBGrid1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
          FConhecimentoCons.LBVariosRegistros.Visible := True;
          if FConhecimentoCons.ShowModal = mrOk then
          begin
            with FConhecimentoCons.DBGrid1 do
            begin
              with DMConhecimento do
              begin
                for i := 0 to SelectedRows.Count - 1 do
                begin
                  DataSource.DataSet.Bookmark := SelectedRows[i];
                  if QConhecimentoConsDESC_CHAVE_ACESSO_CTE.Value <> '' then
                  begin
                    QInfDoc.Insert;
                    QInfDocDESC_CHAVE_ACESSO.Value :=  bib.LimpaNumero(QConhecimentoConsDESC_CHAVE_ACESSO_CTE.Value);
                    QInfDocIND_TIPO_DOC.Value := '57';
                    QInfDocVAL_CARGA.Value := QConhecimentoConsVAL_TOTAL_CARGA.Value;
                    QInfDocNUM_PESO.Value := QConhecimentoConsNUM_PESO_BRUTO.Value;
                    QInfDocCOD_CONHECIMENTO.Value := QConhecimentoConsCOD_CONHECIMENTO.Value;
                    QInfDocNUM_CPF_CNPJ_TOMADOR.Value := Bib.LimpaNumero(QConhecimentoConsCPF_CNPJ_TOMADOR.Value);
                    QInfDoc.Post;
                    if CBSomaTotais.Checked then
                    begin
                      QManifestoVAL_CARGA.Value := QManifestoVAL_CARGA.Value + QConhecimentoConsVAL_TOTAL_CARGA.Value;
                      QManifestoNUM_PESO.Value := QManifestoNUM_PESO.Value + QConhecimentoConsNUM_PESO_BRUTO.Value;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end
        else
        begin
          if FNotaSaidaCons = nil then
            FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
          FNotaSaidaCons.DBGrid1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
          FNotaSaidaCons.LBVariosRegistros.Visible := True;
          if FNotaSaidaCons.ShowModal = mrOk then
          begin
            with FNotaSaidaCons.DBGrid1 do
            begin
              with DMNotaSaida do
              begin
                for i := 0 to SelectedRows.Count - 1 do
                begin
                  DataSource.DataSet.Bookmark := SelectedRows[i];
                  if QNotaSaidaConsDESC_CHAVE_ACESSO.Value <> '' then
                  begin
                    QInfDoc.Insert;
                    QInfDocDESC_CHAVE_ACESSO.Value :=  bib.LimpaNumero(QNotaSaidaConsDESC_CHAVE_ACESSO.Value);
                    QInfDocIND_TIPO_DOC.Value := '55';
                    QInfDocVAL_CARGA.Value := QNotaSaidaConsSVAL_TOTAL.Value;
                    QInfDocNUM_PESO.Value := QNotaSaidaConsNUM_PESO_BRUTO.Value;
                    QInfDoc.Post;
                    if CBSomaTotais.Checked then
                    begin
                      QManifestoVAL_CARGA.Value := QManifestoVAL_CARGA.Value + QNotaSaidaConsSVAL_TOTAL.Value;
                      QManifestoNUM_PESO.Value := QManifestoNUM_PESO.Value + QNotaSaidaConsNUM_PESO_BRUTO.Value;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end; 
  end;
end;

procedure TFMdfeCad.DBGInfDocDblClick(Sender: TObject);
begin
  inherited;
  if FInfDoc = nil then
    FInfDoc := TFInfDoc.Create(Application);
  if DMManifesto.QInfDoc.RecordCount > 0 then
    if DMManifesto.QInfDocIND_TIPO_DOC.Value <> '' then
      FInfDoc.CMBTipoDoc.Text := DMManifesto.QInfDocIND_TIPO_DOC.Value;
  FInfDoc.ShowModal;
end;

procedure TFMdfeCad.DBPCondutorMDFeDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFMdfeCad.DBPDescarregamentoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FEstadoCons;
  Classe := TFEstadoCons;
end;

procedure TFMdfeCad.DBPCarregamentoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FEstadoCons;
  Classe := TFEstadoCons;
end;

procedure TFMdfeCad.SBRemoverClick(Sender: TObject);
begin
  inherited;
  with DMManifesto do
    if not QInfDoc.IsEmpty then
    begin
      if QManifesto.State = dsbrowse then
      begin
        DMOracle.DBCemapa.StartTransaction;
        QManifesto.Edit;
        QManifestoVAL_CARGA.Value := QManifestoVAL_CARGA.Value - QInfDocVAL_CARGA.Value;
        QManifestoNUM_PESO.Value := QManifestoNUM_PESO.Value - QInfDocNUM_PESO.Value;
        QManifesto.Post;
        QInfDoc.Delete;
        DMOracle.DBCemapa.Commit;
      end
      else
      begin
        QManifestoVAL_CARGA.Value := QManifestoVAL_CARGA.Value - QInfDocVAL_CARGA.Value;
        QManifestoNUM_PESO.Value := QManifestoNUM_PESO.Value - QInfDocNUM_PESO.Value;
        QInfDoc.Delete;
      end;
    end;
end;

procedure TFMdfeCad.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCidadeCons;
  Classe := TFCidadeCons;
end;

procedure TFMdfeCad.DBPanel1DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCidadeCons;
  Classe := TFCidadeCons;
end;

procedure TFMdfeCad.DsCidadeDescargaStateChange(Sender: TObject);
begin
  inherited;
  GBInfDoc.Enabled := (DSPrimario.State in [dsEdit, dsInsert]) and
                      (DsCidadeDescarga.State = dsBrowse);
end;

procedure TFMdfeCad.EncerramentoMDFeClick(Sender: TObject);
begin
  inherited;
  if DMManifesto.QManifestoInd_Situacao.Value = '3' then
    raise Exception.Create('Este Manifesto já está cancelado!');
  if DMManifesto.QManifestoNUM_MANIFESTO.Value = 0 then
    raise Exception.Create('Não é possível encerrar um Manifesto que não foi confirmado.');
  with DMManifesto do
  begin
    Try
      DMOracle.DBCemapa.StartTransaction;

      QManifesto.Edit;
      QManifestoIND_SITUACAO.Value := '5';
      QManifesto.Post;

      DMNfe.RegistraEventoMDFe(DMManifesto.QManifestoCOD_MANIFESTO.Value, TP_EVENTO_DFE_ENCERRAMENTO);
      
      if DMNfe.QMdfeind_encerrado.Value then
        DMOracle.DBCemapa.Commit
      else
      begin
        if QManifesto.State <> dsBrowse then
         QManifesto.Cancel;
        DMOracle.DBCemapa.Rollback;
      end;

      QManifesto.Close;
      QManifesto.Open;

    except
      if QManifesto.State <> dsBrowse then
         QManifesto.Cancel;
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  end;
end;

procedure TFMdfeCad.InclusodeCondutor1Click(Sender: TObject);
begin
  inherited;
  if DMManifesto.QManifestoInd_Situacao.Value = '3' then
    raise Exception.Create('Este Manifesto já está cancelado!');
  if DMManifesto.QManifestoNUM_MANIFESTO.Value = 0 then
    raise Exception.Create('Não é possível incluir um condutor em um Manifesto que não foi confirmado.');
  with DMNfe do
  begin
    if (not DMManifesto.QManifestoDESC_CHAVE_ACESSO.IsNull) then
    begin
      SetaMdfe(DMManifesto.QManifestoDESC_CHAVE_ACESSO.Value, True);
      if not (QMdfeind_aprovado.Value or QMdfeind_denegado.Value) then
      begin
        MessageDlg('MDF-e não está autorizado na SEFAZ, por isso não é permitido incluir um condutor.', mtError, [mbOK], 0);
        Exit;
      end
      else if QMdfeind_cancelado.Value then
      begin
        MessageDlg('MDF-e está cancelado, por isso não é possível incluir um condutor.', mtError, [mbOK], 0);
        Exit;
      end
      else
      begin
        RegistraEventoMDFe(DMManifesto.QManifestoCOD_MANIFESTO.Value, TP_EVENTO_DFE_INC_CONDUTOR);
      end;
    end;
  end;
end;

procedure TFMdfeCad.btIncluirClick(Sender: TObject);
begin
  inherited;
  if DMManifesto.QUFPercurso.State = dsBrowse then
    DMManifesto.QUFPercurso.Append;
  DMManifesto.QUFPercursoCOD_ESTADO.Value := Fm8Estado.MeEstado.Text;
  DMManifesto.QUFPercurso.Post;
  Fm8Estado.MeEstado.Text := '';
  Fm8Estado.MeEstado.SetFocus;
end;

procedure TFMdfeCad.btExcluirClick(Sender: TObject);
begin
  inherited;
  if not DMManifesto.QUFPercurso.Eof then
    DMManifesto.QUFPercurso.Delete;

end;

procedure TFMdfeCad.DBGrid5KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #45 then
  begin
    btExcluirClick(Self);
  end;
  inherited;

end;

procedure TFMdfeCad.BtEstadoClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = mrOk then
    Fm8Estado.MeEstado.Text := DMEstado.QEstadoConsCOD_ESTADO.Value;
end;

procedure TFMdfeCad.Fm8EstadoMeEstadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    btIncluirClick(Self);
end;

procedure TFMdfeCad.Fm8EstadoMeEstadoEnter(Sender: TObject);
begin
  inherited;
  Self.Tag := 100;
end;

procedure TFMdfeCad.Fm8EstadoMeEstadoExit(Sender: TObject);
begin
  inherited;
  Fm8Estado.MeEstadoExit(Sender);
  Self.Tag := 0;
end;

procedure TFMdfeCad.VoltarEncerramento1Click(Sender: TObject);
begin
  inherited;
  if DMManifesto.QManifestoInd_Situacao.Value <> '5' then
    raise Exception.Create('Este manifesto não está encerrado no sistema!');
  with DMManifesto do
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(QManifestoCOD_FILIAL.Text), 'CONHECIMENTO');
    try
      DMOracle.DBCemapa.StartTransaction;
      QManifesto.Edit;
      QManifestoInd_Situacao.Value := '1';
      QManifesto.Post;

      DMOracle.DBCemapa.Commit;
    except
      if QManifesto.State <> dsBrowse then
        QManifesto.Cancel;
      raise Exception.Create('Não é possível voltar encerramento deste Manifesto!');
    end;
  end;
end;

procedure TFMdfeCad.SBImportarDadosEmbarqueClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  with DMManifesto do
  begin
    if FEmbarqueCons = nil then
      FEmbarqueCons := TFEmbarqueCons.Create(Application);
    FEmbarqueCons.DBGrid1.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
    if FEmbarqueCons.ShowModal = mrOk then
    begin
      with FEmbarqueCons.DBGrid1 do
      begin
        with DMEmbarque do
        begin
          for i := 0 to SelectedRows.Count - 1 do
          begin
            DataSource.DataSet.Bookmark := SelectedRows[i];
            QNotasEmbarque.Close;
            QNotasEmbarque.SetVariable('COD_EMBARQUE', QEmbarqueConsCOD_EMBARQUE.Value);
            QNotasEmbarque.Open;

            while not QNotasEmbarque.Eof do
            begin
              if QCidadeDescarga.State in [dsInsert, dsEdit] then
                QCidadeDescarga.Cancel;
              
              QCidadeDescarga.Close;
              QCidadeDescarga.SetVariable('COD_MANIFESTO', QManifestoCOD_MANIFESTO.Value);
              QCidadeDescarga.SetVariable('COD_CIDADE', QNotasEmbarqueCOD_CIDADE.Value);
              QCidadeDescarga.Open;
              
              try
                if QCidadeDescarga.RecordCount = 0 then
                begin
                  QCidadeDescarga.Insert;
                  QCidadeDescargaCOD_CIDADE.Value := QNotasEmbarqueCOD_CIDADE.Value;
                  QCidadeDescarga.Post;
                end;
              except
                QCidadeDescarga.Cancel;
              end;
              try
                if QNotasEmbarqueDESC_CHAVE_ACESSO.Value <> '' then
                begin
                  QInfDoc.Insert;
                  QInfDocDESC_CHAVE_ACESSO.Value :=  bib.LimpaNumero(QNotasEmbarqueDESC_CHAVE_ACESSO.Value);
                  QInfDocIND_TIPO_DOC.Value := '55';
                  QInfDocVAL_CARGA.Value := QNotasEmbarqueSVAL_TOTAL.Value;
                  QInfDocNUM_PESO.Value := QNotasEmbarqueNUM_PESO_BRUTO.Value;
                  QInfDoc.Post;
                  if CBSomaTotais.Checked then
                  begin
                    QManifestoVAL_CARGA.Value := QManifestoVAL_CARGA.Value + QNotasEmbarqueSVAL_TOTAL.Value;
                    QManifestoNUM_PESO.Value := QManifestoNUM_PESO.Value + QNotasEmbarqueNUM_PESO_BRUTO.Value;
                  end;
                end;
              except
                QInfDoc.Cancel;
              end;
              QNotasEmbarque.Next;
            end;
            QCidadeDescarga.Close;
            QCidadeDescarga.SetVariable('COD_CIDADE', NULL);
            QCidadeDescarga.Open;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFMdfeCad.DBPSeguradoraDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFMdfeCad.DBRRespSeguroChange(Sender: TObject);
begin
  inherited;
  if DBRRespSeguro.ItemIndex = 0 then
    DBPContratante.DBEdit.Text := '';
  DBPContratante.Enabled := DBRRespSeguro.ItemIndex = 1;
  DBPContratante.Required := (DBRTipoEmitente.ItemIndex = 0) and (DBRRespSeguro.ItemIndex = 1);
  DMManifesto.QSeguroMDFeCOD_RESP_SEGURO.Required := (DBRTipoEmitente.ItemIndex = 0) and (DBRRespSeguro.ItemIndex = 1);
end;

procedure TFMdfeCad.ConsultarMDFesNoEncerrados1Click(Sender: TObject);
begin
  inherited;
  DMNfe.ConsultaMDFesNaoEncerrados;
end;

procedure TFMdfeCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  PageControl1.TabIndex := 0;
  DBPFilial.SetFocus;
end;

procedure TFMdfeCad.Fm8EstadoBtEstadoClick(Sender: TObject);
begin
  inherited;
  Fm8Estado.BtEstadoClick(Sender);

end;

procedure TFMdfeCad.DBPContratanteDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFMdfeCad.OracleNavigator5Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  if(Button = nbInsert) and
    (DMManifesto.QSeguroMDFeCOD_SEGURADORA.Value > 0) then
  begin
    if(DMManifesto.QSeguroMDFeNUM_APOLICE_SEGURO.Value <> '') then
      DBPNumAverbacao.SetFocus
    else
      DBPNumApolice.SetFocus;
  end
  else
    DBPSeguradora.SetFocus;
end;

procedure TFMdfeCad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  CMBModal.ItemIndex := DMManifesto.QManifestoIND_MODAL.Value - 1;
  CBTipoCarga.ItemIndex := DMManifesto.QManifestoIND_TIPO_CARGA.Value - 1;
  if (DMManifesto.QManifestoConsCOD_BANCO_AGENCIA.Text <> '') then
  begin
    FMBanco1.MeBanco.Text := DMManifesto.QManifestoConsCOD_BANCO_AGENCIA.Text;
    FMBanco1.MeBancoExit(Sender);
  end
  else
  begin
    FMBanco1.MeBanco.Text := '';
    FMBanco1.EdBanco.Text := '';
  end;
end;

procedure TFMdfeCad.DBPProdutoPredominanteDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFMdfeCad.DBCBLotacaoClick(Sender: TObject);
begin
  inherited;
  DBPCepCarrega.Required := DBCBLotacao.Checked;
  DBPCepDescarrega.Required := DBCBLotacao.Checked;

  with DMManifesto do
  begin
    if DBCBLotacao.Checked then
    begin
      if QInfDoc.RecordCount > 0 then
      begin
        QInfDoc.First;
        if QInfDocIND_TIPO_DOC.Value = '57' then
        begin
          if QManifestoDESC_CEP_CARREGA.Value = '' then
            QManifestoDESC_CEP_CARREGA.Value := DMOracle.BuscaNome('SELECT C.DESC_CEP FROM TB_CADASTRO C LEFT JOIN TB_CONHECIMENTO CT ON CT.COD_CADASTRO_REMETENTE = C.COD_CADASTRO', 'CT.COD_CONHECIMENTO =' + QInfDocCOD_CONHECIMENTO.Text);
          if QManifestoDESC_CEP_DESCARREGA.Value = '' then
            QManifestoDESC_CEP_DESCARREGA.Value := DMOracle.BuscaNome('SELECT C.DESC_CEP FROM TB_CADASTRO C LEFT JOIN TB_CONHECIMENTO CT ON CT.COD_CADASTRO_DESTINATARIO = C.COD_CADASTRO', 'CT.COD_CONHECIMENTO =' + QInfDocCOD_CONHECIMENTO.Text);
        end;
      end;
    end
    else
    begin
      QManifestoDESC_CEP_CARREGA.Value := '';
      QManifestoDESC_CEP_DESCARREGA.Value := '';
    end;
  end;
end;

procedure TFMdfeCad.OracleNavigator6Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  if Button = nbInsert then
    DBEdit1.SetFocus;
end;

procedure TFMdfeCad.DBRTipoEmitenteClick(Sender: TObject);
begin
  inherited;
  if (DBRTipoEmitente.ItemIndex = 0) then
  begin
    FMBanco1.MeBanco.ReadOnly := false;
    FMBanco1.BtBanco.Enabled := true;
  end
  else
  begin
    FMBanco1.MeBanco.ReadOnly := true;
    FMBanco1.BtBanco.Enabled := false;
  end;
end;

end.



