unit UOperacaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBDirceu, Grids, DBGrids, variants, DBPanel, ActnList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFOperacaoCad = class(TFTCadSimples)
    DBRadioGroup1: TDBRadioGroup;
    Operao1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup9: TDBRadioGroup;
    TabSheet3: TTabSheet;
    DBRadioGroup5: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    TabSheet4: TTabSheet;
    DBRadioGroup8: TDBRadioGroup;
    DBRadioGroup10: TDBRadioGroup;
    TabSheet5: TTabSheet;
    DBRadioGroup11: TDBRadioGroup;
    DBRadioGroup7: TDBRadioGroup;
    DBRadioGroup12: TDBRadioGroup;
    DBRadioGroup13: TDBRadioGroup;
    DBRadioGroup14: TDBRadioGroup;
    DBRadioGroup15: TDBRadioGroup;
    DBRadioGroup16: TDBRadioGroup;
    DBRadioGroup17: TDBRadioGroup;
    DBRadioGroup18: TDBRadioGroup;
    DBRadioGroup19: TDBRadioGroup;
    DBRadioGroup21: TDBRadioGroup;
    DBRadioGroup22: TDBRadioGroup;
    DBRadioGroup23: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup24: TDBRadioGroup;
    TabSheet6: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    GroupBox5: TGroupBox;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    BtConsCtNotaC: TBitBtn;
    BtConsCtNotaD: TBitBtn;
    BtConsCtFreteC: TBitBtn;
    BtConsCtFreteD: TBitBtn;
    BtConsCtFunRuralC: TBitBtn;
    BtConsCtFunRuralD: TBitBtn;
    BtConsICMSC: TBitBtn;
    BtConsICMSD: TBitBtn;
    BtConsFreteICMSC: TBitBtn;
    BtConsFreteICMSD: TBitBtn;
    DBRadioGroup20: TDBRadioGroup;
    DBRadioGroup25: TDBRadioGroup;
    DBRadioGroup26: TDBRadioGroup;
    DBRadioGroup27: TDBRadioGroup;
    DBRadioGroup28: TDBRadioGroup;
    Label14: TLabel;
    DBEdit18: TDBEdit;
    BitBtn1: TBitBtn;
    OperaoComContasContabeis1: TMenuItem;
    GroupBox6: TGroupBox;
    Label15: TLabel;
    DBEdit19: TDBEdit;
    Label18: TLabel;
    DBEdit20: TDBEdit;
    BtConsFixacaoDeb: TBitBtn;
    BtConsFixacaoCred: TBitBtn;
    GroupBox7: TGroupBox;
    Label20: TLabel;
    DBEdit22: TDBEdit;
    BitBtn2: TBitBtn;
    Label21: TLabel;
    DBEdit23: TDBEdit;
    BitBtn3: TBitBtn;
    Label22: TLabel;
    DBEdit28: TDBEdit;
    BitBtn4: TBitBtn;
    GroupBox8: TGroupBox;
    DBEdit12: TDBEdit;
    BtConsHistContabil: TBitBtn;
    GroupBox9: TGroupBox;
    DBRadioGroup30: TDBRadioGroup;
    DBRadioGroup29: TDBRadioGroup;
    DBRadioGroup31: TDBRadioGroup;
    TabSheet7: TTabSheet;
    DBDirceu4: TDBDirceu;
    GroupBox10: TGroupBox;
    Label29: TLabel;
    DBEdit13: TDBEdit;
    Label30: TLabel;
    DBEdit14: TDBEdit;
    Label33: TLabel;
    DBEdit36: TDBEdit;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    GroupBox11: TGroupBox;
    Label31: TLabel;
    DBEdit34: TDBEdit;
    Label32: TLabel;
    DBEdit35: TDBEdit;
    Label34: TLabel;
    DBEdit37: TDBEdit;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Label35: TLabel;
    DBEdit38: TDBEdit;
    Label36: TLabel;
    DBEdit39: TDBEdit;
    DBRadioGroup32: TDBRadioGroup;
    DBRadioGroup33: TDBRadioGroup;
    DBRadioGroup34: TDBRadioGroup;
    DBRadioGroup35: TDBRadioGroup;
    GroupBox12: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    GroupBox13: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    GroupBox14: TGroupBox;
    Label41: TLabel;
    Label42: TLabel;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    GroupBox15: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    GroupBox16: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    DBEdit48: TDBEdit;
    BitBtn19: TBitBtn;
    DBEdit49: TDBEdit;
    BitBtn20: TBitBtn;
    GroupBox17: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    DBEdit50: TDBEdit;
    BitBtn21: TBitBtn;
    DBEdit51: TDBEdit;
    BitBtn22: TBitBtn;
    GroupBox18: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    GroupBox19: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    GroupBox22: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    GroupBox23: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    DBRadioGroup36: TDBRadioGroup;
    Label59: TLabel;
    DBEdit60: TDBEdit;
    BitBtn31: TBitBtn;
    DBEdit61: TDBEdit;
    Label60: TLabel;
    BitBtn32: TBitBtn;
    GroupBox24: TGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    DBEdit62: TDBEdit;
    DBEdit63: TDBEdit;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    GroupBox25: TGroupBox;
    Label63: TLabel;
    Label64: TLabel;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    BitBtn35: TBitBtn;
    BitBtn36: TBitBtn;
    GroupBox26: TGroupBox;
    Label65: TLabel;
    Label66: TLabel;
    DBEdit66: TDBEdit;
    DBEdit67: TDBEdit;
    BitBtn37: TBitBtn;
    BitBtn38: TBitBtn;
    DBRadioGroup38: TDBRadioGroup;
    DBRadioGroup39: TDBRadioGroup;
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
    DBRadioGroup40: TDBRadioGroup;
    DBRadioGroup41: TDBRadioGroup;
    DBRadioGroup42: TDBRadioGroup;
    GroupBox20: TGroupBox;
    DBPanel13: TDBPanel;
    DBPanel14: TDBPanel;
    DBRadioGroup43: TDBRadioGroup;
    GroupBox21: TGroupBox;
    Label5: TLabel;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    DBEdit15: TDBEdit;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    GroupBox27: TGroupBox;
    Label13: TLabel;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    DBRadioGroup44: TDBRadioGroup;
    DBLCBaseCalcCred: TDBLookupComboBox;
    Label17: TLabel;
    DBLCSerieModelo: TDBLookupComboBox;
    Label19: TLabel;
    DBRadioGroup45: TDBRadioGroup;
    Label23: TLabel;
    DBLCCstPis: TDBLookupComboBox;
    Label24: TLabel;
    DBLCCstCofins: TDBLookupComboBox;
    DBPanel11: TDBPanel;
    DBPanel12: TDBPanel;
    dbcbSegundaViaCupom: TDBCheckBox;
    DBPanel15: TDBPanel;
    DBPanel16: TDBPanel;
    GroupBox28: TGroupBox;
    Label25: TLabel;
    DBEdit21: TDBEdit;
    BitBtn43: TBitBtn;
    GroupBox29: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    BitBtn44: TBitBtn;
    BitBtn45: TBitBtn;
    GroupBox30: TGroupBox;
    Label28: TLabel;
    Label53: TLabel;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    BitBtn46: TBitBtn;
    BitBtn47: TBitBtn;
    DBComboBox7: TDBComboBox;
    Label54: TLabel;
    DBPanel17: TDBPanel;
    DBPanel18: TDBPanel;
    DBPanel19: TDBPanel;
    GroupBox31: TGroupBox;
    Label67: TLabel;
    Label68: TLabel;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    BitBtn48: TBitBtn;
    BitBtn49: TBitBtn;
    DBRadioGroup37: TDBRadioGroup;
    DBRadioGroup46: TDBRadioGroup;
    Label70: TLabel;
    DBLCCClasTribIBSCBS: TDBLookupComboBox;

    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtConsCtNotaCClick(Sender: TObject);
    procedure BtConsCtNotaDClick(Sender: TObject);
    procedure BtConsCtFreteCClick(Sender: TObject);
    procedure BtConsCtFreteDClick(Sender: TObject);
    procedure BtConsICMSCClick(Sender: TObject);
    procedure BtConsICMSDClick(Sender: TObject);
    procedure BtConsFreteICMSCClick(Sender: TObject);
    procedure BtConsFreteICMSDClick(Sender: TObject);
    procedure BtConsCtFunRuralCClick(Sender: TObject);
    procedure BtConsCtFunRuralDClick(Sender: TObject);
    procedure BtConsHistContabilClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure Operao1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure OperaoComContasContabeis1Click(Sender: TObject);
    procedure BtConsFixacaoDebClick(Sender: TObject);
    procedure BtConsFixacaoCredClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure DBPanel4DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel6DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel8DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel10DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel5DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure BitBtn40Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBLCBaseCalcCredCloseUp(Sender: TObject);
    procedure DBLCSerieModeloCloseUp(Sender: TObject);
    procedure DBRadioGroup28Change(Sender: TObject);
    procedure BitBtn43Click(Sender: TObject);
    procedure BitBtn47Click(Sender: TObject);
    procedure BitBtn46Click(Sender: TObject);
    procedure DBPanel18DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn48Click(Sender: TObject);
    procedure BitBtn49Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DBLCCClasTribIBSCBSDropDown(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperacaoCad: TFOperacaoCad;

implementation

uses UOperacao_cl, UOperacaoCons, UParamSistema_cl, UPlanoContaCons,
  UPlanoConta_cl, UHistContabilCons, UHistContabil_cl, UHistoricoCons,
  UHistorico_cl, UOperacaoParam, UROperacao, UrOperacao_Contabil, UProduto_cl,
  UTributacaoCons, UMensagemCons, UTributacao_cl, UMensagem_cl, URamoCons,
  URamo_cl, Math, UUsuario_cl, UFinalidadeCons, UOracle_cl;

{$R *.DFM}


procedure TFOperacaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMOperacao do
  Begin
    QOperacao.Open;
    If DMParamSistema.QParamSistemaNum_Graus_Contabil.Value = 5 Then
    Begin
      QOperacaoCod_Contabil_Val_Nota_Cred.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_Val_Nota_Deb.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_Val_Nota_APrazo.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Cont_Val_Nota_Cred_AVista.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_Val_ICMS_Deb.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_Val_ICMS_Cred.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_Val_FUNRURAL_Cred.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_Val_FUNRURAL_Deb.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_FRETE_ICMS_Cred.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_FRETE_ICMS_Deb.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_FRETE_Cred.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_FRETE_Deb.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_Desc_AFixar_Deb.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_Desc_AFixar_Cred.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_Contrato_Deb.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_Contrato_Cred.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_Pis_Deb.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_Pis_Cred.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_Cofins_Deb.EditMask := '#.##.##.##.######;0;';
      QOperacaoCod_Contabil_Cofins_Cred.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_IRRF_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_IRRF_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_CSLL_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_CSLL_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_INSS_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_INSS_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_ISSQN_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_ISSQN_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_TRANSGENICO_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_TRANSGENICO_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_FITAS_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_FITAS_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_FACS_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_FACS_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_FETHAB_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_FETHAB_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_PEDAGIO_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_PEDAGIO_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_SEST_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_SEST_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_SENAT_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_SENAT_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_NOTA_DEB_DUP.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_NOTA_CRED_DUP.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_CONTRATO_INC_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_CONTRATO_INC_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONT_VAR_CAMBIAL_POS_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONT_VAR_CAMBIAL_POS_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONT_VAR_CAMBIAL_NEG_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONT_VAR_CAMBIAL_NEG_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_IPI_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_IPI_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_CUSTO_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_CUSTO_CRED.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_NOTA_SPED_CONTRIB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_SUBST_DEB.EditMask := '#.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_SUBST_CRED.EditMask := '#.##.##.##.######;0;';
    End
    Else
    Begin
      QOperacaoCod_Contabil_Val_Nota_Cred.EditMask :=   '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_Val_Nota_Deb.EditMask :=    '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_Val_Nota_APrazo.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCod_Cont_Val_Nota_Cred_AVista.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_Val_ICMS_Deb.EditMask :=    '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_Val_ICMS_Cred.EditMask :=   '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_Val_FUNRURAL_Cred.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_Val_FUNRURAL_Deb.EditMask :='#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_FRETE_ICMS_Cred.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_FRETE_ICMS_Deb.EditMask :=  '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_FRETE_Cred.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_FRETE_Deb.EditMask :=  '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_Desc_AFixar_Deb.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_Desc_AFixar_Cred.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_Contrato_Deb.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_Contrato_Cred.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_Pis_Deb.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_Pis_Cred.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_Cofins_Deb.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCod_Contabil_Cofins_Cred.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_IRRF_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_IRRF_CRED.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_CSLL_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_CSLL_CRED.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_INSS_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_INSS_CRED.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_ISSQN_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_ISSQN_CRED.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_TRANSGENICO_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_TRANSGENICO_CRED.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_FITAS_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_FITAS_CRED.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_FACS_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_FACS_CRED.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_FETHAB_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_FETHAB_CRED.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_PEDAGIO_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_PEDAGIO_CRED.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_SEST_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_SEST_CRED.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_SENAT_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_SENAT_CRED.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_NOTA_DEB_DUP.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_NOTA_CRED_DUP.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_CONTRATO_INC_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_CONTRATO_INC_CRED.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONT_VAR_CAMBIAL_POS_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONT_VAR_CAMBIAL_POS_CRED.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONT_VAR_CAMBIAL_NEG_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONT_VAR_CAMBIAL_NEG_CRED.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_IPI_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_IPI_CRED.EditMask:= '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_CUSTO_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_CUSTO_CRED.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_NOTA_SPED_CONTRIB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_SUBST_DEB.EditMask := '#.##.##.##.##.######;0;';
      QOperacaoCOD_CONTABIL_SUBST_CRED.EditMask := '#.##.##.##.##.######;0;';
    End;
  End;
  BtCopia.Visible := SBIncluir.Visible;
  DMProduto.QClassTribIBSCBS.Open;
end;

procedure TFOperacaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  With DMOperacao do
  Begin
    QOperacao.Close;
    QOperacao.SetVariable('PK',QOperacaoConsCod_Operacao.Value);
    QOperacao.Open;
  End;
end;

procedure TFOperacaoCad.BtConsCtNotaCClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Val_Nota_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
                        
end;

procedure TFOperacaoCad.BtConsCtNotaDClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Val_Nota_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BtConsCtFreteCClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Frete_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BtConsCtFreteDClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Frete_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BtConsICMSCClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Val_ICMS_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BtConsICMSDClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Val_ICMS_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BtConsFreteICMSCClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Frete_ICMS_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BtConsFreteICMSDClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Frete_ICMS_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BtConsCtFunRuralCClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Val_FunRural_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BtConsCtFunRuralDClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Val_FunRural_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BtConsHistContabilClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Historico_Contabil.Value := DMHistContabil.QHistContabilConsCod_Historico_Contabil.Value;
end;

procedure TFOperacaoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(33);
end;

procedure TFOperacaoCad.Operao1Click(Sender: TObject);
begin
  inherited;
  if FOperacaoParam = Nil then
    FOperacaoParam := TFOperacaoParam.Create(Application);
  FOperacaoParam.PGRelatorio.Pages[0].TabVisible := True;
  if FOperacaoParam.ShowModal = MROk then
    begin
      DMOperacao.QROperacao.Close;
      case FOperacaoParam.RgTipoOperacao.ItemIndex of
        0 : DMOperacao.QROperacao.SetVariable('IND_TIPO_OPERACAO','E');
        1 : DMOperacao.QROperacao.SetVariable('IND_TIPO_OPERACAO','S');
        2 : DMOperacao.QROperacao.SetVariable('IND_TIPO_OPERACAO',Null);
      End;
      case FOperacaoParam.RGLiberada.ItemIndex of
        0 : DMOperacao.QROperacao.SetVariable('IND_LIBERADO','S');
        1 : DMOperacao.QROperacao.SetVariable('IND_LIBERADO','N');
        2 : DMOperacao.QROperacao.SetVariable('IND_LIBERADO',Null);
      End;
      DMOperacao.QROperacao.SQL[DMOperacao.QROperacao.SQL.Count-1] := '';
      Case FOperacaoParam.RGOrdem.ItemIndex of
        0 : DMOperacao.QROperacao.SQL.Add('ORDER BY Tb_Operacao.DESC_OPERACAO');
        1 : DMOperacao.QROperacao.SQL.Add('ORDER BY Tb_Operacao.COD_OPERACAO');
      End;

      DMOperacao.QROperacao.Open;
      if FROperacao = Nil then
        FROperacao := TFROperacao.Create(Application);
      if FOperacaoParam.RGPreview.ItemIndex = 0 then
        FROperacao.QRPrimario.Preview
      else
        FROperacao.QRPrimario.Print;
      DMOperacao.QROperacao.Close;
    end;
end;

procedure TFOperacaoCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Val_Nota_APrazo.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.OperaoComContasContabeis1Click(Sender: TObject);
begin
  inherited;
  if FOperacaoParam = Nil then
    FOperacaoParam := TFOperacaoParam.Create(Application);
  FOperacaoParam.PGRelatorio.Pages[0].TabVisible := True;
  if FOperacaoParam.ShowModal = MROk then
    begin
      DMOperacao.QROperacao_Contabil.Close;
      DMOperacao.QROperacao_Contabil_Item.close;
      case FOperacaoParam.RgTipoOperacao.ItemIndex of
        0 : DMOperacao.QROperacao_Contabil.SetVariable('IND_TIPO_OPERACAO','E');
        1 : DMOperacao.QROperacao_Contabil.SetVariable('IND_TIPO_OPERACAO','S');
        2 : DMOperacao.QROperacao_Contabil.SetVariable('IND_TIPO_OPERACAO',Null);
      End;
      DMOperacao.QROperacao_Contabil.SQL[DMOperacao.QROperacao_Contabil.SQL.Count-1] := '';
      Case FOperacaoParam.RGOrdem.ItemIndex of
        0 : DMOperacao.QROperacao_Contabil.SQL.Add('ORDER BY Tb_Operacao.DESC_OPERACAO');
        1 : DMOperacao.QROperacao_Contabil.SQL.Add('ORDER BY Tb_Operacao.COD_OPERACAO');
      End;
      DMOperacao.QROperacao_Contabil.Open;
      DMOperacao.QROperacao_Contabil_Item.Open;

      if FROperacao_Contabil = Nil then
        FROperacao_Contabil := TFROperacao_Contabil.Create(Application);
      if FOperacaoParam.RGPreview.ItemIndex = 0 then
        FROperacao_Contabil.QRPrimario.Preview
      else
        FROperacao_Contabil.QRPrimario.Print;
        DMOperacao.QROperacao_Contabil.Close;
        DMOperacao.QROperacao_Contabil_Item.close;
    end;

end;

procedure TFOperacaoCad.BtConsFixacaoDebClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Desc_AFixar_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BtConsFixacaoCredClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Desc_AFixar_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Transgenico_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Transgenico_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMOperacao do
    QOperacao.Open;
  Action := CaFree;
  FOperacaoCad := Nil;
end;

procedure TFOperacaoCad.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Cont_Val_Nota_Cred_AVista.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn5Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Pis_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn6Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Pis_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn7Click(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Historico_Contabil_Pis.Value := DMHistContabil.QHistContabilConsCod_Historico_Contabil.Value;

end;

procedure TFOperacaoCad.BitBtn8Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Cofins_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn9Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Cofins_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn10Click(Sender: TObject);
begin
  inherited;
  If FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Historico_Contabil_Cofins.Value := DMHistContabil.QHistContabilConsCod_Historico_Contabil.Value;

end;

procedure TFOperacaoCad.BitBtn11Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_IRRF_DEB.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BitBtn12Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_IRRF_CRED.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BitBtn13Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_CSLL_DEB.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BitBtn14Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_CSLL_CRED.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BitBtn15Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_INSS_DEB.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BitBtn16Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_INSS_CRED.Value := DMPlanoConta.QPlanoContaConsNUM_PLANO_CONTA.Value;
end;

procedure TFOperacaoCad.BitBtn17Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_ISSQN_DEB.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BitBtn18Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_ISSQN_CRED.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BitBtn22Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Fitas_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn21Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Fitas_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn23Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_FACS_DEB.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BitBtn24Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_FACS_CRED.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn25Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_FETHAB_DEB.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn26Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_FETHAB_CRED.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn27Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_PEDAGIO_DEB.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn28Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_PEDAGIO_CRED.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn29Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_SEST_DEB.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn30Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_SEST_CRED.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn31Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Nota_Deb_Dup.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn32Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Nota_Cred_Dup.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn34Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_CONTRATO_INC_CRED.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn33Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_CONTRATO_INC_DEB.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn35Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONT_VAR_CAMBIAL_POS_DEB.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn36Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONT_VAR_CAMBIAL_POS_CRED.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn37Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONT_VAR_CAMBIAL_NEG_DEB.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn38Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONT_VAR_CAMBIAL_NEG_CRED.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
  if DMOperacao.QOperacaoIND_NATUREZA_EXPORTACAO.IsNull then
    DMOperacao.QOperacaoIND_NATUREZA_EXPORTACAO.Value := 'N';
end;

procedure TFOperacaoCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DMOperacao.QOperacaoIND_NATUREZA_EXPORTACAO.Value := 'N';
end;

procedure TFOperacaoCad.DBPanel4DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FOperacaoCons;
  Classe := TFOperacaoCons;
end;

procedure TFOperacaoCad.DBPanel6DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTributacaoCons;
  Classe := TFTributacaoCons;
end;

procedure TFOperacaoCad.DBPanel8DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FHistoricoCons;
  Classe := TFHistoricoCons;
end;

procedure TFOperacaoCad.DBPanel10DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FRamoCons;
  Classe := TFRamoCons;
end;

procedure TFOperacaoCad.DBPanel5DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FMensagemCons;
  Classe := TFMensagemCons;
end;

procedure TFOperacaoCad.BitBtn40Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = MrOk then
    DMOperacao.QOperacaoCod_Contabil_Ipi_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn39Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCod_Contabil_Ipi_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn42Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = MrOk then
    DMOperacao.QOperacaoCod_Contabil_Subst_Deb.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;                        

procedure TFOperacaoCad.BitBtn41Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = MrOk then
    DMOperacao.QOperacaoCod_Contabil_Subst_Cred.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  BtConsCtNotaD.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn1.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn31.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn4.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BtConsCtNotaC.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn32.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BtConsCtFreteD.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BtConsCtFreteC.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BtConsICMSD.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BtConsICMSC.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BtConsFreteICMSD.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BtConsFreteICMSC.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BtConsHistContabil.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BtConsCtFunRuralD.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BtConsCtFunRuralC.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BtConsFixacaoDeb.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BtConsFixacaoCred.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn2.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn3.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn19.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn20.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn21.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn22.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn30.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn40.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn41.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn42.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn5.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn6.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn7.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn8.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn9.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn10.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn27.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn28.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn11.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn12.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn13.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn14.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn15.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn16.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn17.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn18.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn23.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn24.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn29.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn30.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn25.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn26.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn33.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn34.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn35.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn36.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn37.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn38.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn43.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn44.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn45.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn46.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BitBtn47.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  DBLCBaseCalcCred.Enabled := not (DSPrimario.State = DSBrowse);
  DBLCSerieModelo.Enabled := not (DSPrimario.State = DSBrowse);
  DBLCCstPis.Enabled := not (DSPrimario.State = DSBrowse);
  DBLCCstCofins.Enabled := not (DSPrimario.State = DSBrowse);
  DBLCCClasTribIBSCBS.Enabled := DSPrimario.State in [dsEdit, dsInsert];
end;

procedure TFOperacaoCad.DBLCBaseCalcCredCloseUp(Sender: TObject);
begin
  inherited;
  with DMOperacao do
  begin
    DBLCBaseCalcCred.Hint := QBCCreditoDESC_COMPLETA.Value;
    if QBCCreditoCOD_BC_CREDITO_PISCOFINS.Value = '' then
      QOperacaoCOD_BC_CREDITO_PISCOFINS.Clear;
  end;
end;

procedure TFOperacaoCad.DBLCSerieModeloCloseUp(Sender: TObject);
begin
  inherited;
  with DMOperacao do
  begin
    DBLCSerieModelo.Hint := QSerieModeloConsDESC_COMPLETA.Value;
    if QSerieModeloConsCOD_SERIE_MODELO.Value = '' then
      QOperacaoCOD_SERIE_MODELO.Clear;
  end;
end;

procedure TFOperacaoCad.DBRadioGroup28Change(Sender: TObject);
begin
  inherited;
  if DBRadioGroup28.ItemIndex = 1 then
    dbcbSegundaViaCupom.Checked := false;
  dbcbSegundaViaCupom.Enabled := (DBRadioGroup28.ItemIndex = 0);
end;

procedure TFOperacaoCad.BitBtn43Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_NOTA_SPED_CONTRIB.Value
      := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BitBtn47Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = MrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_FCCIA_DEB.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.BitBtn46Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = MrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_FCCIA_CRED.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFOperacaoCad.DBPanel18DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFinalidadeCons;
  Classe := TFFinalidadeCons;
end;

procedure TFOperacaoCad.FormCreate(Sender: TObject);
begin
  inherited;
  if PageControl1.ActivePage <> TabSheet1 then
    PageControl1.ActivePage := TabSheet1;
end;

procedure TFOperacaoCad.BitBtn48Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_SENAT_DEB.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.BitBtn49Click(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMOperacao.QOperacaoCOD_CONTABIL_SENAT_CRED.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFOperacaoCad.PageControl1Change(Sender: TObject);
begin
  inherited;
//  SBRefreshClick(sender);
end;

procedure TFOperacaoCad.DBLCCClasTribIBSCBSDropDown(Sender: TObject);
begin
  inherited;
  with DMProduto do
  begin
    QClassTribIBSCBS.Close;
    QClassTribIBSCBS.Open;
  end;
end;

end.
