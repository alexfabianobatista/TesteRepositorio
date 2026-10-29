unit UParamSistema;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, Grids, DBGrids, ActnList, DBPanel, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Registry, DBDirceu;

type
  TFParamSistema = class(TFTCadSimples)
    PCParametro: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBRadioGroup2: TDBRadioGroup;
    TSComissao: TTabSheet;
    DBRGTipoComissao: TDBRadioGroup;
    TabSheet4: TTabSheet;
    DBRadioGroup4: TDBRadioGroup;
    TabSheet5: TTabSheet;
    DBRadioGroup5: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    GBComissaoPrazo: TGroupBox;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    TabSheet3: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    DBRadioGroup1: TDBRadioGroup;
    TabSheet8: TTabSheet;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup9: TDBRadioGroup;
    DBRadioGroup11: TDBRadioGroup;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label25: TLabel;
    DBEdit41: TDBEdit;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Label26: TLabel;
    DBEdit42: TDBEdit;
    Label27: TLabel;
    DBEdit43: TDBEdit;
    Label28: TLabel;
    DBEdit44: TDBEdit;
    Label29: TLabel;
    DBEdit45: TDBEdit;
    Label30: TLabel;
    DBEdit46: TDBEdit;
    Label31: TLabel;
    DBEdit47: TDBEdit;
    GroupBox8: TGroupBox;
    Label32: TLabel;
    DBEdit48: TDBEdit;
    Label33: TLabel;
    DBEdit49: TDBEdit;
    GroupBox9: TGroupBox;
    Label34: TLabel;
    DBEdit50: TDBEdit;
    Label35: TLabel;
    DBEdit51: TDBEdit;
    BtConsRpaCred: TBitBtn;
    BtConsRpaDeb: TBitBtn;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    Label36: TLabel;
    DBEdit52: TDBEdit;
    Label37: TLabel;
    DBEdit53: TDBEdit;
    BtConsSestCred: TBitBtn;
    BtConsSestDeb: TBitBtn;
    Label38: TLabel;
    DBEdit54: TDBEdit;
    BtConsIrfCred: TBitBtn;
    Label39: TLabel;
    DBEdit55: TDBEdit;
    BtConsIrfDeb: TBitBtn;
    GroupBox12: TGroupBox;
    Label40: TLabel;
    DBEdit56: TDBEdit;
    BitBtn3: TBitBtn;
    TabSheet9: TTabSheet;
    DBRadioGroup7: TDBRadioGroup;
    GroupBox13: TGroupBox;
    Label44: TLabel;
    DBEdit59: TDBEdit;
    BtConsPedagioDeb: TBitBtn;
    Label45: TLabel;
    DBEdit60: TDBEdit;
    BtConsPedagioCred: TBitBtn;
    GroupBox14: TGroupBox;
    Label46: TLabel;
    DBEdit61: TDBEdit;
    BtConsPedagio: TBitBtn;
    DBRadioGroup8: TDBRadioGroup;
    TabSheet10: TTabSheet;
    Label48: TLabel;
    DBEdit63: TDBEdit;
    Label49: TLabel;
    DBEdit64: TDBEdit;
    Label50: TLabel;
    DBEdit65: TDBEdit;
    Label51: TLabel;
    DBEdit66: TDBEdit;
    GroupBox15: TGroupBox;
    Label52: TLabel;
    Label53: TLabel;
    DBEdit67: TDBEdit;
    BtInssCred: TBitBtn;
    DBEdit68: TDBEdit;
    BtConsInssDeb: TBitBtn;
    GroupBox16: TGroupBox;
    Label54: TLabel;
    DBEdit69: TDBEdit;
    BtConsEstadia: TBitBtn;
    GroupBox17: TGroupBox;
    DBRadioGroup12: TDBRadioGroup;
    TabSheet11: TTabSheet;
    Label59: TLabel;
    CbEntidade: TComboBox;
    DBCheckBox1: TDBCheckBox;
    GBMaiusculo: TGroupBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBRadioGroup13: TDBRadioGroup;
    Label60: TLabel;
    DBEdit74: TDBEdit;
    Label61: TLabel;
    DBEdit75: TDBEdit;
    Label64: TLabel;
    DBEdit78: TDBEdit;
    GBDescontoMaximo: TGroupBox;
    Label62: TLabel;
    DBEdit76: TDBEdit;
    Label63: TLabel;
    DBEdit77: TDBEdit;
    DBCheckBox5: TDBCheckBox;
    TSNFe: TTabSheet;
    GroupBox18: TGroupBox;
    DBPAssuntoEmail: TDBPanel;
    DBMCorpoEmail: TDBMemo;
    Label65: TLabel;
    PMEmail: TPopupMenu;
    Filial1: TMenuItem;
    SriedaNota1: TMenuItem;
    Nmerodanota1: TMenuItem;
    Anexos1: TMenuItem;
    CNPJdaFilial1: TMenuItem;
    GroupBox19: TGroupBox;
    DBPAssuntoEmailCanc: TDBPanel;
    DBMCorpoEmailCanc: TDBMemo;
    Label66: TLabel;
    Label67: TLabel;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBRadioGroup14: TDBRadioGroup;
    DBCheckBox8: TDBCheckBox;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    DBPanel8: TDBPanel;
    GroupBox1: TGroupBox;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel9: TDBPanel;
    DBPanel10: TDBPanel;
    DBPanel11: TDBPanel;
    DBPDescVendaVista: TDBPanel;
    DBPJuroPrazo: TDBPanel;
    DBPanel14: TDBPanel;
    DBPanel15: TDBPanel;
    DBPDiasBloqueio: TDBPanel;
    DBPanel12: TDBPanel;
    DBPanel13: TDBPanel;
    DBPanel16: TDBPanel;
    DBPanel17: TDBPanel;
    DBPanel18: TDBPanel;
    DBPanel19: TDBPanel;
    DBPanel20: TDBPanel;
    DBPanel21: TDBPanel;
    DBPanel22: TDBPanel;
    DBPanel23: TDBPanel;
    DBPanel24: TDBPanel;
    DBPanel25: TDBPanel;
    DBPanel26: TDBPanel;
    DBPanel27: TDBPanel;
    DBPanel28: TDBPanel;
    DBPanel29: TDBPanel;
    DBPanel30: TDBPanel;
    DBRGCodProdutoNfe: TDBRadioGroup;
    DBPanel31: TDBPanel;
    DBRGCodCadastroNFe: TDBRadioGroup;
    DBRadioGroup15: TDBRadioGroup;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBRadioGroup16: TDBRadioGroup;
    DBRadioGroup17: TDBRadioGroup;
    TabSheet12: TTabSheet;
    Label2: TLabel;
    DbEContaInventario: TDBEdit;
    BitBtn1: TBitBtn;
    DBPanel33: TDBPanel;
    GroupBox2: TGroupBox;
    DBPanel34: TDBPanel;
    DBPanel35: TDBPanel;
    DBPanel36: TDBPanel;
    DBRadioGroup18: TDBRadioGroup;
    GroupBox20: TGroupBox;
    DBEdit2: TDBEdit;
    DBCheckBox11: TDBCheckBox;
    GBTributacao: TGroupBox;
    DBRGCalculoICMS: TDBRadioGroup;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label4: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    DBPanel38: TDBPanel;
    DBRadioGroup19: TDBRadioGroup;
    GroupBox21: TGroupBox;
    DBPanel32: TDBPanel;
    DBPanel39: TDBPanel;
    DBRadioGroup20: TDBRadioGroup;
    DBRadioGroup21: TDBRadioGroup;
    DBRadioGroup22: TDBRadioGroup;
    TabSheet13: TTabSheet;
    GroupBox22: TGroupBox;
    Label8: TLabel;
    DBPAssuntoEmailCTe: TDBPanel;
    DBMCorpoEmailCTe: TDBMemo;
    GroupBox23: TGroupBox;
    Label9: TLabel;
    DBPAssuntoEmailCancCTe: TDBPanel;
    DBMCorpoEmailCancCTe: TDBMemo;
    DBRadioGroup23: TDBRadioGroup;
    GroupBox24: TGroupBox;
    DBCBEmailRemetente: TDBCheckBox;
    DBCBEmailDestinatario: TDBCheckBox;
    DBCBEmailExpedidor: TDBCheckBox;
    DBCBEmailRecebedor: TDBCheckBox;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit4: TDBEdit;
    DBCheckBox12: TDBCheckBox;
    DBRadioGroup24: TDBRadioGroup;
    DBRadioGroup25: TDBRadioGroup;
    DBRG9LayoutCaixa: TDBRadioGroup;
    DBCodPatriLiq: TDBEdit;
    BTPatriLiqCons: TBitBtn;
    EDDescPatriLiq: TEdit;
    Label12: TLabel;
    DBRadioGroup26: TDBRadioGroup;
    dbTipoCalculoDiferencial: TDBRadioGroup;
    DBRadioGroup27: TDBRadioGroup;
    GroupBox25: TGroupBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBRGTabelaPreco: TDBRadioGroup;
    TabSheet14: TTabSheet;
    Panel2: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    cbNcm: TCheckBox;
    cbFabricante: TCheckBox;
    cbBarras: TCheckBox;
    DBRadioGroup28: TDBRadioGroup;
    DBRadioGroup29: TDBRadioGroup;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    DBEdit5: TDBEdit;
    Label15: TLabel;
    DBRControleEstoqueOS: TDBRadioGroup;
    GroupBox26: TGroupBox;
    DBPanel37: TDBPanel;
    DBPanel40: TDBPanel;
    DBRAtualizaNCMXML: TDBRadioGroup;
    GroupBox27: TGroupBox;
    DBPanel41: TDBPanel;
    DBPanel42: TDBPanel;
    DBPanel43: TDBPanel;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    DBCheckBox20: TDBCheckBox;
    DsConfiguracaoSkyhub: TDataSource;
    GroupBox29: TGroupBox;
    DBE1HostServidor: TDBEdit;
    Label19: TLabel;
    DBCBEmailFilial: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox23: TDBCheckBox;
    DBCheckBox24: TDBCheckBox;
    DBCheckBox25: TDBCheckBox;
    Label16: TLabel;
    DBEdit6: TDBEdit;
    GroupBox28: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    DBPanel44: TDBPanel;
    DBRadioGroup10: TDBRadioGroup;
    DBCheckBox26: TDBCheckBox;
    GroupBox30: TGroupBox;
    DBRadioGroup30: TDBRadioGroup;
    DBPDescCam1: TDBPanel;
    DBPDescCam2: TDBPanel;
    TabSheet15: TTabSheet;
    DBRadioGroup31: TDBRadioGroup;
    GroupBox31: TGroupBox;
    DBRadioGroup32: TDBRadioGroup;
    DBPanel45: TDBPanel;
    DBPanel46: TDBPanel;
    DBRadioGroup33: TDBRadioGroup;
    DBRadioGroup34: TDBRadioGroup;
    DBRDescontoOS: TDBRadioGroup;
    DBCheckBox27: TDBCheckBox;
    DBCheckBox28: TDBCheckBox;
    DBRadioGroup35: TDBRadioGroup;
    DBPanel47: TDBPanel;
    DBPUsuarioDvr: TDBPanel;
    DBPSenhaDvr: TDBPanel;
    DBPanel50: TDBPanel;
    DBPanel51: TDBPanel;
    procedure SBExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PCParametroChange(Sender: TObject);
    procedure DBEdit8Change(Sender: TObject);
    procedure BtConsOperacaoRomClick(Sender: TObject);
    procedure BtOperacaoConsClick(Sender: TObject);
    procedure BtnOperacaoContratoAntClick(Sender: TObject);
    procedure BtConsEstadiaClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure BtConsRpaCredClick(Sender: TObject);
    procedure BtConsRpaDebClick(Sender: TObject);
    procedure BtConsSestCredClick(Sender: TObject);
    procedure BtConsSestDebClick(Sender: TObject);
    procedure BtConsIrfCredClick(Sender: TObject);
    procedure BtConsIrfDebClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BtConsPedagioDebClick(Sender: TObject);
    procedure BtConsPedagioCredClick(Sender: TObject);
    procedure BtConsPedagioClick(Sender: TObject);
    procedure BtConsInssDebClick(Sender: TObject);
    procedure BtInssCredClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure TSComissaoShow(Sender: TObject);
    procedure Filial1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SriedaNota1Click(Sender: TObject);
    procedure Nmerodanota1Click(Sender: TObject);
    procedure CNPJdaFilial1Click(Sender: TObject);
    procedure Anexos1Click(Sender: TObject);
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel11DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel12DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel13DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel16DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel20DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel21DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel22DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel23DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel24DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel27DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel25DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel26DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel31DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel32DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBPanel33DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel33CodigoChange(Sender: TObject);
    procedure DBPanel34DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel35DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel36DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
    procedure DBLookupComboBox2CloseUp(Sender: TObject);
    procedure DBPanel39DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure BTPatriLiqConsClick(Sender: TObject);
    procedure DBCodPatriLiqChange(Sender: TObject);
    procedure cbNcmClick(Sender: TObject);
    procedure cbFabricanteClick(Sender: TObject);
    procedure cbBarrasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBP15OperacaoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP15ClassificacaoCadastroDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP15RamoFisicaDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP15RamoJuridicaDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP15TipoCadastroDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP15FilialDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP15VendedorDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP15DepartamentoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel45DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBP15LoteDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
  private
    function LocalizaEntidade(cod: string): Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FParamSistema: TFParamSistema;
  Registry: TRegistry;

implementation

uses UParamSistema_cl, UMoedaCons, UFilialCons, UMoeda_cl, UFilial_cl,
  UProdutoCons, UProduto_cl, UOperacaoCons, UOperacao_cl, UCadastroCons,
  UCadastro_cl, UFinalidadeCons, UFinalidade_cl, UHistoricoCons,
  UHistorico_cl, UHistContabilCons, UHistContabil_cl, UMensagemCons, UMensagem_cl,
  UPlanoContaCons, UPlanoConta_cl, UUsuario_cl, UBiblioteca, UNfe_cl,
  USerieCons, UOracle_cl, UContaPatriLiqCons, UClassCadastroCons,
  URamoCons, UTipoCadastroCons, UVendedorCons,
  UDepartamentoCons, UTipoLoteCons, UTipoLote_cl;

{$R *.DFM}

procedure TFParamSistema.SBExcluirClick(Sender: TObject);
begin
  //inherited;

end;

procedure TFParamSistema.FormActivate(Sender: TObject);
begin
  inherited;
  with DMParamSistema do
  begin
    QParamSistema.Open;
    QComissaoPrazo.Open;
    if QParamSistemaNum_Graus_Contabil.Value = 5 then
    begin
      QParamSistemaCod_Contabil_Frete_Cred.EditMask := '#.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Frete_Deb.EditMask := '#.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Sest_Cred.EditMask := '#.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Sest_Deb.EditMask := '#.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Irf_Cred.EditMask := '#.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Irf_Deb.EditMask := '#.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Pedagio_Cred.EditMask := '#.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Pedagio_Deb.EditMask := '#.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Inss_Cliente_Cred.EditMask := '#.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Inss_Cliente_Deb.EditMask := '#.##.##.##.######;0;';
    end
    else
    begin
      QParamSistemaCod_Contabil_Frete_Cred.EditMask := '#.##.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Frete_Deb.EditMask := '#.##.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Sest_Cred.EditMask := '#.##.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Sest_Deb.EditMask := '#.##.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Irf_Cred.EditMask := '#.##.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Irf_Deb.EditMask := '#.##.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Pedagio_Cred.EditMask := '#.##.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Pedagio_Deb.EditMask := '#.##.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Inss_Cliente_Cred.EditMask := '#.##.##.##.##.######;0;';
      QParamSistemaCod_Contabil_Inss_Cliente_Deb.EditMask := '#.##.##.##.##.######;0;';
    end;
    CbEntidade.ItemIndex := LocalizaEntidade(DMParamSistema.QParamSistemaCOD_ENTIDADE_CONTABIL.Value);
  end;
  Bib.addControleCharCase(DBPAssuntoEmail, Self.Name);
  PCParametro.TabIndex := 0;
end;

function TFParamSistema.LocalizaEntidade(cod: string): Integer;
var i: Integer;
begin
  for i := 0 to CbEntidade.Items.Count - 1 do
    if (copy(CbEntidade.Items[i], 1, 2) = cod) then
    begin
      Result := i;
      Exit;
    end;
  Result := -1;
end;

procedure TFParamSistema.PCParametroChange(Sender: TObject);
begin
  inherited;
  with DMParamSistema do
  begin
    if PCParametro.ActivePage = TSComissao then
    begin
      QComissaoPrazo.Open;
    //GBComissaoPrazo.Visible := DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value = '8'
    end
    else
      QComissaoPrazo.Close;

    if PCParametro.ActivePage = TabSheet14 then //Compras
    begin
      cbNcm.Checked := (QParamSistemaIND_CONSULTA_PRODUTO_XML_NCM.Value = 'SIM');
      cbFabricante.Checked := (QParamSistemaIND_CONSULTA_PRODUTO_XML_FABRI.Value = 'SIM');
      cbBarras.Checked := (QParamSistemaIND_CONSULTA_PRODUTO_XML_BARRA.Value = 'SIM');
    end;
  end;
end;

procedure TFParamSistema.DBEdit8Change(Sender: TObject);
begin
  inherited;
  GBComissaoPrazo.Enabled := Trim(DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value) = '8';
end;

procedure TFParamSistema.BtConsOperacaoRomClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = mrOk then
    DMParamSistema.QParamSistemaCod_Operacao_Romaneio.Value := Trunc(DMOperacao.QOperacaoConsCod_Operacao.Value);
end;

procedure TFParamSistema.BtOperacaoConsClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = mrOk then
    DMParamSistema.QParamSistemaCod_Operacao_Consumo.Value := Trunc(DMOperacao.QOperacaoConsCod_Operacao.Value);
end;

procedure TFParamSistema.BtnOperacaoContratoAntClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = mrOk then
    DMParamSistema.QParamSistemaCOD_OPERACAO_CONT_ANT.Value := Trunc(DMOperacao.QOperacaoConsCod_Operacao.Value);

end;

procedure TFParamSistema.BtConsEstadiaClick(Sender: TObject);
begin
  inherited;
  if FHistContabilCons = nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  if FHistContabilCons.ShowModal = MrOk then
    DMParamSistema.QParamSistemaCOD_HIST_CONTABIL_ESTADIA.Value := Trunc(DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value);
end;

procedure TFParamSistema.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(12);
end;

procedure TFParamSistema.BtConsRpaCredClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMParamSistema.QParamSistemaCod_Contabil_Frete_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFParamSistema.BtConsRpaDebClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMParamSistema.QParamSistemaCod_Contabil_Frete_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFParamSistema.BtConsSestCredClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMParamSistema.QParamSistemaCod_Contabil_Sest_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFParamSistema.BtConsSestDebClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMParamSistema.QParamSistemaCod_Contabil_Sest_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFParamSistema.BtConsIrfCredClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMParamSistema.QParamSistemaCod_Contabil_Irf_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFParamSistema.BtConsIrfDebClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMParamSistema.QParamSistemaCod_Contabil_Irf_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFParamSistema.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if FHistContabilCons = nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  if FHistContabilCons.ShowModal = MrOk then
    DMParamSistema.QParamSistemaCOD_HISTORICO_CONTABIL_RPA.Value := Trunc(DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value);
end;

procedure TFParamSistema.BtConsPedagioDebClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMParamSistema.QParamSistemaCod_Contabil_Pedagio_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFParamSistema.BtConsPedagioCredClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMParamSistema.QParamSistemaCod_Contabil_Pedagio_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFParamSistema.BtConsPedagioClick(Sender: TObject);
begin
  inherited;
  if FHistContabilCons = nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  if FHistContabilCons.ShowModal = MrOk then
    DMParamSistema.QParamSistemaCOD_HIST_CONTABIL_PEDAGIO.Value := Trunc(DMHistContabil.QHistContabilConsCOD_HISTORICO_CONTABIL.Value);

end;

procedure TFParamSistema.BtConsInssDebClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMParamSistema.QParamSistemaCod_Contabil_Inss_Cliente_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFParamSistema.BtInssCredClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMParamSistema.QParamSistemaCod_Contabil_Inss_Cliente_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFParamSistema.SBConfirmarClick(Sender: TObject);
begin
  DMParamSistema.QParamSistemaCOD_ENTIDADE_CONTABIL.Value := copy(CbEntidade.Text, 1, 2);
  inherited;
  
  RefreshCharCase;
end;

procedure TFParamSistema.SBAlterarClick(Sender: TObject);
begin
  inherited;
  CbEntidade.ItemIndex := LocalizaEntidade(DMParamSistema.QParamSistemaCOD_ENTIDADE_CONTABIL.Value);
end;

procedure TFParamSistema.TSComissaoShow(Sender: TObject);
begin
  inherited;
  // Friella usa estes campos para limitar o percentual de desconto  e acréscimo
  // que os vendedores podem dar ao fechar um pedido - Marlon 01/2010
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then
  begin
    DBPDescVendaVista.LCaption := 'Desconto Máximo (%)';
    DBPJuroPrazo.LCaption := 'Acréscimo Máximo (%)';
    DBPJuroPrazo.Width := 118;
    DBPDiasBloqueio.Left := 520;
  end;
end;

procedure TFParamSistema.DSPrimarioStateChange(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  for i := 0 to PMEmail.Items.Count - 1 do
    PMEmail.Items[i].Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  DBLookupComboBox1.Enabled := not(DSPrimario.State = DSBrowse);
  DBLookupComboBox2.Enabled := not(DSPrimario.State = DSBrowse);
  DBLookupComboBox3.Enabled := not(DSPrimario.State = DSBrowse);
  DBLookupComboBox4.Enabled := not(DSPrimario.State = DSBrowse);
  BTPatriLiqCons.Enabled := not(DSPrimario.State = DSBrowse);
  cbNcm.Enabled := not(DSPrimario.State = DSBrowse);
  cbFabricante.Enabled := not(DSPrimario.State = DSBrowse);
  cbBarras.Enabled := not(DSPrimario.State = DSBrowse);
end;

procedure TFParamSistema.Filial1Click(Sender: TObject);
begin
  inherited;
  if DBMCorpoEmail.Focused then
    DBMCorpoEmail.SelText := DFE_EMAIL_FILIAL
  else if (DBPAssuntoEmail.DBEdit.Focused) and (DBPAssuntoEmail.DBEdit <> nil) then
    DBPAssuntoEmail.DBEdit.SelText := DFE_EMAIL_FILIAL
  else if (DBPAssuntoEmailCanc.DBEdit.Focused) and (DBPAssuntoEmailCanc.DBEdit <> nil) then
    DBPAssuntoEmailCanc.DBEdit.SelText := DFE_EMAIL_FILIAL
  else if (DBMCorpoEmailCanc.Focused) and (DBMCorpoEmailCanc <> nil) then
    DBMCorpoEmailCanc.SelText := DFE_EMAIL_FILIAL;
end;

procedure TFParamSistema.SriedaNota1Click(Sender: TObject);
begin
  inherited;
  if DBMCorpoEmail.Focused then
    DBMCorpoEmail.SelText := NFE_EMAIL_SERIE
  else if (DBPAssuntoEmail.DBEdit.Focused) and (DBPAssuntoEmail.DBEdit <> nil) then
    DBPAssuntoEmail.DBEdit.SelText := NFE_EMAIL_SERIE
  else if (DBPAssuntoEmailCanc.DBEdit.Focused) and (DBPAssuntoEmailCanc.DBEdit <> nil) then
    DBPAssuntoEmailCanc.DBEdit.SelText := NFE_EMAIL_SERIE
  else if (DBMCorpoEmailCanc.Focused) and (DBMCorpoEmailCanc <> nil) then
    DBMCorpoEmailCanc.SelText := NFE_EMAIL_SERIE;
end;

procedure TFParamSistema.Nmerodanota1Click(Sender: TObject);
begin
  inherited;
  if DBMCorpoEmail.Focused then
    DBMCorpoEmail.SelText := NFE_EMAIL_NUMERO
  else if (DBPAssuntoEmail.DBEdit.Focused) and (DBPAssuntoEmail.DBEdit <> nil) then
    DBPAssuntoEmail.DBEdit.SelText := NFE_EMAIL_NUMERO
  else if (DBPAssuntoEmailCanc.DBEdit.Focused) and (DBPAssuntoEmailCanc.DBEdit <> nil) then
    DBPAssuntoEmailCanc.DBEdit.SelText := NFE_EMAIL_NUMERO
  else if (DBMCorpoEmailCanc.Focused) and (DBMCorpoEmailCanc <> nil) then
    DBMCorpoEmailCanc.SelText := NFE_EMAIL_NUMERO;
end;

procedure TFParamSistema.CNPJdaFilial1Click(Sender: TObject);
begin
  inherited;
  if DBMCorpoEmail.Focused then
    DBMCorpoEmail.SelText := DFE_EMAIL_CNPJ
  else if (DBPAssuntoEmail.DBEdit.Focused) and (DBPAssuntoEmail.DBEdit <> nil) then
    DBPAssuntoEmail.DBEdit.SelText := DFE_EMAIL_CNPJ
  else if (DBPAssuntoEmailCanc.DBEdit.Focused) and (DBPAssuntoEmailCanc.DBEdit <> nil) then
    DBPAssuntoEmailCanc.DBEdit.SelText := DFE_EMAIL_CNPJ
  else if (DBMCorpoEmailCanc.Focused) and (DBMCorpoEmailCanc <> nil) then
    DBMCorpoEmailCanc.SelText := DFE_EMAIL_CNPJ;
end;

procedure TFParamSistema.Anexos1Click(Sender: TObject);
begin
  inherited;
  if DBMCorpoEmail.Focused then
    DBMCorpoEmail.SelText := DFE_EMAIL_ARQUIVO
  else if (DBPAssuntoEmail.DBEdit.Focused) and (DBPAssuntoEmail.DBEdit <> nil) then
    DBPAssuntoEmail.DBEdit.SelText := DFE_EMAIL_ARQUIVO
  else if (DBPAssuntoEmailCanc.DBEdit.Focused) and (DBPAssuntoEmailCanc.DBEdit <> nil) then
    DBPAssuntoEmailCanc.DBEdit.SelText := DFE_EMAIL_ARQUIVO
  else if (DBMCorpoEmailCanc.Focused) and (DBMCorpoEmailCanc <> nil) then
    DBMCorpoEmailCanc.SelText := DFE_EMAIL_ARQUIVO;
end;

procedure TFParamSistema.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFParamSistema.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FMoedaCons;
  Classe := TFMoedaCons;
end;

procedure TFParamSistema.DBPanel11DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FMoedaCons;
  Classe := TFMoedaCons;
end;

procedure TFParamSistema.DBPanel12DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFParamSistema.DBPanel13DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFinalidadeCons;
  Classe := TFFinalidadeCons;
end;

procedure TFParamSistema.DBPanel16DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FHistContabilCons;
  Classe := TFHistContabilCons;
end;

procedure TFParamSistema.DBPanel20DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FHistoricoCons;
  Classe := TFHistoricoCons;
end;

procedure TFParamSistema.DBPanel21DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFParamSistema.DBPanel22DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFParamSistema.DBPanel23DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFParamSistema.DBPanel24DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFParamSistema.DBPanel27DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FMensagemCons;
  Classe := TFMensagemCons;
end;

procedure TFParamSistema.DBPanel25DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FHistoricoCons;
  Classe := TFHistoricoCons;
end;

procedure TFParamSistema.DBPanel26DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FHistoricoCons;
  Classe := TFHistoricoCons;
end;

procedure TFParamSistema.DBPanel31DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FOperacaoCons;
  Classe := TFOperacaoCons;
end;

procedure TFParamSistema.DBPanel32DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FSerieCons;
  Classe := TFSerieCons;
end;

procedure TFParamSistema.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMParamSistema.QParamSistemaCOD_CONTABIL_INVENTARIO.Value := DMPlanoConta.QPlanoContaConsNUM_PLANO_CONTA.Value;
end;

procedure TFParamSistema.DBPanel33DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFParamSistema.DBPanel33CodigoChange(Sender: TObject);
begin
  inherited;
  if not DMParamSistema.QParamSistemaCOD_PRODUTO_SERVICO.IsNull then
    if (dmoracle.FastSelect('IND_TIPO_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' +
      DMParamSistema.QParamSistemaCOD_PRODUTO_SERVICO.asString) <> 'SERVIÇO') then
    begin
      DMParamSistema.QParamSistemaCOD_PRODUTO_SERVICO.Clear;
      raise Exception.Create('O produto selecionado precisa ser um serviço.');
    end;
end;

procedure TFParamSistema.DBPanel34DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FHistoricoCons;
  Classe := TFHistoricoCons;
end;

procedure TFParamSistema.DBPanel35DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FHistoricoCons;
  Classe := TFHistoricoCons;
end;

procedure TFParamSistema.DBPanel36DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FHistoricoCons;
  Classe := TFHistoricoCons;
end;

procedure TFParamSistema.DBLookupComboBox1CloseUp(Sender: TObject);
begin
  inherited;
  with DMParamSistema do
  begin
    if QCstpisCOD_CST_PIS.Value = '' then
      QParamSistemaCOD_CST_PIS_FRETE.Clear;
  end;
end;

procedure TFParamSistema.DBLookupComboBox2CloseUp(Sender: TObject);
begin
  inherited;
  with DMParamSistema do
  begin
    if QCstCofinsCOD_CST_COFINS.Value = '' then
      QParamSistemaCOD_CST_COFINS_FRETE.Clear;
  end;
end;

procedure TFParamSistema.DBPanel39DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FMensagemCons;
  Classe := TFMensagemCons;
end;

procedure TFParamSistema.BTPatriLiqConsClick(Sender: TObject);
begin
  inherited;
  with DMParamSistema do
  begin
    if FContaPatriLiqCons = Nil then
      FContaPatriLiqCons := TFContaPatriLiqCons.Create(Application);
    if FContaPatriLiqCons.ShowModal = MrOk then
    begin
      QParamSistemaCOD_CONTA_PATRI_LIQ_SINTETICO.Value :=
        QContaPatriLiqConsCOD_PLANO_CONTA.Value;
    end;
  end;
end;

procedure TFParamSistema.DBCodPatriLiqChange(Sender: TObject);
begin
  inherited;
  with DMParamSistema do
  begin
    if Trim(DBCodPatriLiq.Text) <> '' then
    begin
      QContaPatriLiqCons.Close;
      QContaPatriLiqCons.SetVariable('COD_PLANO_CONTA',
        Trim(DBCodPatriLiq.Text));
      QContaPatriLiqCons.Open;
      EDDescPatriLiq.Text := QContaPatriLiqConsDESC_COMPLETA.Text;
    end;
  end;
end;

procedure TFParamSistema.cbNcmClick(Sender: TObject);
begin
  inherited;
  // Pesquisa por código de barras é exclusiva
  if cbNcm.Checked then
    cbBarras.Checked := false;
  if cbNcm.Checked then
    DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_NCM.Value := 'SIM'
  else
    DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_NCM.Value := 'NAO';
end;

procedure TFParamSistema.cbFabricanteClick(Sender: TObject);
begin
  inherited;
  // Pesquisa por código de barras é exclusiva
  if cbFabricante.Checked then
    cbBarras.Checked := false;
  if cbFabricante.Checked then
    DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_FABRI.Value := 'SIM'
  else
    DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_FABRI.Value := 'NAO';
end;

procedure TFParamSistema.cbBarrasClick(Sender: TObject);
begin
  inherited;
  // Pesquisa por código de barras é exclusiva
  if cbBarras.Checked then
  begin
  cbFabricante.Checked := false;
  cbNcm.Checked := false;
  end;
  if cbBarras.Checked then
    DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_BARRA.Value := 'SIM'
  else
    DMParamSistema.QParamSistemaIND_CONSULTA_PRODUTO_XML_BARRA.Value := 'NAO';
end;

procedure TFParamSistema.FormCreate(Sender: TObject);
begin
  inherited;
  Bib.addControleCharCase(DBPanel9, Self.Name); //CODIGO SPC.
  Bib.addControleCharCase(DBPanel10, Self.Name); //SENHA SPC. Junior 20/03/2026
  Bib.addControleCharCase(DBE1HostServidor, Self.Name);
  Bib.addControleCharCase(DBPDescCam1, Self.Name);
  Bib.addControleCharCase(DBPDescCam2, Self.Name);
  Bib.addControleCharCase(DBPUsuarioDvr, Self.Name);
  Bib.addControleCharCase(DBPSenhaDvr, Self.Name);
end;

procedure TFParamSistema.DBP15OperacaoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FOperacaoCons;
  Classe := TFOperacaoCons;
end;

procedure TFParamSistema.DBP15ClassificacaoCadastroDefineByForm(
  Sender: TObject; var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FClassCadastroCons;
  Classe := TFClassCadastroCons;
end;

procedure TFParamSistema.DBP15RamoFisicaDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FRamoCons;
  Classe := TFRamoCons;
end;

procedure TFParamSistema.DBP15RamoJuridicaDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FRamoCons;
  Classe := TFRamoCons;
end;

procedure TFParamSistema.DBP15TipoCadastroDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTipoCadastroCons;
  Classe := TFTipoCadastroCons;
end;

procedure TFParamSistema.DBP15FilialDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFParamSistema.DBP15VendedorDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVendedorCons;
  Classe := TFVendedorCons;
end;

procedure TFParamSistema.DBP15DepartamentoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FDepartamentoCons;
  Classe := TFDepartamentoCons;
end;

procedure TFParamSistema.DBPanel45DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTipoCadastroCons;
  Classe := TFTipoCadastroCons;
end;

procedure TFParamSistema.DBP15LoteDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTipoLoteCons;
  Classe := TFTipoLoteCons;
end;

end.
