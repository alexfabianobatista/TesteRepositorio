unit UFilialCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBDirceu, ActnList, DBPanel, ComOBJ, CemapaCertDigital_TLB,
  CheckLst, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, Registry, dblookup, Grids, DBGrids, OracleNavigator, UFmCadastro;

type
  TFFilialCad = class(TFTCadSimples)
    Filial1: TMenuItem;
    PcDados: TPageControl;
    TsDadosGerais: TTabSheet;
    TsSped: TTabSheet;
    DBCheckBox1: TDBCheckBox;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup7: TDBRadioGroup;
    DBRadioGroup8: TDBRadioGroup;
    DBRadioGroup10: TDBRadioGroup;
    DBRadioGroup11: TDBRadioGroup;
    TabSheet1: TTabSheet;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup5: TDBRadioGroup;
    DBRadioGroup9: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    DBRGImprimePedido: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    DBRadioGroup15: TDBRadioGroup;
    DBRadioGroup16: TDBRadioGroup;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    DBPanel8: TDBPanel;
    DBPanel9: TDBPanel;
    DBPanel10: TDBPanel;
    DBPanel11: TDBPanel;
    DBPanel12: TDBPanel;
    DBPanel13: TDBPanel;
    DBPanel14: TDBPanel;
    DBPanel15: TDBPanel;
    DBPanel16: TDBPanel;
    DBPEmail: TDBPanel;
    DBPanel18: TDBPanel;
    DBPanel20: TDBPanel;
    DBPanel21: TDBPanel;
    DBPanel22: TDBPanel;
    DBPCidade: TDBPanel;
    OpenDialog1: TOpenDialog;
    DsClasseConsumoCons: TDataSource;
    DsEnergiaTensao: TDataSource;
    TabSheet2: TTabSheet;
    DBRadioGroup19: TDBRadioGroup;
    DBRadioGroup20: TDBRadioGroup;
    DBLCSerieModelo: TDBLookupComboBox;
    Modelo: TLabel;
    DBPanel24: TDBPanel;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    DBPEmailEnvio: TDBPanel;
    DBPSenhaEmail: TDBPanel;
    DBPSMTP: TDBPanel;
    DBCheckBox4: TDBCheckBox;
    DBPanel36: TDBPanel;
    GPBNFe: TGroupBox;
    DBPanel30: TDBPanel;
    DBCheckBox2: TDBCheckBox;
    DBGContingenciaNFe: TDBRadioGroup;
    DBRGTipoNota: TDBRadioGroup;
    DBPDtContingencia: TDBPanel;
    DBPJustContingencia: TDBPanel;
    DbCbOcultaTelefone: TDBCheckBox;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    DBCheckBox5: TDBCheckBox;
    DBPanel32: TDBPanel;
    DBRadioGroup21: TDBRadioGroup;
    DBRadioGroup22: TDBRadioGroup;
    DBPanel38: TDBPanel;
    DBPanel39: TDBPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBComboBox1: TDBComboBox;
    Label8: TLabel;
    DBPanel40: TDBPanel;
    DBPanel41: TDBPanel;
    TabSheet5: TTabSheet;
    GroupBox22: TGroupBox;
    Label9: TLabel;
    DBPanel42: TDBPanel;
    DBPanel43: TDBPanel;
    EdTerminalTEF: TEdit;
    Label10: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    DBRadioGroup23: TDBRadioGroup;
    TabSheet6: TTabSheet;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    DBCheckBox6: TDBCheckBox;
    DBPanel44: TDBPanel;
    DBRadioGroup26: TDBRadioGroup;
    DBComboBox2: TDBComboBox;
    DBPanel47: TDBPanel;
    DBPanel48: TDBPanel;
    GroupBox5: TGroupBox;
    DBPanel35: TDBPanel;
    DBCheckBox7: TDBCheckBox;
    DBPanel45: TDBPanel;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBRadioGroup14: TDBRadioGroup;
    TabSheet7: TTabSheet;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label15: TLabel;
    DBPanel37: TDBPanel;
    DBPanel46: TDBPanel;
    GroupBox6: TGroupBox;
    DBPanel49: TDBPanel;
    DBCheckBox10: TDBCheckBox;
    DBRadioGroup28: TDBRadioGroup;
    DBGContingenciaNFCe: TDBRadioGroup;
    DBPDtContingenciaNFCe: TDBPanel;
    DBPJustContingenciaNFCe: TDBPanel;
    DBCBVersaoNfCe: TDBComboBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBPanel53: TDBPanel;
    DBPanel54: TDBPanel;
    PageControl1: TPageControl;
    TabSheet8: TTabSheet;
    DBPanel25: TDBPanel;
    DBPanel26: TDBPanel;
    DBPanel27: TDBPanel;
    DBPanel28: TDBPanel;
    DBPanel23: TDBPanel;
    DBPanel29: TDBPanel;
    GbEnergia: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBRadioGroup12: TDBRadioGroup;
    DBLookupComboBox3: TDBLookupComboBox;
    DBRadioGroup17: TDBRadioGroup;
    DBRadioGroup18: TDBRadioGroup;
    GroupBox2: TGroupBox;
    ClbInventarioMes: TCheckListBox;
    DBCheckBox3: TDBCheckBox;
    DBPanel52: TDBPanel;
    TabSheet9: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    DBLCIncTrib: TDBLookupComboBox;
    DBLCApropCredito: TDBLookupComboBox;
    DBLCContApurada: TDBLookupComboBox;
    DBLCCriterioEscrit: TDBLookupComboBox;
    DBLCIncTribPrev: TDBLookupComboBox;
    DBLCPisDCTF: TDBLookupComboBox;
    DBLCCofinsDCTF: TDBLookupComboBox;
    TabSheet10: TTabSheet;
    DBLFormaTributacao: TDBLookupComboBox;
    Label17: TLabel;
    Label18: TLabel;
    DBLNatJuridica: TDBLookupComboBox;
    DBRadioGroup29: TDBRadioGroup;
    DBRadioGroup30: TDBRadioGroup;
    DBRadioGroup31: TDBRadioGroup;
    DBRadioGroup32: TDBRadioGroup;
    DBRadioGroup33: TDBRadioGroup;
    DBPanel56: TDBPanel;
    LblVersaoNfe: TLabel;
    DBCBVersaoNfe: TDBComboBox;
    DBRGConsumidor: TDBRadioGroup;
    DBCheckBox14: TDBCheckBox;
    DBPanel55: TDBPanel;
    DBRadioGroup13: TDBRadioGroup;
    DBRadioGroup24: TDBRadioGroup;
    sbBuscaCertificado: TSpeedButton;
    sbBuscaLogo: TSpeedButton;
    DBPanel33: TDBPanel;
    DBPanel17: TDBPanel;
    DBCheckBox13: TDBCheckBox;
    DBRGRegimeTributario: TDBRadioGroup;
    GBSubstTribFilial: TGroupBox;
    ONSubstTribFilial: TOracleNavigator;
    DBGrid1: TDBGrid;
    DBPEstado: TDBPanel;
    DBPanel58: TDBPanel;
    DsInscricaoSubstFilial: TDataSource;
    DBPanel59: TDBPanel;
    DBPanel60: TDBPanel;
    TabSheet11: TTabSheet;
    GroupBox8: TGroupBox;
    GroupBox7: TGroupBox;
    DBPanel31: TDBPanel;
    DBPanel19: TDBPanel;
    DBPanel57: TDBPanel;
    DBPanel34: TDBPanel;
    DBRadioGroup25: TDBRadioGroup;
    Label14: TLabel;
    DBComboBox3: TDBComboBox;
    DBPSenhaWebService: TDBPanel;
    DBPanel61: TDBPanel;
    DBPanel62: TDBPanel;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBPanel63: TDBPanel;
    DBPanel64: TDBPanel;
    DBRadioGroup27: TDBRadioGroup;
    CMBResponsavelSeguro: TComboBox;
    Label16: TLabel;
    DBPanel50: TDBPanel;
    DBRadioGroup34: TDBRadioGroup;
    DSAutXML: TDataSource;
    GroupBox9: TGroupBox;
    OracleNavigator1: TOracleNavigator;
    DBGrid2: TDBGrid;
    DBPanel51: TDBPanel;
    DBRadioGroup35: TDBRadioGroup;
    DBLookupComboBox1: TDBLookupComboBox;
    DsClassContribIpi: TDataSource;
    Label19: TLabel;
    DBRadioGroup36: TDBRadioGroup;
    GroupBox10: TGroupBox;
    dbcbValoresAgregados: TDBCheckBox;
    TabSheet12: TTabSheet;
    DBLCClassificacaoTributaria: TDBLookupComboBox;
    Label20: TLabel;
    cbObrigacaoEcd: TDBCheckBox;
    cbSituacaoEmpresa: TComboBox;
    FmCadastroReinf: TFmCadastro;
    cbDesoneraCPRB: TDBCheckBox;
    cbbAmbienteReinf: TComboBox;
    Label21: TLabel;
    DBCheckBox19: TDBCheckBox;
    DBEVersaoReinf: TDBEdit;
    Label22: TLabel;
    DBLCAtivPreponderante: TDBLookupComboBox;
    Label23: TLabel;
    DBPanel65: TDBPanel;
    DBRadioGroup37: TDBRadioGroup;
    Label24: TLabel;
    DBECodUsuario: TDBEdit;
    EdNomeUsuario: TEdit;
    DBPanel66: TDBPanel;
    DBPanel67: TDBPanel;
    DBCheckBox20: TDBCheckBox;
    DBRadioGroup38: TDBRadioGroup;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Filial1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SBRefreshClick(Sender: TObject);
    procedure DBPCidadeDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel22DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPCidadeAfterConsulta(Sender: TObject);
    procedure DBPCidadeCodigoExit(Sender: TObject);
    procedure DBPanel23DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel29DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure sbBuscaCertificadoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure sbBuscaLogoClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DBPJustContingenciaValidate(Sender: TObject; Value: Variant; var isValid: Boolean; var Msg: string);
    procedure MELocalizaExit(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure DBLCIncTribCloseUp(Sender: TObject);
    procedure DBLCApropCreditoCloseUp(Sender: TObject);
    procedure DBLCContApuradaCloseUp(Sender: TObject);
    procedure DBLCCriterioEscritCloseUp(Sender: TObject);
    procedure DBLCSerieModeloCloseUp(Sender: TObject);
    procedure DBLCIncTribPrevCloseUp(Sender: TObject);
    procedure DBPJustContingenciaCTeValidate(Sender: TObject;
      Value: Variant; var isValid: Boolean; var Msg: String);
    procedure DBGContingenciaNFeChange(Sender: TObject);
    procedure DBLCPisDCTFCloseUp(Sender: TObject);
    procedure DBLCCofinsDCTFCloseUp(Sender: TObject);
    procedure DBPanel59DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel51DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBRadioGroup17Change(Sender: TObject);
    procedure DBLCIncTribExit(Sender: TObject);
    procedure DBLCAtivPreponderanteCloseUp(Sender: TObject);
    procedure PcDadosChange(Sender: TObject);
  private
    procedure GravaInventarioMes;
    procedure GravaInventarioMesItem(mes: Integer; marcado: Boolean);
    procedure CarregaInventarioMes;
    procedure LimpaInventarioMes;
    procedure AtivarDesativarCampos;    
  public
  end;


var
  FFilialCad: TFFilialCad;
  Registry: TRegistry;

implementation

uses UFilial_cl, UFilialCons, URFilial_Filial, UCidadeCons, UCidade_cl,
  UCadastroCons, UCadastro_cl, UBiblioteca, NfeConsts, Variants,
  UOracle_cl, UFmFilial, UAtividadeContribCons, Math, UUsuario_cl;

{$R *.DFM}

procedure TFFilialCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    with DMFilial do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', QFilialConsCod_Filial.Value);
      QFilial.Open;
      CarregaInventarioMes;
      CMBResponsavelSeguro.ItemIndex := DMFilial.QFilialIND_RESP_SEGURO_PADRAO.Value;
      cbSituacaoEmpresa.ItemIndex := DMFilial.QFilialIND_SITUACAO_REINF.Value;
      if DMFilial.QFilialIND_OBRIGA_ECD.Value = 'SIM' then
        cbObrigacaoEcd.Checked := true
      else
        cbObrigacaoEcd.Checked := false;
      if DMFilial.QFilialIND_DESONERACAO_CPRB.Value = 'SIM' then
        cbDesoneraCPRB.Checked := true
      else
        cbDesoneraCPRB.Checked := false;
      FmCadastroReinf.MeCadastro.Text  := DMFilial.QFilialCOD_CADASTRO_REINF.Text;
      cbbAmbienteReinf.ItemIndex := DMFilial.QFilialIND_AMBIENTE_REINF.Value - 1;
    end;
  end;
end;

procedure TFFilialCad.FormActivate(Sender: TObject);
begin
  inherited;
{Campo liberado apenas para o usuário da Cemapa.}
  SBIncluir.Enabled := false;
  SBIncluir.Visible := false;
  if (DMUsuario.CodUsuarioCorrente = 1) then
  begin
    DBRadioGroup37.Enabled := true;
    SBIncluir.Enabled := true;
    SBIncluir.Visible := true;
  end;
  with DMFilial do
  begin
    QFilial.Open;
    QEnergiaTensaoCons.Close;
    QEnergiaTensaoCons.Open;
    QClasseConsumoCons.Close;
    QClasseConsumoCons.Open;
    QPisDCTF.Close;
    QPisDCTF.Open;
    QCofinsDCTF.Close;
    QCofinsDCTF.Open;
    QFormaTrib.Open;
    QNatJuridica.Open;    
    QNbs.Open;
    QInscricaoSubstFilial.Open;
    QAutXML.Open;
    QClassifContribIpiCons.Open;
    QClassificacaoTributaria.Open;
    QAtivPreponderante.Open;   
  end;
end;

procedure TFFilialCad.Filial1Click(Sender: TObject);
begin
  inherited;
  DMFilial.QRFilial.Open;
  if FRFilial_Filial = nil then
    FRFilial_Filial := TFRFilial_Filial.Create(Application);
  FRFilial_Filial.QRPrimario.Preview;
  DMFilial.QRFilial.Close;
end;

procedure TFFilialCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(28);
end;

procedure TFFilialCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with DMFilial do
  begin
    QFilial.Close;
    QEnergiaTensaoCons.Close;
    QClasseConsumoCons.Close;
    QNbs.Close;
    QInscricaoSubstFilial.Close;
    QAutXML.Close;
  end;
  Action := CaFree;
  FFilialCad := nil;
end;

procedure TFFilialCad.FormCreate(Sender: TObject);
begin
  inherited;
  PcDados.ActivePageIndex := 0;
  PageControl1.ActivePageIndex := 0;
  //Bib.addControleCharCase(DBPUsuario, Self.Name);
  //Bib.addControleCharCase(DBPSenha, Self.Name);
  Bib.addControleCharCase(DBPEmail, Self.Name);
  Bib.addControleCharCase(DBPSenhaEmail, Self.Name);
  Bib.addControleCharCase(DBPEmailEnvio, Self.Name);
  Bib.addControleCharCase(DBPSMTP, Self.Name);
  Registry := TRegistry.Create;//executa o tregistry
  Registry.RootKey:=HKEY_CURRENT_USER; //abre a chave mestra
  Registry.OpenKey('SOFTWARE\CemapaSistema',true);
  if Registry.ValueExists('TerminalTEF') then
    EdTerminalTEF.Text := Registry.ReadString('TerminalTEF');
  DBPanel21.Visible :=
    (DMOracle.FastSelect('IND_PAF_ECF','TB_PARAM_SISTEMA','1=1') = 'N');
  DBPanel21.ReadOnly := DBPanel21.Visible;

  DBLookupComboBox1.Enabled := false;
  DBLookupComboBox1.Visible := false;
  Label19.Visible := false;
  AtivarDesativarCampos;

end;

procedure TFFilialCad.SBRefreshClick(Sender: TObject);
begin
  inherited;
  PcDados.ActivePageIndex := 0;
end;

procedure TFFilialCad.DBPCidadeDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCidadeCons;
  Classe := TFCidadeCons;
end;

procedure TFFilialCad.DBPanel22DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFFilialCad.DBPCidadeAfterConsulta(Sender: TObject);
begin
  inherited;
  with DMFilial do
    if DMCidade.QCidadeConsCOD_CIDADE.Value = QFilialCOD_CIDADE.Value then
    begin
      QFilialDESC_CIDADE.Value := DMCidade.QCidadeConsDESC_CIDADE.Value;
      QFilialCOD_ESTADO.Value := DMCidade.QCidadeConsCOD_ESTADO.Value;
    end;
end;

procedure TFFilialCad.DBPCidadeCodigoExit(Sender: TObject);
begin
  inherited;
  with DMCidade do
    if QCidadeConsCOD_CIDADE.Value = DMFilial.QFilialCOD_CIDADE.Value then
      DBPCidadeAfterConsulta(DBPCidade)
    else
    begin
      QCidade.Close;
      QCidade.SetVariable('PK', DMFilial.QFilialCOD_CIDADE.Value);
      QCidade.Open;
      DMFilial.QFilialDESC_CIDADE.Value := QCidadeDESC_CIDADE.Value;
      DMFilial.QFilialCOD_ESTADO.Value := QCidadeCOD_ESTADO.Value;
    end;
end;

procedure TFFilialCad.DBPanel23DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFFilialCad.DBPanel29DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFFilialCad.sbBuscaCertificadoClick(Sender: TObject);
var
  certificado: ICertificado;
begin
  inherited;
  if MessageDlg('Tem certeza de que está no computador servidor de NF-e?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
  begin
    certificado := CreateComObject(CemapaCertDigital_TLB.CLASS_Certificado) as ICertificado;
    DMFilial.QFilialDESC_CERTIFICADO.Value := trim(certificado.BuscaNome());
  end;
end;

procedure TFFilialCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  sbBuscaCertificado.Enabled := (dsPrimario.State in [dsInsert, dsEdit]);
  sbBuscaLogo.Enabled := (dsPrimario.State in [dsInsert, dsEdit]);
  ClbInventarioMes.Enabled := (dsPrimario.State in [dsInsert, dsEdit]);
  DBLCIncTrib.Enabled := not(dsPrimario.State = dsBrowse);
  DBLCApropCredito.Enabled := not(dsPrimario.State = dsBrowse);
  DBLCContApurada.Enabled := not(dsPrimario.State = dsBrowse);
  DBLCCriterioEscrit.Enabled := not(dsPrimario.State = dsBrowse);
  DBLCSerieModelo.Enabled := not(dsPrimario.State = dsBrowse);
  DBLCIncTribPrev.Enabled := not(dsPrimario.State = dsBrowse);
  DBLCPisDCTF.Enabled := not(dsPrimario.State = dsBrowse);
  DBLCCofinsDCTF.Enabled := not(dsPrimario.State = dsBrowse);
  EdTerminalTEF.Enabled := not (dsPrimario.State = dsBrowse);
  DBLFormaTributacao.Enabled := not (dsPrimario.State = dsBrowse);
  DBLNatJuridica.Enabled := not (dsPrimario.State = dsBrowse);
  ONSubstTribFilial.Enabled := not (DSPrimario.State = dsBrowse);
  DBLCAtivPreponderante.Enabled := not(dsPrimario.State = dsBrowse);
end;

procedure TFFilialCad.sbBuscaLogoClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Tem certeza de que está no computador servidor de NF-e?', mtConfirmation, [mbYes, mbNo], 0) = idYes then
    if OpenDialog1.Execute then
      DMFilial.QFilialDESC_LOGOTIPO_DANFE.Value := OpenDialog1.FileName;
end;

procedure TFFilialCad.SBConfirmarClick(Sender: TObject);
begin
  Registry.WriteString('TerminalTEF',EdTerminalTEF.Text);
  Registry.WriteString('FilialTEF', DMFilial.QFilialCOD_FILIAL.Text);
  DMFilial.QFilialIND_RESP_SEGURO_PADRAO.Value := CMBResponsavelSeguro.ItemIndex+1;
  DMFilial.QFilialIND_SITUACAO_REINF.Value := cbSituacaoEmpresa.ItemIndex;
  if Trim(FmCadastroReinf.MeCadastro.Text) <> '' then
    DMFilial.QFilialCOD_CADASTRO_REINF.Value := StrToInt(Trim(FmCadastroReinf.MeCadastro.Text));
  DMFilial.QFilialIND_AMBIENTE_REINF.Value := cbbAmbienteReinf.ItemIndex + 1;

  inherited;

//  if DMFilial.QFilial.State = dsEdit then
  GravaInventarioMes;
  DMOracle.DBCemapa.Commit;
  AtivarDesativarCampos;
end;

procedure TFFilialCad.DBPJustContingenciaValidate(Sender: TObject;
  Value: Variant; var isValid: Boolean; var Msg: string);
begin
  inherited;
  isValid := (Value <> null) and (Value <> '');
  with DMFilial do
    isValid := (QFilialDESC_VERSAO_NFE.Value <> VERSAO_NFE_2) or
      (QFilialIND_CONTINGENCIA.Value = '1') or isValid;
  if not isValid then
    Msg := 'Obrigatório informar quando entrar em contingência.';
end;

procedure TFFilialCad.GravaInventarioMes;
var i: Integer;
begin
  for i := 0 to ClbInventarioMes.Items.Count - 1 do
  begin
    if ClbInventarioMes.Checked[i] then
      GravaInventarioMesItem(i + 1, True)
    else
      GravaInventarioMesItem(i + 1, False);
  end;
end;

procedure TFFilialCad.GravaInventarioMesItem(mes: Integer; marcado: Boolean);
var grava: Boolean;
begin
  grava := false;

  with DMFilial do
  begin
    QInventarioMes.Close;
    QInventarioMes.SetVariable('COD_FILIAL', QFilialCOD_FILIAL.Value);
    QInventarioMes.SetVariable('NUM_MES', mes);
    QInventarioMes.Open;

    if QInventarioMes.IsEmpty then
    begin
      if marcado then
      begin
        QInventarioMes.Append;
        QInventarioMesCOD_FILIAL.Value := QFilialCOD_FILIAL.Value;
        QInventarioMesNUM_MES.Value := mes;
        QInventarioMes.Post;
      end;
    end
    else
      if (not (marcado)) then
        QInventarioMes.Delete;
  end;
end;

procedure TFFilialCad.CarregaInventarioMes;
begin
  with DMFilial do
  begin
    QInventarioMes.Close;
    QInventarioMes.SetVariable('COD_FILIAL', QFilialCOD_FILIAL.Value);
    QInventarioMes.SetVariable('NUM_MES', 0);
    QInventarioMes.Open;

    LimpaInventarioMes;

    QInventarioMes.First;
    while not QInventarioMes.Eof do
    begin
      ClbInventarioMes.Checked[QInventarioMesNUM_MES.Value - 1] := True;

      QInventarioMes.Next;
    end;
  end;
end;

procedure TFFilialCad.LimpaInventarioMes;
var i: Integer;
begin
  for i := 0 to ClbInventarioMes.Items.Count - 1 do
  begin
    ClbInventarioMes.Checked[i] := False;
  end;
end;

procedure TFFilialCad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  CarregaInventarioMes;
  CMBResponsavelSeguro.ItemIndex := DMFilial.QFilialIND_RESP_SEGURO_PADRAO.Value;
  cbSituacaoEmpresa.ItemIndex := DMFilial.QFilialIND_SITUACAO_REINF.Value;
  if DMFilial.QFilialIND_OBRIGA_ECD.Value = 'SIM' then
    cbObrigacaoEcd.Checked := true
  else
    cbObrigacaoEcd.Checked := false;
  if DMFilial.QFilialIND_DESONERACAO_CPRB.Value = 'SIM' then
    cbDesoneraCPRB.Checked := true
  else
    cbDesoneraCPRB.Checked := false;
  FmCadastroReinf.MeCadastro.Text  := DMFilial.QFilialCOD_CADASTRO_REINF.Text;
  cbbAmbienteReinf.ItemIndex := DMFilial.QFilialIND_AMBIENTE_REINF.Value - 1;
end;

procedure TFFilialCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  CarregaInventarioMes;
  AtivarDesativarCampos;
end;

procedure TFFilialCad.SBExcluirClick(Sender: TObject);
begin
  inherited;
  CarregaInventarioMes;
  AtivarDesativarCampos;
end;

procedure TFFilialCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
  CarregaInventarioMes;
  AtivarDesativarCampos
end;

procedure TFFilialCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  CarregaInventarioMes;
  AtivarDesativarCampos;  
end;

procedure TFFilialCad.DBLCIncTribCloseUp(Sender: TObject);
begin
  inherited;
  DBLCIncTrib.Hint := DMFilial.QIncidenciaTribDESC_COMPLETA.Value;
  //if DMFilial.QIncidenciaTribCOD_INC_TRIB.Value <> 2 then
  //  begin
     //DMFilial.QApropCredito.Open;
     //DMFilial.QCriterioEscrit.Close;
  //  end
  //else
  //  begin
     //DMFilial.QApropCredito.Close;
     //DMFilial.QCriterioEscrit.Open;
  //  end;
  with DMFilial do
  begin
    if QIncidenciaTribCOD_INC_TRIB.Value = 0 then
      QFilialCOD_INC_TRIB.Clear;
  end;
end;

procedure TFFilialCad.DBLCApropCreditoCloseUp(Sender: TObject);
begin
  inherited;
  DBLCApropCredito.Hint := DMFilial.QApropCreditoDESC_COMPLETA.Value;
  with DMFilial do
  begin
    if QApropCreditoCOD_APRO_CRED.Value = 0 then
      QFilialCOD_APROPRIACAO_CRED.Clear;
  end;
end;

procedure TFFilialCad.DBLCContApuradaCloseUp(Sender: TObject);
begin
  inherited;
  DBLCContApurada.Hint := DMFilial.QTipoContDESC_COMPLETA.Value;
  with DMFilial do
  begin
    if QTipoContCOD_TIPO_CONT.Value = 0 then
      QFilialCOD_TIPO_CONT.Clear;
  end;
end;

procedure TFFilialCad.DBLCCriterioEscritCloseUp(Sender: TObject);
begin
  inherited;
  DBLCCriterioEscrit.Hint := DMFilial.QCriterioEscritDESC_COMPLETA.Value;
  with DMFilial do
  begin
    if QCriterioEscritCOD_CRITERIO_ESCRIT.Value = 0 then
      QFilialCOD_CRITERIO_ESCRIT.Clear;
  end;
end;

procedure TFFilialCad.DBLCSerieModeloCloseUp(Sender: TObject);
begin
  inherited;
  with DMFilial do
  begin
    DBLCSerieModelo.Hint := QSerieModeloConsDESC_COMPLETA.Value;
    if QSerieModeloConsCOD_SERIE_MODELO.Value = '' then
      QFilialCOD_SERIE_MODELO.Clear;
  end;
end;

procedure TFFilialCad.DBLCIncTribPrevCloseUp(Sender: TObject);
begin
  inherited;
  DBLCIncTribPrev.Hint := DMFilial.QIncidenciaTribPrevDESC_COMPLETA.Value;
  with DMFilial do
  begin
    if QIncidenciaTribPrevCOD_INC_TRIB.Value = 0 then
      QFilialCOD_INC_TRIB_PREV.Clear;
  end;
end;

procedure TFFilialCad.DBPJustContingenciaCTeValidate(Sender: TObject;
  Value: Variant; var isValid: Boolean; var Msg: String);
begin
  inherited;
  isValid := (Value <> null) and (Value <> '');
  with DMFilial do
    isValid := (QFilialIND_CONTINGENCIA_CTE.Value = '1');
  if not isValid then
    Msg := 'Obrigatório informar quando entrar em contingência.';
end;

procedure TFFilialCad.DBGContingenciaNFeChange(Sender: TObject);
begin
  inherited;
  with DMFilial do
    case DBGContingenciaNFe.ItemIndex of
      0:
      begin
        QFilialDT_CONTINGENCIA.Clear;
        QFilialDESC_JUST_CONTINGENCIA.Clear;
      end;
      1,2:
      begin
        QFilialDT_CONTINGENCIA.Value := DMOracle.DataHoraServ;
        QFilialDESC_JUST_CONTINGENCIA.Value := 'Servidor fora de operação';
      end;
    end;

end;

procedure TFFilialCad.DBLCPisDCTFCloseUp(Sender: TObject);
begin
  inherited;
  DBLCPisDCTF.Hint := DMFilial.QPisDCTFDESC_COMPLETA.Value;
  with DMFilial do
  begin
    if QPisDCTFCOD_PISCOFINS_DCTF.Value = 0 then
      QPisDCTFCOD_PISCOFINS_DCTF.Clear;
  end;
end;

procedure TFFilialCad.DBLCCofinsDCTFCloseUp(Sender: TObject);
begin
  inherited;
  DBLCCofinsDCTF.Hint := DMFilial.QCofinsDCTFDESC_COMPLETA.Value;
  with DMFilial do
  begin
    if QCofinsDCTFCOD_PISCOFINS_DCTF.Value = 0 then
      QCofinsDCTFCOD_PISCOFINS_DCTF.Clear;
  end;
end;

procedure TFFilialCad.DBPanel59DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;
procedure TFFilialCad.DBPanel51DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFFilialCad.DBRadioGroup17Change(Sender: TObject);
begin
  inherited;
  if DBRadioGroup17.ItemIndex = 0 then
  begin
    DBLookupComboBox1.Visible := true;
    DBLookupComboBox1.Enabled := true;
    Label19.Visible := true;
  end
  else
  begin
    DBLookupComboBox1.Visible := false;
    DBLookupComboBox1.Enabled := false;
    Label19.Visible := false;
  end;
end;

procedure TFFilialCad.AtivarDesativarCampos;
var
  isAtivo : boolean;
begin

  isAtivo := (DSPrimario.State in [dsEdit, dsInsert]);

  DBLCClassificacaoTributaria.Enabled := isAtivo;
  cbbAmbienteReinf.Enabled := isAtivo;
  cbObrigacaoEcd.Enabled := isAtivo;
  cbDesoneraCPRB.Enabled := isAtivo;
  cbSituacaoEmpresa.Enabled := isAtivo;
  DBEVersaoReinf.Enabled := isAtivo;
  FmCadastroReinf.MeCadastro.Enabled := isAtivo;
  FmCadastroReinf.EdCadastro.Enabled := isAtivo;
  FmCadastroReinf.BtCadastro.Enabled := isAtivo;

end;

procedure TFFilialCad.DBLCIncTribExit(Sender: TObject);
begin
  inherited;
  with DMFilial do
  begin

    if QFilialCOD_INC_TRIB.Value = 2 then
    begin

      QFilialCOD_APROPRIACAO_CRED.Clear;
      DBLCApropCredito.Enabled := false;

    end
    else
      DBLCApropCredito.Enabled := true

  end;           
end;

procedure TFFilialCad.DBLCAtivPreponderanteCloseUp(Sender: TObject);
begin
  inherited;
  with DMFilial do
  begin
    if QAtivPreponderanteCOD_ATIV_PREPONDERANTE.Value = null then
      QAtivPreponderanteCOD_ATIV_PREPONDERANTE.Clear;
  end;
end;

procedure TFFilialCad.PcDadosChange(Sender: TObject);
begin
  inherited;
  EdNomeUsuario.Text := DMOracle.FastSelect('NOME','TB_USUARIO','COD_USUARIO = '+ DBECodUsuario.Text);
end;

end.

