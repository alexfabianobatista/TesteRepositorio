unit UBancoscad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, Grids, DBGrids, ImgList, OracleNavigator, Variants, ActnList,
  DBPanel, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TFBancosCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TS0Bancos: TTabSheet;
    TS1ContaCorrente: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    DBText1: TDBText;
    DBText2: TDBText;
    Label14: TLabel;
    DBText3: TDBText;
    BancosContaCorrente1: TMenuItem;
    Label16: TLabel;
    DBMemo1: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Label19: TLabel;
    GroupBox2: TGroupBox;
    Label20: TLabel;
    GroupBox3: TGroupBox;
    Label21: TLabel;
    GroupBox4: TGroupBox;
    Label17: TLabel;
    GroupBox5: TGroupBox;
    Label22: TLabel;
    GroupBox6: TGroupBox;
    Label23: TLabel;
    GroupBox7: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    DBEdit7: TDBEdit;
    Label33: TLabel;
    DBEdit14: TDBEdit;
    Label34: TLabel;
    DBEdit16: TDBEdit;
    Label35: TLabel;
    DBEdit17: TDBEdit;
    Label36: TLabel;
    DBEdit18: TDBEdit;
    Label37: TLabel;
    DBEdit19: TDBEdit;
    Label38: TLabel;
    DBEdit20: TDBEdit;
    Label39: TLabel;
    DBEdit21: TDBEdit;
    Label40: TLabel;
    DBEdit22: TDBEdit;
    Label41: TLabel;
    DBEdit23: TDBEdit;
    Label42: TLabel;
    DBEdit24: TDBEdit;
    Label44: TLabel;
    DBEdit26: TDBEdit;
    Label46: TLabel;
    DBEdit28: TDBEdit;
    Label47: TLabel;
    DBEdit29: TDBEdit;
    Label48: TLabel;
    DBEdit30: TDBEdit;
    Label49: TLabel;
    DBEdit31: TDBEdit;
    Label24: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label54: TLabel;
    DSContaCorrente: TDataSource;
    TabSheet2: TTabSheet;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    DBEdit40: TDBEdit;
    DBECarteira: TDBEdit;
    DBEComando: TDBEdit;
    DBNavigator2: TDBNavigator;
    PCInstr: TPageControl;
    TSCom1: TTabSheet;
    DBRGInstrCod: TDBRadioGroup;
    TSCom2: TTabSheet;
    DBRadioGroup4: TDBRadioGroup;
    TSCom3: TTabSheet;
    DBRadioGroup5: TDBRadioGroup;
    DBGrid2: TDBGrid;
    ECarteira: TEdit;
    EComando: TEdit;
    OraNavigator1: TOracleNavigator;
    TsCom4: TTabSheet;
    DBRadioGroup6: TDBRadioGroup;
    TsCom5: TTabSheet;
    DBRadioGroup7: TDBRadioGroup;
    TsCom6: TTabSheet;
    DBRadioGroup8: TDBRadioGroup;
    TsCom7: TTabSheet;
    DBRadioGroup9: TDBRadioGroup;
    TsCom8: TTabSheet;
    DBRadioGroup10: TDBRadioGroup;
    TsCom9: TTabSheet;
    DBRadioGroup11: TDBRadioGroup;
    TsCom10: TTabSheet;
    DBRadioGroup12: TDBRadioGroup;
    Label73: TLabel;
    DBEdNrDiasProtesto: TDBEdit;
    TsCom11: TTabSheet;
    DBRadioGroup13: TDBRadioGroup;
    TsCom12: TTabSheet;
    DBRadioGroup14: TDBRadioGroup;
    TabSheet3: TTabSheet;
    GroupBox8: TGroupBox;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    BtCodContabilPrincipal: TSpeedButton;
    BtCodContabilJuro: TSpeedButton;
    BtCodContabilDesconto: TSpeedButton;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    GroupBox9: TGroupBox;
    Label63: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    BtCodContabilPrincipalCred: TSpeedButton;
    BtCodContabilJuroCred: TSpeedButton;
    BtCodContabilDescontoDeb: TSpeedButton;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    Label76: TLabel;
    DBEdit58: TDBEdit;
    BtCodTaxaCred: TSpeedButton;
    DBEdit60: TDBEdit;
    Label77: TLabel;
    DBEdit59: TDBEdit;
    BtCodTaxaDeb: TSpeedButton;
    DBEdit61: TDBEdit;
    DBEdit52: TDBEdit;
    Label70: TLabel;
    BtCodContabilContrapartida: TSpeedButton;
    DBEdit53: TDBEdit;
    Label78: TLabel;
    DBEdit62: TDBEdit;
    BtInclusaoTaxa: TSpeedButton;
    DBEdit63: TDBEdit;
    Label79: TLabel;
    Label80: TLabel;
    pcContaCorrente: TPageControl;
    tsContaCorrente: TTabSheet;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    TabSheet5: TTabSheet;
    DBRadioGroup15: TDBRadioGroup;
    DBRadioGroup16: TDBRadioGroup;
    DBRadioGroup17: TDBRadioGroup;
    DBRadioGroup18: TDBRadioGroup;
    DBRadioGroup19: TDBRadioGroup;
    DBRadioGroup20: TDBRadioGroup;
    DBRadioGroup21: TDBRadioGroup;
    Label86: TLabel;
    DBEdit69: TDBEdit;
    DBRadioGroup22: TDBRadioGroup;
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
    DBPanel17: TDBPanel;
    DBPanel18: TDBPanel;
    DBRadioGroup23: TDBRadioGroup;
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
    DBPanel31: TDBPanel;
    DBPanel32: TDBPanel;
    TsCom13: TTabSheet;
    DBRadioGroup24: TDBRadioGroup;
    DBPanel33: TDBPanel;
    DBRGIdentBoleto: TDBRadioGroup;
    TabSheet4: TTabSheet;
    DsTaxaCartao: TDataSource;
    DBGrid3: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OracleNavigator1: TOracleNavigator;
    Label4: TLabel;
    Label5: TLabel;
    DBText5: TDBText;
    DBText4: TDBText;
    DBRadioGroup25: TDBRadioGroup;
    DBPanel34: TDBPanel;
    Label8: TLabel;
    Label9: TLabel;
    DBECodUsuario: TDBEdit;
    EdNomeUsuario: TEdit;
    Label10: TLabel;
    DBECodUsuario1: TDBEdit;
    EdNomeUsuario1: TEdit;
    Label11: TLabel;
    DBECodUsuario2: TDBEdit;
    EdNomeUsuario2: TEdit;
    BandeiradeCartoeTaxas1: TMenuItem;
    DBRGApiBoleto: TDBRadioGroup;
    TabSheet6: TTabSheet;
    dbChaveApiBoleto: TDBPanel;
    dbChaveHomAplicacao: TDBPanel;
    dbChaveProdAplicacao: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure BancosContaCorrente1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtCodContabilPrincipalClick(Sender: TObject);
    procedure BtCodContabilJuroClick(Sender: TObject);
    procedure BtCodContabilDescontoClick(Sender: TObject);
    procedure BtCodContabilFilialClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure DBECarteiraChange(Sender: TObject);
    procedure BtCodContabilPrincipalCredClick(Sender: TObject);
    procedure BtCodContabilJuroCredClick(Sender: TObject);
    procedure BtCodContabilDescontoDebClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtCodContabilContrapartidaClick(Sender: TObject);
    procedure DBEComandoChange(Sender: TObject);
    procedure DBRadioGroup9Click(Sender: TObject);
    procedure BtCodTaxaCredClick(Sender: TObject);
    procedure BtCodTaxaDebClick(Sender: TObject);
    procedure BtInclusaoTaxaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel19DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBRadioGroup25Click(Sender: TObject);
    procedure DBPanel34DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure SBRefreshClick(Sender: TObject);
    procedure OracleNavigator1BeforeAction(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure BandeiradeCartoeTaxas1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AtivaConfigAPI;
    procedure AjusteTextoAbaAPI;
  public
    { Public declarations }
  end;

var
  FBancosCad: TFBancosCad;

implementation

uses UBancoAgencia_cl, UEstadoCons, UEstado_cl, UBancosCons, UOracle_cl,
   UBancoCCorrenteParam, URBancoCCorrente, UFilialCons, UFilial_cl,
  UParamSistema_cl, UPlanoContaCons, UPlanoConta_cl, UUsuario_cl,
  UHistoricoCons, UHistorico_cl, UBancoAgenciaRel_cl, UBandeiraCartaoCons,
  URBandeiraCartaoTaxas, UBiblioteca;

{$R *.DFM}

procedure TFBancosCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMBancoAgencia.QBancoAgencia.Close;
  DMBancoAgencia.QBancoAgencia.Open;
  DMBancoAgencia.QContaCorrente.Close;
  DMBancoAgencia.QContaCorrente.Open;
  DMBancoAgencia.QTaxaCartao.Close;
  DMBancoAgencia.QTaxaCartao.Open;
  With DMBancoAgencia do
    Begin
      Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
        4: Begin
           QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Cred.EditMask := '#.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Deb.EditMask := '#.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Deb.EditMask := '#.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Deb.EditMask := '#.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Cred.EditMask := '#.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Cred.EditMask := '#.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Valor_Filial.EditMask := '#.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Contrapartida.EditMask := '#.##.##.######;0;';
           QBancoAgenciaCOD_Contabil_Vl_Taxa_Cred.EditMask := '#.##.##.######;0;';
           QBancoAgenciaCOD_Contabil_Vl_Taxa_Deb.EditMask := '#.##.##.######;0;';
           End;
        5: Begin
           QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Cred.EditMask := '#.##.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Deb.EditMask := '#.##.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Deb.EditMask := '#.##.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Deb.EditMask := '#.##.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Cred.EditMask := '#.##.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Cred.EditMask := '#.##.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Valor_Filial.EditMask := '#.##.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Contrapartida.EditMask := '#.##.##.##.######;0;';
           QBancoAgenciaCOD_Contabil_Vl_Taxa_Cred.EditMask := '#.##.##.##.######;0;';
           QBancoAgenciaCOD_Contabil_Vl_Taxa_Deb.EditMask := '#.##.##.##.######;0;';
           End;
        6: Begin
           QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Cred.EditMask := '#.##.##.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Deb.EditMask := '#.##.##.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Deb.EditMask := '#.##.##.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Deb.EditMask := '#.##.##.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Cred.EditMask := '#.##.##.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Cred.EditMask := '#.##.##.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Valor_Filial.EditMask := '#.##.##.##.##.######;0;';
           QBancoAgenciaCod_Contabil_Contrapartida.EditMask := '#.##.##.##.##.######;0;';
           QBancoAgenciaCOD_Contabil_Vl_Taxa_Cred.EditMask := '#.##.##.##.##.######;0;';
           QBancoAgenciaCOD_Contabil_Vl_Taxa_Deb.EditMask := '#.##.##.##.##.######;0;';
           End;
      End;
  End;

  AtivaConfigAPI;
end;

procedure TFBancosCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FBancosCons=Nil then
    FBancosCons:=TFBancosCons.Create(Application);
  If FBancosCons.ShowModal=mrOk then
    Begin
      With DMBancoAgencia do
        Begin
          QBancoAgencia.Close;
          QBancoAgencia.SetVariable('PK',QBancoAgenciaConsCod_Banco_Agencia.value);
          QBancoAgencia.Open;
          //QBancoAgenciaCons.Close;
        End;
    End;
 { EdNomeUsuario.Text := DMOracle.FastSelect('NOME','TB_USUARIO','COD_USUARIO = '+ DBECodUsuario.Text);
  EdNomeUsuario1.Text := DMOracle.FastSelect('NOME','TB_USUARIO','COD_USUARIO = '+ DBECodUsuario1.Text);
  if (DMBancoAgencia.QTaxaCartao.RecordCount > 0) then
    EdNomeUsuario2.Text := DMOracle.FastSelect('NOME','TB_USUARIO','COD_USUARIO = '+ DBECodUsuario2.Text);}
  SBRefreshClick(Sender);
end;

procedure TFBancosCad.SBConfirmarClick(Sender: TObject);
var
  wCodigo:Integer;
begin
  DmUsuario.Checar_Filial_Usuario(DMBancoAgencia.QContaCorrenteCOD_FILIAL.Text,'BANCOS');
  wCodigo:=DMBancoAgencia.QBancoAgenciaCod_Banco_Agencia.Value;
  inherited;
  if DSPrimario.DataSet.State = DsBrowse then
  begin
    Try
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.RollBack;
      raise exception.create('Erro! Transação não efetuada');
    end;
    DMBancoAgencia.QBancoAgencia.Close;
    DMBancoAgencia.QBancoAgencia.SetVariable('PK',wCodigo);
    DMBancoAgencia.QBancoAgencia.Open;
  end;
  SBRefreshClick(Sender);
end;

procedure TFBancosCad.SBCancelarClick(Sender: TObject);
var
  wCodigo:Integer;
begin
  wCodigo:=DMBancoAgencia.QBancoAgenciaCod_Banco_Agencia.Value;
  inherited;
  DMOracle.DBCemapa.Rollback;
  DMBancoAgencia.QBancoAgencia.Close;
  DMBancoAgencia.QBancoAgencia.SetVariable('PK',wCodigo);
  DMBancoAgencia.QBancoAgencia.Open;
end;

procedure TFBancosCad.BancosContaCorrente1Click(Sender: TObject);
begin
  inherited;
  If FBancoAgenciaParam=Nil then
    FBancoAgenciaParam:=TFBancoAgenciaParam.Create(Application);
  FBancoAgenciaParam.PGRelatorio.Pages[0].TabVisible:=True;
  If FBancoAgenciaParam.ShowModal=mrOk then
    Begin
      With DMBancoAgenciaRel do
       Begin
          QRBancoCC.Close;
          if FBancoAgenciaParam.RG0Situacao.ItemIndex = 0 then
            DMBancoAgenciaRel.QRBancoCC.SetVariable('IND_SITUACAO',null);
          if FBancoAgenciaParam.RG0Situacao.ItemIndex = 1 then
            DMBancoAgenciaRel.QRBancoCC.SetVariable('IND_SITUACAO','ATIVO');
          if FBancoAgenciaParam.RG0Situacao.ItemIndex = 2 then
            DMBancoAgenciaRel.QRBancoCC.SetVariable('IND_SITUACAO','INATIVO');
          QRBancoCC.Open;
       End;
       If FRBancoCCorrente=Nil then
      FRBancoCCorrente:=TFRBancoCCorrente.Create(Application);

      If FBancoAgenciaParam.RGPreview.ItemIndex=0 then
        FRBancoCCorrente.QRPrimario.Preview
      Else
        FRBancoCCorrente.QRPrimario.Print;
      DMBancoAgenciaRel.QRBancoCC.Close;
    End;
end;

procedure TFBancosCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State  in [dsinsert,dsedit] then
   Begin
    BtCodContabilPrincipal.Enabled:=True;
    BtCodContabilJuro.Enabled:=True;
    BtCodContabilDesconto.Enabled:=True;
    BtCodContabilPrincipalCred.Enabled:=True;
    BtCodContabilJuroCred.Enabled:=True;
    BtCodContabilDescontoDeb.Enabled:=True;
    BtCodContabilContrapartida.Enabled:=True;
    BtInclusaoTaxa.Enabled:=True;
    BtCodTaxaCred.Enabled:=True;
    BtCodTaxaDeb.Enabled:=True;
   End
  Else
   Begin
    BtCodContabilPrincipal.Enabled:=False;
    BtCodContabilJuro.Enabled:=False;
    BtCodContabilDesconto.Enabled:=False;
    BtCodContabilPrincipalCred.Enabled:=False;
    BtCodContabilJuroCred.Enabled:=False;
    BtCodContabilDescontoDeb.Enabled:=False;
    BtCodContabilContrapartida.Enabled:=False;
    BtInclusaoTaxa.Enabled:=False;
    BtCodTaxaCred.Enabled:=False;
    BtCodTaxaDeb.Enabled:=False;
   End;

   AtivaConfigAPI;
end;

procedure TFBancosCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.Showmodal=mrOk then
    DMBancoAgencia.QContaCorrenteCod_filial.Value:=DMFilial.QFilialConsCod_filial.Value;
end;

procedure TFBancosCad.FormShow(Sender: TObject);
begin
  inherited;
  SBRefreshClick(Self); { comentado para que não de erro ao atualizar o usuário que fez a ultima alteração no registro, pois quando a tela é aberta o campo não
esta preenchido. Alex 07/07/2023.}
end;

procedure TFBancosCad.BtCodContabilPrincipalClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
      DMBancoAgencia.QBancoAgenciaCOD_CONTABIL_VL_PRIN_BCO_DEB.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFBancosCad.BtCodContabilJuroClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
      DMBancoAgencia.QBancoAgenciaCOD_CONTABIL_VL_JURO_BCO_DEB.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFBancosCad.BtCodContabilDescontoClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
      DMBancoAgencia.QBancoAgenciaCOD_CONTABIL_VL_DESC_BCO_CRED.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFBancosCad.BtCodContabilFilialClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
      DMBancoAgencia.QBancoAgenciaCOD_CONTABIL_VALOR_FILIAL.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFBancosCad.TabSheet2Show(Sender: TObject);
var
  i:integer;
begin
  inherited;

  for i:=0 to PCInstr.PageCount-1 do  //Robson 26/06/2000 revisado 04/07/2002 Sergio
  begin
    PCInstr.Pages[i].TabVisible:=False;
  end;

  If DMBancoAgencia.QBancoAgenciaCOD_BANCO.Value = 748 then
  Begin
    PCInstr.Pages[10].TabVisible:=True; //Primeira Instrucao Sicredi
    PCInstr.Pages[11].TabVisible:=True;
  End;

  If DMBancoAgencia.QBancoAgenciaCOD_BANCO.Value = 756 then
  Begin
    PCInstr.Pages[12].TabVisible:=True; //Primeira Instrucao Sicoob
  End;

  If DMBancoAgencia.QBancoAgenciaCOD_BANCO.Value = 399 then
  Begin
    PCInstr.Pages[3].TabVisible:=True; //Primeira Instrucao HSBC
    PCInstr.Pages[4].TabVisible:=True;
    PCInstr.Pages[5].TabVisible:=True;
  End;

  If DMBancoAgencia.QBancoAgenciaCOD_BANCO.Value = 341 then
  Begin
    PCInstr.Pages[6].TabVisible:=True; //Primeira Instrucao Itau
    PCInstr.Pages[7].TabVisible:=True;
    PCInstr.Pages[8].TabVisible:=True;
    PCInstr.Pages[9].TabVisible:=True;
  End;

  If DMBancoAgencia.QBancoAgenciaCOD_BANCO.Value = 1 then
  Begin
    DBEComando.Visible:= true;
    EComando.Visible:= true;
    Label61.Visible:= true;
    if DBEComando.Text = '1' then
      PCInstr.Pages[0].TabVisible:=True
    else
      if DBEComando.Text = '2'then
        PCInstr.Pages[1].TabVisible:=True
      else
        if DBEComando.Text = '9' then
           PCInstr.Pages[2].TabVisible:=True;
  end //fim if DMBancoAgencia.QBancoAgenciaConsCOD_BANCO.Value = 1
  Else
  Begin
    DBEComando.Visible:= false;
    EComando.Visible:= false;
    Label61.Visible:= false;
  End;
end;

procedure TFBancosCad.DBECarteiraChange(Sender: TObject);
Var
  Carteira:Integer;
begin
  inherited;
  Carteira:=0;    // INICIALIZA VALOR PARA VARIAVEL - Robson 26/06/2000
  Try
    if Trim(DBECarteira.text)<>'' then
      Carteira:=StrToInt(DBECarteira.text);
  except
    Carteira:=0;
  end;

  If DMBancoAgencia.QBancoAgenciaCOD_BANCO.Value = 1 then
  Begin
    Case Carteira of
      11:ECarteira.Text:='Cobrança Simples';
      12:ECarteira.Text:='Cobrança Simples em Unidades Variáveis';
      13:ECarteira.Text:='Cobrança Direta Administrada';
      15:ECarteira.Text:='Cobrança de Prêmios de Seguro';
      17:ECarteira.Text:='Cobrança Direta Especial';
      31:ECarteira.Text:='Cobrança Caucionada/Vinculada';
      51:ECarteira.Text:='Cobrança Descontada';
      54:ECarteira.Text:='Cobrança BB-Vendor';
    else
      ECarteira.text:='Opção inválida ou em Branco';
    end;
  End;

  If DMBancoAgencia.QBancoAgenciaCOD_BANCO.Value = 399 then
  Begin
    Case Carteira of
      1:ECarteira.Text:='Cobrança Simples';
      3:ECarteira.Text:='Garantias de Operações';
      4:ECarteira.Text:='Desconto Suspenso (Somente Retorno)';
    else
      ECarteira.text:='Opção inválida ou em Branco';
    end;
  End;

  If DMBancoAgencia.QBancoAgenciaCOD_BANCO.Value = 756 then
  Begin
    Case Carteira of
      1:ECarteira.Text:='Simples com registro';
      3:ECarteira.Text:='Garantida caucionada';
    else
      ECarteira.text:='Opção inválida ou em Branco';
    end;
  End;

  If DMBancoAgencia.QBancoAgenciaCOD_BANCO.Value = 341 then
  Begin
    Case Carteira of
      112,212:ECarteira.Text:='ESCRITURAL ELETRÔNICA - SIMPLES / CONTRATUAL';
      104:ECarteira.Text:='ESCRITURAL ELETRÔNICA - CARNÊ';
      147:ECarteira.Text:='ESCRITURAL ELETRÔNICA - DÓLAR';
      105:ECarteira.Text:='ESCRITURAL ELETRÔNICA - DÓLAR - CARNÊ';
      114:ECarteira.Text:='ESCRITURAL ELETRÔNICA - SEGUROS';
      166:ECarteira.Text:='ESCRITURAL ELETRÔNICA - TR';
      113:ECarteira.Text:='ESCRITURAL ELETRÔNICA - TR - CARNÊ';
      108:ECarteira.Text:='DIRETA ELETRÔNICA EMISSÃO INTEGRAL - CARNÊ';
      109,110,111:ECarteira.Text:='DIRETA ELETRÔNICA SEM EMISSÃO - SIMPLES';
      210:ECarteira.Text:='DIRETA ELETRÔNICA SEM EMISSÃO - CONTRATUAL';
      168:ECarteira.Text:='DIRETA ELETRÔNICA SEM EMISSÃO -TR';
      150:ECarteira.Text:='DIRETA ELETRÔNICA SEM EMISSÃO - DÓLAR';
      126:ECarteira.Text:='DIRETA ELETRÔNICA SEM EMISSÃO -SEGUROS';
      121,221:ECarteira.Text:='DIRETA ELETRÔNICA EMISSÃO PARCIAL - SIMPLES/CONTRATUAL';
      180,280:ECarteira.Text:='DIRETA ELETRÔNICA EMISSÃO INTEGRAL SIMPLES/CONTRATUAL';
      175:ECarteira.Text:='SEM REGISTRO SEM EMISSÃO';
      198:ECarteira.Text:='SEM REGISTRO SEM EMISSÃO 15 DÍGITOS';
      122:ECarteira.Text:='SEM REGISTRO SEM EMISSÃO 15 DÍGITOS COM IOF 2%';
      142:ECarteira.Text:='SEM REGISTRO SEM EMISSÃO 15 DÍGITOS COM IOF 4%';
      143:ECarteira.Text:='SEM REGISTRO SEM EMISSÃO 15 DÍGITOS COM IOF 7%';
      179:ECarteira.Text:='SEM REGISTRO SEM EMISSÃO COM PROTESTO ELETRÔNICO';
      174:ECarteira.Text:='SEM REGISTRO EMISSÃO PARCIAL COM PROTESTO BORDERÔ';
      177:ECarteira.Text:='SEM REGISTRO EMISSÃO PARCIAL COM PROTESTO ELETRÔNICO';
      120:ECarteira.Text:='SEM REGISTRO EMISSÃO INTEGRAL COM IOF 2% - CARNÊ';
      129:ECarteira.Text:='SEM REGISTRO EMISSÃO PARCIAL SEGUROS COM IOF 2%';
      139:ECarteira.Text:='SEM REGISTRO EMISSÃO PARCIAL SEGUROS COM IOF 4%';
      169:ECarteira.Text:='SEM REGISTRO EMISSÃO PARCIAL SEGUROS COM IOF 7%';
      140:ECarteira.Text:='SEM REGISTRO EMISSÃO INTEGRAL COM IOF 4% - CARNÊ';
      141:ECarteira.Text:='SEM REGISTRO EMISSÃO INTEGRAL COM IOF 7% - CARNÊ';
      172:ECarteira.Text:='SEM REGISTRO COM EMISSÃO INTEGRAL';
      102:ECarteira.Text:='SEM REGISTRO COM EMISSÃO INTEGRAL - CARNÊ';
      195:ECarteira.Text:='SEM REGISTRO COM EMISSÃO INTEGRAL - 15 POSIÇÕES';
      107:ECarteira.Text:='SEM REGISTRO COM EMISSÃO INTEGRAL - 15 POSIÇÕES - CARNÊ';
      173:ECarteira.Text:='SEM REGISTRO COM EMISSÃO E ENTREGA';
      103:ECarteira.Text:='SEM REGISTRO COM EMISSÃO E ENTREGA - CARNÊ';
      196:ECarteira.Text:='SEM REGISTRO COM EMISSÃO E ENTREGA - 15 POSIÇÕES';
      106:ECarteira.Text:='SEM REGISTRO COM EMISSÃO E ENTREGA - 15 POSIÇÕES - CARNÊ';
    else
      ECarteira.text:='Opção inválida ou em Branco';
    end;
  End;
end;

procedure TFBancosCad.BtCodContabilPrincipalCredClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
    DMBancoAgencia.QBancoAgenciaCOD_CONTABIL_VL_PRIN_BCO_CRED.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFBancosCad.BtCodContabilJuroCredClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
    DMBancoAgencia.QBancoAgenciaCOD_CONTABIL_VL_JURO_BCO_CRED.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFBancosCad.BtCodContabilDescontoDebClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
    DMBancoAgencia.QBancoAgenciaCOD_CONTABIL_VL_DESC_BCO_DEB.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFBancosCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(5);
end;

procedure TFBancosCad.SBExcluirClick(Sender: TObject);
begin
//inherited;
  if not DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.StartTransaction;
  try
    DSPrimario.DataSet.Delete;
    DMOracle.DBCemapa.Commit;
  except
    raise exception.Create('Não foi possivel excluir registro!');
  end;
end;

procedure TFBancosCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FBancosCad := Nil;
end;

procedure TFBancosCad.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  DMBancoAgencia.QContaCorrente.Close;
  DMBancoAgencia.QBancoAgencia.Close;
end;

procedure TFBancosCad.BtCodContabilContrapartidaClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
      DMBancoAgencia.QBancoAgenciaCOD_CONTABIL_CONTRAPARTIDA.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFBancosCad.DBEComandoChange(Sender: TObject);
var
  i,com:integer;
begin
  inherited;
  for i:=0 to PCInstr.PageCount-1 do
  begin
    PCInstr.Pages[i].TabVisible:=False;
  end;

  com:= 0;

    Try
      if Trim(DBEComando.text)<>'' then
        Com:=StrToInt(DBEComando.text);
    except
      Com:=0;
    end;

    if DBEComando.Text = '1' then
      PCInstr.Pages[0].TabVisible:=True
    else
      if DBEComando.Text = '2'then
        PCInstr.Pages[1].TabVisible:=True
      else
        if DBEComando.Text = '9' then
           PCInstr.Pages[2].TabVisible:=True;


    Case Com of
      1:EComando.Text:='Registro de títulos';
      2:EComando.Text:='Solicitação de Baixa';
      3:EComando.Text:='Pedido de débito em conta';
      4:EComando.Text:='Concessão de abatimento';
      5:EComando.Text:='Cancelamento de abatimento';
      6:EComando.Text:='Alteração de vcto de título';
      7:EComando.Text:='Alteração do número de controle do participante';
      8:EComando.Text:='Alteração do número do título dado pelo cedente';
      9:EComando.Text:='Instrução para protestar';
      10:EComando.Text:='Instrução para sustar protesto';
      11:EComando.Text:='Instrução para dispensar juros';
      12:EComando.Text:='Alteração de nome e endereço do sacado';
    else
      EComando.text:='Opção inválida ou em Branco';
    end;
    DBECarteiraChange(Self);

end;

procedure TFBancosCad.DBRadioGroup9Click(Sender: TObject);
begin
  inherited;
  If DBRadioGroup9.ItemIndex in [8..11] then
  Begin
    DBEdNrDiasProtesto.Visible := true;
    Label73.Visible := True;
    DBEdNrDiasProtesto.setfocus;
  End
  Else
  Begin
    DBEdNrDiasProtesto.Visible := false;
    Label73.Visible := false;
    DMBancoAgencia.QContaCorrenteNR_DIAS_PROTESTO.Value := 0;
  End;
end;

procedure TFBancosCad.BtCodTaxaCredClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
      DMBancoAgencia.QBancoAgenciaCOD_CONTABIL_VL_TAXA_CRED.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFBancosCad.BtCodTaxaDebClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
      DMBancoAgencia.QBancoAgenciaCOD_CONTABIL_VL_TAXA_DEB.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;

end;

procedure TFBancosCad.BtInclusaoTaxaClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
      DMBancoAgencia.QBancoAgenciaCOD_HISTORICO_CAIXA_TAXA.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;

end;

procedure TFBancosCad.FormCreate(Sender: TObject);
begin
  inherited;
  pcContaCorrente.ActivePage := tsContaCorrente;

  Bib.addControleCharCase(dbChaveApiBoleto, Self.Name);
  Bib.addControleCharCase(dbChaveProdAplicacao, Self.Name);
  Bib.addControleCharCase(dbChaveHomAplicacao, Self.Name);

end;

procedure TFBancosCad.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FEstadoCons;
  Classe := TFEstadoCons;
end;

procedure TFBancosCad.DBPanel19DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFBancosCad.DBRadioGroup25Click(Sender: TObject);
var
wBancoPadrao : integer;
begin
  inherited;
  If DMBancoAgencia.QBancoAgenciaCOD_BANCO_AGENCIA.Text <> '' then
    if StrToInt(DMOracle.BuscaNome('SELECT count(*) FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA ='+
                                       DMBancoAgencia.QBancoAgenciaCOD_BANCO_AGENCIA.Text)) > 0 then
    Begin
      wBancoPadrao := 0;
      wBancoPadrao := StrToInt(DMOracle.BuscaNome('SELECT count(*) FROM TB_BANCO_AGENCIA',' IND_BANCO_PADRAO = ''SIM'''));

      If ((wBancoPadrao = 1) and (DBRadioGroup25.ItemIndex = 0)) then
      Begin
        DBRadioGroup25.ItemIndex := 1;
        //DBEdit1.SetFocus;
        showMessage('Só pode ter 1 banco padrão! Altere o outro cadastro de banco para NÃO para poder realizar essa operação!');
      end;
    end;
end;

procedure TFBancosCad.DBPanel34DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FBandeiraCartaoCons;
  Classe := TFBandeiraCartaoCons;
end;

procedure TFBancosCad.SBRefreshClick(Sender: TObject);
begin
  inherited;
  if trim(DBECodUsuario.Text) <> '' then
    EdNomeUsuario.Text := DMOracle.FastSelect('NOME','TB_USUARIO','COD_USUARIO = '+ DBECodUsuario.Text);
  if Trim(DBECodUsuario1.Text) <> '' then
    EdNomeUsuario1.Text := DMOracle.FastSelect('NOME','TB_USUARIO','COD_USUARIO = '+ DBECodUsuario1.Text);
  if not (DMBancoAgencia.QTaxaCartao.State in [dsInactive]) then
    if (DMBancoAgencia.QTaxaCartao.RecordCount > 0) then
      EdNomeUsuario2.Text := DMOracle.FastSelect('NOME','TB_USUARIO','COD_USUARIO = '+ DBECodUsuario2.Text)
  else
    EdNomeUsuario2.Text := '';
end;

procedure TFBancosCad.OracleNavigator1BeforeAction(Sender: TObject;
  Button: TOracleNavigateBtn);
var wCod: string;
begin
  inherited;
  if (Button = nbPost) then
  begin
    wCod := IntToStr(DMUsuario.CodUsuarioCorrente);
    EdNomeUsuario2.Text := DMOracle.FastSelect('NOME','TB_USUARIO','COD_USUARIO = '+ wCod);
  end
  else
    EdNomeUsuario2.Text := '';
end;

procedure TFBancosCad.BandeiradeCartoeTaxas1Click(Sender: TObject);
begin
  inherited;
  If FBancoAgenciaParam=Nil then
    FBancoAgenciaParam:=TFBancoAgenciaParam.Create(Application);
  FBancoAgenciaParam.PGRelatorio.Pages[7].TabVisible:=True;
  If FBancoAgenciaParam.ShowModal=mrOk then
  begin
    with DMBancoAgencia do
    begin
      QRBandeiraTaxa.Close;
      if (FBancoAgenciaParam.RG7TipoCartao.ItemIndex = 0) then
        QRBandeiraTaxa.SetVariable('DESC_PARCELAMENTO','CREDITO');
      if (FBancoAgenciaParam.RG7TipoCartao.ItemIndex = 1) then
        QRBandeiraTaxa.SetVariable('DESC_PARCELAMENTO','DEBITO');
      if (FBancoAgenciaParam.RG7TipoCartao.ItemIndex = 2) then
        QRBandeiraTaxa.SetVariable('DESC_PARCELAMENTO',null);
      QRBandeiraTaxa.Open;
    end;
    if FRBandeiraCartaoTaxas = Nil then
      FRBandeiraCartaoTaxas := TFRBandeiraCartaoTaxas.Create(Application);
    FRBandeiraCartaoTaxas.QRPrimario.Preview;
  end;
end;

procedure TFBancosCad.AtivaConfigAPI;
begin 
  if DBRGApiBoleto.ItemIndex >= 0 then
  begin
    if DBRGApiBoleto.Items[DBRGApiBoleto.ItemIndex] = 'SIM' then
    begin
      TabSheet6.TabVisible := True;
      AjusteTextoAbaAPI;
    end
    else
      TabSheet6.TabVisible := False;
  end;
end;

procedure TFBancosCad.AjusteTextoAbaAPI;
begin
   with DMBancoAgencia do
   begin
    case QBancoAgenciaCOD_BANCO.Value of
      748 :
        begin
          dbChaveApiBoleto.LCaption := 'Código de Acesso da Conta';
          dbChaveHomAplicacao.LCaption := 'Chave Homologação Aplicação';
          dbChaveProdAplicacao.LCaption := 'Chave Produção Aplicação';
        end;
      133 :
        begin
          dbChaveApiBoleto.LCaption := 'Usuário';
          dbChaveHomAplicacao.LCaption := 'Senha';
          dbChaveProdAplicacao.LCaption := 'Não Utilizar';
        end;
     else
       begin
         dbChaveApiBoleto.LCaption := 'Código de Acesso da Conta';
         dbChaveHomAplicacao.LCaption := 'Chave Homologação Aplicação';
         dbChaveProdAplicacao.LCaption := 'Chave Produção Aplicação';
       end;
     end;

   end;
end;

end.
